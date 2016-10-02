#include <stm32f4xx.h>
#include <stm32f4xx_spi.h>
#include <stm32f4xx_rcc.h>
#include <stm32f4xx_gpio.h>
#include <stm32f4xx_i2c.h>
#include <stm32f4xx_usart.h>
#include <arm_math.h>

#include "uart.h"
#include "i2c.h"
#include "synth.h"
#include "audio.h"
#include "display.h"

void SystemInit() {
}


void assert_failed(uint8_t *file, uint32_t line) {
	print("\r\nAssert failed: ");
	print((char*)file);
	print(" ");
	printdec(line);
	print("\r\n");
}

// GPIO to use for random tests during development
#define DEV_GPIO GPIOC
#define DEV_PIN GPIO_Pin_3

int gainl = 10, gainr = 10;

int main() {
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

	GPIO_Init(DEV_GPIO, &(GPIO_InitTypeDef) {
		.GPIO_Pin = DEV_PIN,
		.GPIO_Mode = GPIO_Mode_OUT,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_UP
	});

	uart_init();

	i2c_init();
	synth_init();

	display_init();

	// Main PLL and I2S PLL initialization
	RCC_PLLI2SCmd(DISABLE); // PLLI2SConfig should be called with PLLI2S disabled

	// PLLI2S clock source is common with main PLL configured with RCC_PLLConfig.
	// Using 26 MHz clock input (HSE)
	RCC_HSEConfig(RCC_HSE_Bypass);
	print("Waiting for HSE\r\n");
	RCC_WaitForHSEStartUp();
	print("HSE started up\r\n");

	RCC_PLLConfig(RCC_PLLSource_HSE, 13, 50, 2, 4);
	RCC_PLLCmd(ENABLE);

	RCC_I2SCLKConfig(RCC_I2S2CLKSource_PLLI2S);
	RCC_PLLI2SConfig(72,3);
	RCC_PLLI2SCmd(ENABLE);

	print("Waiting for PLLI2S\r\n");
	while(!RCC_GetFlagStatus(RCC_FLAG_PLLI2SRDY));
	print("PLLI2S ready\r\n");

	// Initialize I2S and audio DAC/ADC
	audio_init_converters();
	audio_init_bus();

	writecommand(0x2A); // column address set
	writedata(0);
	writedata(0);
	writedata(0);
	writedata(128);
	writecommand(0x2B); // row address set
	writedata(0);
	writedata(0);
	writedata(0);
	writedata(240);
	writecommand(0x2C); // memory write

	int y;
	for(y = 0; y < 240; y++) {
		int x;
		for(x = 0; x < 128; x++) {
			writedata(x ^ y);
		}
	}
#define FIRLEN 131
#if 0
	q15_t firbuf[2*FIRLEN];
	q15_t filtertapsr[FIRLEN] = {-5799,-8143,-10073,-11233,-11315,-10104,-7508,-3581,1473,7319,13513,19552,24919,29141,31839,32767,31839,29141,24919,19552,13513,7319,1473,-3581,-7508,-10104,-11315,-11233,-10073,-8143,-5799};
	q15_t filtertapsi[FIRLEN] = {571,-964,-3493,-6884,-10880,-15121,-19182,-22611,-24984,-25951,-25282,-22893,-18863,-13434,-6986,0,6986,13434,18863,22893,25282,25951,24984,22611,19182,15121,10880,6884,3493,964,-571};
	q15_t *firp = firbuf;
	int firidx = 0;
#endif
	// transmit some data so the transfer gets started
	SPI_I2S_SendData(SPI2, 0x5555);

	int16_t atxl = 0x8000, atxr = 0x8000;
	for(;;) {
		int16_t arxl=0, arxr=0;
		int64_t outr, outi;
		for(;;) {
			DEV_GPIO->ODR &= ~DEV_PIN;
			while(!SPI_I2S_GetFlagStatus(I2S2ext, SPI_I2S_FLAG_RXNE));
			DEV_GPIO->ODR |= DEV_PIN;

			if(SPI_I2S_GetFlagStatus(SPI2, I2S_FLAG_CHSIDE)) {
				SPI_I2S_SendData(SPI2, atxr);
			} else {
				SPI_I2S_SendData(SPI2, atxl);
			}

			if(SPI_I2S_GetFlagStatus(I2S2ext, I2S_FLAG_CHSIDE)) {
				arxr = SPI_I2S_ReceiveData(SPI2);
				break;
			} else {
				arxl = SPI_I2S_ReceiveData(SPI2);
			}
		}

#if 0
		// "circular buffer"
		firp[0] = firp[FIRLEN] = arxl;
		(void)arxr;
		firidx++;
		if(firidx >= FIRLEN) firidx = 0;
		firp = firbuf;

		// dot product of complex and real vectors
		arm_dot_prod_q15(filtertapsr, firp, FIRLEN, &outr);
		arm_dot_prod_q15(filtertapsi, firp, FIRLEN, &outi);

		// scale and saturate
		outr >>= 40;
		outi >>= 40;
#else
		outr = gainl * arxl;
		outi = gainr * arxr;
#endif
		if(outr > 0x7FFF) outr = 0x7FFF;
		else if(outr < -0x8000) outr = -0x8000;
		if(outi > 0x7FFF) outi = 0x7FFF;
		else if(outi < -0x8000) outi = -0x8000;

		atxl = outr;
		atxr = outi;
	}
	return 0;
}


void _exit(__attribute__((unused)) int asdf) {
	for(;;);
}
