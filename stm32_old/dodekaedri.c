#include <stm32f4xx.h>
#include <stm32f4xx_spi.h>
#include <stm32f4xx_rcc.h>
#include <stm32f4xx_flash.h>
#include <stm32f4xx_gpio.h>
#include <stm32f4xx_i2c.h>
#include <stm32f4xx_usart.h>
#include <misc.h>

#include "dodekaedri.h"
#include "uart.h"
#include "i2c.h"
#include "synth.h"
#include "audio.h"
#include "display.h"
#include "dsp.h"


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
	int c;
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

	/* Divide by 13 to get 2 MHz to main PLL and PLLI2S.
	   Multiply by 84 and divide by 2 to get 84 MHz PLLCLK.
	   AHB prescaler is 1  => 84 MHz CPU clock (maximum allowed),
	   APB1 prescaler is 2 => 42 MHz PCLK1 (maximum allowed).
	   APB2 prescaler is 1 => 84 MHz PCLK2.
	   The CPU clock frequency needs 2 flash wait states
	   but we will use prefetch and cache to speed it up. */
	RCC_PLLConfig(RCC_PLLSource_HSE, 13, 84, 2, 4);
	RCC_PLLCmd(ENABLE);

	RCC_I2SCLKConfig(RCC_I2S2CLKSource_PLLI2S);
	RCC_PLLI2SConfig(72,3);
	RCC_PLLI2SCmd(ENABLE);

	RCC_HCLKConfig(RCC_SYSCLK_Div1); // AHB
	RCC_PCLK1Config(RCC_HCLK_Div2);  // APB1
	RCC_PCLK2Config(RCC_HCLK_Div1);  // APB2

	FLASH_SetLatency(FLASH_Latency_2);
	FLASH_PrefetchBufferCmd(ENABLE);
	FLASH_InstructionCacheCmd(ENABLE);
	FLASH_DataCacheCmd(ENABLE);

	print("Waiting for PLL and PLLI2S\r\n");
	c = 0;
	while(!RCC_GetFlagStatus(RCC_FLAG_PLLRDY)) c++;
	printdec(c);
	print(" PLL ready. Switching system clock\r\n");
	uart_deinit();
	RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);

	// reinitialize UART for new clock frequency
	uart_init();
	//if hardware i2c, reinitialize here!!!
	//i2c_init();
	print("System clock switched\r\n");

	c = 0;
	while(!RCC_GetFlagStatus(RCC_FLAG_PLLI2SRDY)) c++;
	printdec(c);
	print(" PLLI2S ready\r\n");

	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	NVIC_Init(&(NVIC_InitTypeDef) {
		.NVIC_IRQChannel = SPI2_IRQn,
		.NVIC_IRQChannelPreemptionPriority = 1,
		.NVIC_IRQChannelSubPriority = 0,
		.NVIC_IRQChannelCmd = ENABLE
	});

	// Initialize I2S and audio DAC/ADC
	audio_init_converters();
	audio_init_bus();

	int t;
	for(t=0;;t++) {
		writecommand(0x2A); // column address set
		writedata(0);
		writedata(0);
		writedata(0);
		writedata(128);
		writecommand(0x2B); // row address set
		writedata(0);
		writedata(0);
		writedata(0);
		writedata(160);
		writecommand(0x2C); // memory write

		int y;
		for(y = 0; y < 160; y++) {
			int x;
			for(x = 0; x < 128; x++) {
				writedata((x + t) ^ y);
				writedata(t ^ (y + t));
			}
		}
	}
	return 0;
}


void _exit(__attribute__((unused)) int asdf) {
	for(;;);
}


void HardFault_Handler() {
	for(;;) {
		DEV_GPIO->ODR ^= DEV_PIN;
		USART1->DR = 'H';
	}
}

void BusFault_Handler() {
	for(;;) {
		DEV_GPIO->ODR ^= DEV_PIN;
		USART1->DR = 'B';
	}
}

void UsageFault_Handler() {
	for(;;) {
		DEV_GPIO->ODR ^= DEV_PIN;
		USART1->DR = 'U';
	}
}
