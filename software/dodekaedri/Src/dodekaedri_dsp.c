#include "stm32f4xx_hal.h"
#include "cmsis_os.h"

extern I2S_HandleTypeDef hi2s2, hi2s3;
void writereg(uint8_t addr, uint8_t reg, uint8_t v);

const uint8_t addr_rfc = 0x1A<<1;   // WM8731 used for zero-IF signal
const uint8_t addr_afc = 0x1B<<1;   // WM8731 used for microphone and headphone audio

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
	HAL_I2S_Transmit(&hi2s2, audiodata, 100, 1000);
	for(i=0;;i++) {
		osDelay(1000);
		/*HAL_I2S_Transmit(&hi2s2, audiodata, 100, 1000);
		osDelay(10);
		HAL_I2S_Transmit(&hi2s3, audiodata, 100, 1000);
		osDelay(10);*/
	}
}





#if 1
#define FIRLEN 32
int16_t filtertaps0[FIRLEN] = {
-10727,-13071,-15002,-16162,-16243,-15032,-12436,-8509,-3455,2391,8585,14624,19991,24213,26911,27839,26911,24213,19991,14624,8585,2391,-3455,-8509,-12436,-15032,-16243,-16162,-15002,-13071,-10727
};
int16_t filtertaps1[FIRLEN] = {
-571,964,3493,6884,10880,15121,19182,22611,24984,25951,25282,22893,18863,13434,6986,0,-6986,-13434,-18863,-22893,-25282,-25951,-24984,-22611,-19182,-15121,-10880,-6884,-3493,-964,571
};
#else
// a short test filter to see how fast the code runs
#define FIRLEN 4
int16_t filtertaps0[FIRLEN] = {100,200,300,400};
int16_t filtertaps1[FIRLEN] = {400,500,600,700};
#endif

int16_t firbuf0[2*FIRLEN], firbuf1[2*FIRLEN];
int16_t *firp0 = firbuf0, *firp1 = firbuf1;
int firidx = 0;


#define SPIFLAG(spi, flag) ((spi)->SR & (flag))
int sawtooth = 0;
int16_t rxsamp[2], txsamp[2];
uint32_t agc_filter = 0;
void SPI2_IRQHandler() {
	//int64_t outr = 0, outi = 0, out;
	/* Handler for empty TX buffer in SPI2:
	   read I2S_FLAG_CHSIDE to see if the TX buffer is
	   waiting for left or right channel.
	*/
	//DEV_GPIO->ODR |= DEV_PIN;
	if(SPIFLAG(SPI2, I2S_FLAG_CHSIDE)) {
		/* Ready to put "right" channel in TX buffer.
		   We have also received "left" channel. */
		rxsamp[0] = I2S2ext->DR;
		SPI2->DR = txsamp[1];
		SPI3->DR = txsamp[1];
	} else {
		/* Ready to put "left" channel in TX buffer,
		   i.e. first part of the next sample to transmit.
		   We have now also received "right" channel
		   so we have received one complete sample. */
		rxsamp[1] = I2S2ext->DR;

		// "circular buffer"
		firp0[0] = firp0[FIRLEN] = rxsamp[0];
		firp1[0] = firp1[FIRLEN] = rxsamp[1];
		firidx++;
		if(firidx >= FIRLEN) firidx = 0;
		firp0 = firbuf0 + firidx;
		firp1 = firbuf1 + firidx;

		int64_t acc = 0;
		int i;
		for(i = 0; i < FIRLEN; i+=2) {
			acc += (int32_t)filtertaps0[i] * firp0[i];
			acc += (int32_t)filtertaps1[i] * firp1[i];
			acc += (int32_t)filtertaps0[i+1] * firp0[i+1];
			acc += (int32_t)filtertaps1[i+1] * firp1[i+1];
		}
		int32_t o = ((uint64_t)acc) >> 5; // avoid overflow in filter of length 32

		uint32_t o_agc = (o>=0) ? o : -o; // rectify
		if(o_agc >= agc_filter) // attack faster than decay
			agc_filter += (o_agc - agc_filter) >> 4;
		else
			agc_filter -= (agc_filter - o_agc) >> 10;
		uint32_t agc_gain = 0xFFFFFFFFUL / ((agc_filter >> 14)+1);
		//agc_gain = 0x10000;

		// bit shift for signed values is undefined so write it as division
		int32_t out = ((int64_t)o * agc_gain) / 4294967296LL;

		if(out > 0x7FFF) out = 0x7FFF;
		else if(out < -0x8000) out = -0x8000;
		if(out > 0x7FFF) out = 0x7FFF;
		else if(out < -0x8000) out = -0x8000;

		txsamp[0] = out;
		txsamp[1] = out;

		SPI2->DR = txsamp[0];
		SPI3->DR = txsamp[0];
	}
	//DEV_GPIO->ODR &= ~DEV_PIN;
}
