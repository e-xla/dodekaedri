#include <stm32f4xx.h>
#include <stm32f4xx_spi.h>
#include <stm32f4xx_gpio.h>

#include "display.h"

#define TFT_SPI SPI1
#define TFT_CS_GPIO GPIOB
#define TFT_CS_Pin GPIO_Pin_6
#define TFT_DC_Pin GPIO_Pin_4

void tft_send(uint8_t *bytes, int n, int dc) {
	int i;
	if(dc) // data
		TFT_CS_GPIO->ODR |= TFT_DC_Pin;
	else // command
		TFT_CS_GPIO->ODR &= ~TFT_DC_Pin;
	TFT_CS_GPIO->ODR &= ~TFT_CS_Pin;
	for(i = 0; i < n; i++) {
		while(!SPI_I2S_GetFlagStatus(TFT_SPI, SPI_I2S_FLAG_TXE));
		SPI_I2S_SendData(TFT_SPI, bytes[i]);
	}
	while(SPI_I2S_GetFlagStatus(TFT_SPI, SPI_I2S_FLAG_BSY));
	TFT_CS_GPIO->ODR |= TFT_CS_Pin;
}


/* Functions used by the Adafruit TFT library for Arduino: */
void writecommand(uint8_t v) {
	tft_send(&v, 1, 0);
	/*print("TFT command: ");
	printhex(v);
	print("\r\n");*/
}

void writedata(uint8_t v) {
	tft_send(&v, 1, 1);
}

void delay(int ms) {
	// some delay
	return; // is the delay necessary?
	int i, j;
	for(i = 0; i < ms; i++) {
		for(j = 0; j < 5000; j++) __asm("nop");
	}
}
#include "tft/tft.h"



void display_init() {
	// SPI1 initialization
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource5, GPIO_AF_SPI1);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource6, GPIO_AF_SPI1);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource7, GPIO_AF_SPI1);
	GPIO_Init(GPIOA, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});

	GPIO_Init(TFT_CS_GPIO, &(GPIO_InitTypeDef) {
		.GPIO_Pin = TFT_CS_Pin | TFT_DC_Pin,
		.GPIO_Mode = GPIO_Mode_OUT,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});

	SPI_Init(SPI1, &(SPI_InitTypeDef) {
		.SPI_Direction = SPI_Direction_1Line_Tx,
		.SPI_Mode = SPI_Mode_Master,
		.SPI_DataSize = SPI_DataSize_8b,
		.SPI_CPOL = SPI_CPOL_Low,
		.SPI_CPHA = SPI_CPHA_1Edge,
		.SPI_NSS = SPI_NSS_Soft,
		.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2,
		.SPI_FirstBit = SPI_FirstBit_MSB,
		.SPI_CRCPolynomial = 7 // default value
	});
	SPI_Cmd(SPI1, ENABLE);

	// Initialize display
	Adafruit_ST7735_commandList(Rcmd1);
	Adafruit_ST7735_commandList(Rcmd2red);
	Adafruit_ST7735_commandList(Rcmd3);
}

