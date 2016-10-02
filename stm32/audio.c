#include <stm32f4xx.h>
#include <stm32f4xx_spi.h>
#include <stm32f4xx_i2c.h>
#include <stdint.h>
#include "audio.h"
#include "i2c.h"

const uint8_t addr_rfc = 0x1A;   // WM8731 used for zero-IF signal
const uint8_t addr_afc = 0x1B;   // WM8731 used for microphone and headphone audio

void audio_init_converters() {
	// The WM8731 registers have 7-bit addresses and 9-bit data
	// so the highest data bit of each register
	// is in lowest bit of the first byte.
	#define RFC_INIT_SIZE 11
	const uint8_t rfc_init[RFC_INIT_SIZE][2] = {
	{0x1E, 0x00}, // reset it first
	{0x00, 0x1F}, // maximum L line input volume, no mute
	{0x02, 0x1F}, // maximum R line input volume, no mute
	{0x04, 0x7F-6}, // 0 dB headphone gain
	{0x06, 0x7F-6}, // 0 dB headphone gain
	{0x08, 0x12}, // select DAC, select line in to ADC, mute mic input
	{0x0A, 0x01}, // disable ADC HPF and deemphasis
	{0x0C, 0x62}, // power down mic bias, oscillator and CLKOUT
	{0x0E, 0x02}, // I2S format, 16-bit input audio data, slave mode
	{0x10, 0x00}, // (256fs oversampling, no frequency dividers), 48 kHz ADC and DAC
	{0x12, 0x01}  // activate interface
	};
	int reg_i;
	for(reg_i = 0; reg_i < RFC_INIT_SIZE; reg_i++) {
		writereg(addr_rfc, rfc_init[reg_i][0], rfc_init[reg_i][1]);
	}
}


void audio_init_bus() {
	// I2S2 initialization
	I2S_InitTypeDef inits =
	(I2S_InitTypeDef) {
		.I2S_Mode = I2S_Mode_MasterTx,
		.I2S_Standard = I2S_Standard_Phillips,
		.I2S_DataFormat = I2S_DataFormat_16b,
		.I2S_MCLKOutput = I2S_MCLKOutput_Enable,
		.I2S_AudioFreq = I2S_AudioFreq_48k,
		.I2S_CPOL = I2S_CPOL_Low
	};

	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE); // I2S2
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource12, GPIO_AF_SPI2); // I2S2_WS
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource13, GPIO_AF_SPI2); // I2S2_CK
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource14, GPIO_AF_I2S2ext); // I2S2_extSD (input)
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource15, GPIO_AF_SPI2); // I2S2_SD (output)
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource6,  GPIO_AF_SPI2); // I2S2_MCK
	GPIO_Init(GPIOB, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});
	GPIO_Init(GPIOC, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_6,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});

	I2S_Init(SPI2, &inits);
	I2S_FullDuplexConfig(I2S2ext, &inits);
	I2S_Cmd(SPI2, ENABLE);
	I2S_Cmd(I2S2ext, ENABLE);

	// I2S3 initialization
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI3, ENABLE); // I2S3
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource15, GPIO_AF_SPI3); // I2S3_WS
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource7,  GPIO_AF_SPI2); // I2S3_MCK
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource10, GPIO_AF_SPI3); // I2S3_CK
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource11, GPIO_AF_I2S3ext); // I2S3_extSD (input)
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource12, GPIO_AF_SPI3); // I2S3_SD (output)
	GPIO_Init(GPIOA, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_15,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});
	GPIO_Init(GPIOC, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_7 | GPIO_Pin_10 | GPIO_Pin_11 | GPIO_Pin_12,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});

	I2S_Init(SPI3, &inits);
	I2S_FullDuplexConfig(I2S3ext, &inits);
	I2S_Cmd(SPI3, ENABLE);
	I2S_Cmd(I2S3ext, ENABLE);
}
