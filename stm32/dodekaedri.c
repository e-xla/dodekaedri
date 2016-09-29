#include <stm32f4xx.h>
#include <stm32f4xx_spi.h>
#include <stm32f4xx_rcc.h>
#include <stm32f4xx_gpio.h>
#include <stm32f4xx_i2c.h>
#include <stm32f4xx_usart.h>

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


int main() {
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

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

	uint16_t audio = 0;
	for(;;) {
		while(!SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE));
		SPI_I2S_SendData(SPI2, audio);
		SPI_I2S_SendData(SPI3, -audio);
		SPI_I2S_SendData(SPI1, 0x55);
		audio += 1234;
	}
	return 0;
}


void _exit(__attribute__((unused)) int asdf) {
	for(;;);
}
