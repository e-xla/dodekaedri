#include "stm32f4xx_hal.h"
#include "cmsis_os.h"

extern I2S_HandleTypeDef hi2s2, hi2s3;

const uint8_t addr_rfc = 0x1A;   // WM8731 used for zero-IF signal
const uint8_t addr_afc = 0x1B;   // WM8731 used for microphone and headphone audio

// The WM8731 registers have 7-bit addresses and 9-bit data
// so the highest data bit of each register
// is in lowest bit of the first byte.
#define AUDIOCODEC_INIT_SIZE 11
static const uint8_t rfc_init[AUDIOCODEC_INIT_SIZE][2] = {
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

static const uint8_t afc_init[AUDIOCODEC_INIT_SIZE][2] = {
{0x1E, 0x00}, // reset it first
{0x00, 0x1F}, // maximum L line input volume, no mute
{0x02, 0x1F}, // maximum R line input volume, no mute
{0x04, 0x7F-6}, // 0 dB headphone gain
{0x06, 0x7F-6}, // 0 dB headphone gain
{0x08, 0x14}, // select DAC, select mic in to ADC, mute mic input
{0x0A, 0x01}, // disable ADC HPF and deemphasis
{0x0C, 0x61}, // power down line input, oscillator and CLKOUT
{0x0E, 0x02}, // I2S format, 16-bit input audio data, slave mode
{0x10, 0x00}, // (256fs oversampling, no frequency dividers), 48 kHz ADC and DAC
{0x12, 0x01}  // activate interface
};

static void audio_init_converters() {
	int reg_i;
	for(reg_i = 0; reg_i < AUDIOCODEC_INIT_SIZE; reg_i++) {
		writereg(addr_rfc, rfc_init[reg_i][0], rfc_init[reg_i][1]);
		writereg(addr_afc, afc_init[reg_i][0], afc_init[reg_i][1]);
	}
}


static uint16_t audiodata[100];

void start_dsp_task(void const * argument)
{
	int i;
	for(i = 0; i < 100; i++) {
		audiodata[i] = 12345*i;
	}
	audio_init_converters();
	for(i=0;;i++) {
		HAL_I2S_Transmit(&hi2s2, audiodata, 100, 1000);
		osDelay(10);
		HAL_I2S_Transmit(&hi2s3, audiodata, 100, 1000);
		osDelay(10);
	}
}

