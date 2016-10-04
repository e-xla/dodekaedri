// small program to test DSP code on PC before trying to run it on the transceiver

#include <stdint.h>
#include <math.h>
#include <stdio.h>

#if 1
#define FIRLEN 32
int16_t filtertaps0[FIRLEN] = {-5799,-8143,-10073,-11233,-11315,-10104,-7508,-3581,1473,7319,13513,19552,24919,29141,31839,32767,31839,29141,24919,19552,13513,7319,1473,-3581,-7508,-10104,-11315,-11233,-10073,-8143,-5799,0};
int16_t filtertaps1[FIRLEN] = {571,-964,-3493,-6884,-10880,-15121,-19182,-22611,-24984,-25951,-25282,-22893,-18863,-13434,-6986,0,6986,13434,18863,22893,25282,25951,24984,22611,19182,15121,10880,6884,3493,964,-571,0};
#else
// a short test filter to see how fast the code runs
#define FIRLEN 4
int16_t filtertaps0[FIRLEN] = {100,200,300,400};
int16_t filtertaps1[FIRLEN] = {400,500,600,700};
#endif

int16_t firbuf0[2*FIRLEN], firbuf1[2*FIRLEN];
int16_t *firp0 = firbuf0, *firp1 = firbuf1;
int firidx = 0;


uint32_t agc_filter = 0;
void samplehandler(int16_t *rxsamp, int16_t *txsamp) {
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
			acc += (filtertaps0[i] * firp0[i]);
			acc += (filtertaps1[i] * firp1[i]);
			acc += (filtertaps0[i+1] * firp0[i+1]);
			acc += (filtertaps1[i+1] * firp1[i+1]);
		}
		int32_t o = ((uint64_t)acc) >> 5; // avoid overflow in filter of length 32
		uint32_t o_agc = (o>=0) ? o : -o;
		agc_filter += (o_agc - agc_filter) >> 10;
		uint32_t agc_gain = 0xFFFFFFFFUL / ((agc_filter >> 8)+1);

		int32_t out = ((int64_t)o * agc_gain) >> 32;

		if(out > 0x7FFF) out = 0x7FFF;
		else if(out < -0x8000) out = -0x8000;
		if(out > 0x7FFF) out = 0x7FFF;
		else if(out < -0x8000) out = -0x8000;

		txsamp[0] = out;
		txsamp[1] = out;
}

int main() {
	int16_t rxsamp[2], txsamp[2];
	int i;
	double ph=0;
	// test with a chirp
	for(i = 0; i < 100000; i++) {
		ph += M_PI * (((double)i / 10000.0)*2.0-1.0);
		while(ph >= M_PI) ph -= M_PI*2.0;
		rxsamp[0] = 0.1*i*cos(ph);
		rxsamp[1] = 0.1*i*sin(ph);
		samplehandler(rxsamp, txsamp);
		fwrite(txsamp, 4, 1, stdout);
	}
	return 0;
}
