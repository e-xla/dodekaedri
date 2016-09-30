#include <stm32f4xx.h>
#include <stm32f4xx_i2c.h>
#include "i2c.h"

#define _BITS(lowest, v, last, first) ((((v) & ((2<<((last)))-1)) >> first) << lowest)
const uint8_t addr_synth = 0x60; // SI5351 synthesizer I2C address

struct synth_init_t {
	uint32_t msna_p1:20;
	uint32_t msna_p2:20;
	uint32_t msna_p3:20;
	uint32_t r0_div;
	uint32_t ms0_p1:18;
	uint32_t ms0_p2:20;
	uint32_t ms0_p3:20;
	unsigned ms0_divby4:2;
	unsigned clk0_pdn:1;
	unsigned ms0_unsigned:1;
	unsigned ms0_src:1;
	unsigned clk0_inv:1;
	unsigned clk0_src:2;
	unsigned clk0_idrv:1;

	uint32_t ms1_p1:18;
	uint32_t ms1_p2:20;
	uint32_t ms1_p3:20;
	unsigned clk1_pdn:1;
	unsigned ms1_unsigned:1;
	unsigned ms1_src:1;
	unsigned clk1_inv:1;
	unsigned clk1_src:2;
	unsigned clk1_idrv:1;

	unsigned ms2_p1:18;
	unsigned ms2_p2:20;
	unsigned ms2_p3:20;
	unsigned clk2_pdn:1;
	unsigned ms2_unsigned:1;
	unsigned ms2_src:1;
	unsigned clk2_inv:1;
	unsigned clk2_src:2;
	unsigned clk2_idrv:1;
};
void synth_init() {
	uint32_t msna_a = 27;    // integer part
	uint32_t msna_b = 4000;  // numerator
	uint32_t msna_c = 26000; // denominator: 1 kHz step with 26 MHz reference

	uint32_t ms0_a = 100;
	uint32_t ms0_b = 0;
	uint32_t ms0_c = 1;

	// equations from Silabs AN619 page 3:
	uint32_t msna_p1 = 128 * msna_a + (128 * msna_b/msna_c) - 512;
	uint32_t msna_p2 = 128 * msna_b - msna_c * (128 * msna_b/msna_c);
	uint32_t msna_p3 = msna_c;

	// equations from Silabs AN619 page 6:
	uint32_t ms0_p1 = 128 * ms0_a + (128 * ms0_b/ms0_c) - 512;
	uint32_t ms0_p2 = 128 * ms0_b - ms0_c * (128 * ms0_b/ms0_c);
	uint32_t ms0_p3 = ms0_c;

	unsigned r0_div = 0; // divide by 1
	unsigned r1_div = 0;
	unsigned ms0_divby4 = 0;
	unsigned clk0_pdn = 0;
	unsigned ms0_int = 1; // integer mode
	unsigned ms0_src = 0;
	unsigned clk0_inv = 0;
	unsigned clk0_src = 3;
	unsigned clk0_idrv = 0;
	unsigned clk0_phoff = 0;

	unsigned ms1_divby4 = 0;
	unsigned clk1_pdn = 0;
	unsigned ms1_unsigned = 1;
	unsigned ms1_src = 0;
	unsigned clk1_inv = 0;
	unsigned clk1_src = 3;
	unsigned clk1_idrv = 0;
	unsigned clk1_phoff = ms0_p1;
	uint32_t ms1_p1 = ms0_p1;
	uint32_t ms1_p2 = ms0_p2;
	uint32_t ms1_p3 = ms0_p3;

	unsigned clk2_pdn = 0;
	unsigned ms2_unsigned = 1;
	unsigned ms2_src = 1;
	unsigned clk2_inv = 0;
	unsigned clk2_src = 0;
	unsigned clk2_idrv = 0;

	clk0_phoff = 0;
	clk1_phoff = ms0_int;

	uint8_t synth_init_regs[][2] = {
	{177, 0b10100000}, // PLLA, PLLB reset
	{183, 0b01010010}, // minimum crystal load capacitance
	{187, 0b11010000},

	{  3, 0b11111000}, // enable CLK0, 1, 2
	{  9, 0b11111111}, // disable OEB pins
	{ 15, 0b00000000}, // clkin divider 1, xtal input

	// outputs:
	{ 16, _BITS(7, clk0_pdn, 0, 0) | _BITS(6, ms0_int, 0, 0) | _BITS(5, ms0_src, 0, 0) | _BITS(4, clk0_inv, 0, 0) | _BITS(2, clk0_src, 1, 0) | _BITS(0, clk0_idrv, 1, 0)},
	{ 17, _BITS(7, clk1_pdn, 0, 0) | _BITS(6, ms1_unsigned, 0, 0) | _BITS(5, ms1_src, 0, 0) | _BITS(4, clk1_inv, 0, 0) | _BITS(2, clk1_src, 1, 0) | _BITS(0, clk1_idrv, 1, 0)},
	{ 18, _BITS(7, clk2_pdn, 0, 0) | _BITS(6, ms2_unsigned, 0, 0) | _BITS(5, ms2_src, 0, 0) | _BITS(4, clk2_inv, 0, 0) | _BITS(2, clk2_src, 1, 0) | _BITS(0, clk2_idrv, 1, 0)},

	// PLL feedback dividers:
	{ 26, _BITS(0, msna_p3, 15, 8)},
	{ 27, _BITS(9, msna_p3, 7, 0)},
	{ 28, _BITS(0, msna_p1, 17, 16)},
	{ 29, _BITS(0, msna_p1, 15, 8)},
	{ 30, _BITS(0, msna_p1, 7, 0)},
	{ 31, _BITS(4, msna_p3, 19, 16) | _BITS(0, msna_p2, 19, 16)},
	{ 32, _BITS(0, msna_p2, 15, 8)},
	{ 33, _BITS(0, msna_p2, 7, 0)},

	/* MS0: */
	{ 42, _BITS(0, ms0_p3, 15, 8)},
	{ 43, _BITS(0, ms0_p3, 7, 0)},
	{ 44, _BITS(4, r0_div, 2, 0) | _BITS(2, ms0_divby4, 1, 0) | _BITS(0, ms0_p1, 17, 16)}, // R0 divide by 1, MS0 divide by other than 4
	{ 45, _BITS(0, ms0_p1, 15, 8)},
	{ 46, _BITS(0, ms0_p1, 7, 0)},
	{ 47, _BITS(4, ms0_p3, 19, 16) | _BITS(0, ms0_p2, 19, 16)},
	{ 48, _BITS(0, ms0_p2, 15, 8)},
	{ 49, _BITS(0, ms0_p2, 7, 0)},

	/* MS1: */
	{ 50, _BITS(0, ms1_p3, 15, 8)},
	{ 51, _BITS(0, ms1_p3, 7, 0)},
	{ 52, _BITS(4, r1_div, 2, 0) | _BITS(2, ms1_divby4, 1, 0) | _BITS(0, ms1_p1, 17, 16)}, // R0 divide by 1, MS0 divide by other than 4
	{ 53, _BITS(0, ms1_p1, 15, 8)},
	{ 54, _BITS(0, ms1_p1, 7, 0)},
	{ 55, _BITS(4, ms1_p3, 19, 16) | _BITS(0, ms1_p2, 19, 16)},
	{ 56, _BITS(0, ms1_p2, 15, 8)},
	{ 57, _BITS(0, ms1_p2, 7, 0)},

	{165, _BITS(0, clk0_phoff, 6, 0)},
	{166, _BITS(0, clk1_phoff, 6, 0)},


	{0xFF, 0xFF} // end of table
	};

	// init SI5351
	unsigned reg_i;
	for(reg_i = 0;; reg_i++) {
		uint8_t r = synth_init_regs[reg_i][0], v = synth_init_regs[reg_i][1];
		if(r == 0xFF && v == 0xFF) break;
		writereg(addr_synth, r, v);
	}
}

