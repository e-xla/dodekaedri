#include <stm32f4xx.h>
#include <stm32f4xx_i2c.h>
#include "i2c.h"

#define _BITS(lowest, v, last, first) ((((v) & ((2<<((last)))-1)) >> first) << lowest)
const uint8_t addr_synth = 0x60; // SI5351 synthesizer I2C address

struct synth_init_t {
	uint32_t msna_p1:20; // plla_int
	uint32_t msna_p2:20; // plla_num

	uint32_t msna_p3:20; // plla_den: 1 kHz step with 26 MHz reference

	uint32_t r0_div; // divide by 100 -> 10 Hz step
	unsigned ms0_p1:18;
	unsigned ms0_p2:20;
	unsigned ms0_p3:20;
	unsigned ms0_divby4:2;
	unsigned clk0_pdn:1;
	unsigned ms0_int:1;
	unsigned ms0_src:1;
	unsigned clk0_inv:1;
	unsigned clk0_src:2;
	unsigned clk0_idrv:1;

	unsigned ms1_p1:18;
	unsigned ms1_p2:20;
	unsigned ms1_p3:20;
	unsigned clk1_pdn:1;
	unsigned ms1_int:1;
	unsigned ms1_src:1;
	unsigned clk1_inv:1;
	unsigned clk1_src:2;
	unsigned clk1_idrv:1;

	unsigned ms2_p1:18;
	unsigned ms2_p2:20;
	unsigned ms2_p3:20;
	unsigned clk2_pdn:1;
	unsigned ms2_int:1;
	unsigned ms2_src:1;
	unsigned clk2_inv:1;
	unsigned clk2_src:2;
	unsigned clk2_idrv:1;
};
void synth_init() {
	uint32_t msna_p1 = 27; // plla_int
	uint32_t msna_p2 = 4000; // plla_num

	uint32_t msna_p3 = 26000; // plla_den: 1 kHz step with 26 MHz reference

	uint32_t r0_div = 0;
	uint32_t r1_div = 0;
	int ms0_divby4 = 0;
	int clk0_pdn = 0;
	int ms0_int = 1;
	int ms0_src = 0;
	int clk0_inv = 0;
	int clk0_src = 3;
	int clk0_idrv = 0;
	int clk0_phoff = 0;
	int ms0_p1 = 100; // divide by 100 -> 10 Hz step
	int ms0_p2 = 0;
	int ms0_p3 = 1;

	int ms1_divby4 = 0;
	int clk1_pdn = 0;
	int ms1_int = 1;
	int ms1_src = 0;
	int clk1_inv = 0;
	int clk1_src = 3;
	int clk1_idrv = 0;
	int clk1_phoff = ms0_p1;
	int ms1_p1 = ms0_p1;
	int ms1_p2 = 0;
	int ms1_p3 = 1;

	int clk2_pdn = 0;
	int ms2_int = 1;
	int ms2_src = 1;
	int clk2_inv = 0;
	int clk2_src = 0;
	int clk2_idrv = 0;

	uint8_t synth_init_regs[][2] = {
	{177, 0b10100000}, // PLLA, PLLB reset
	{183, 0b01010010}, // minimum crystal load capacitance
	{187, 0b11010000},

	{  3, 0b11111000}, // enable CLK0, 1, 2
	{  9, 0b11111111}, // disable OEB pins
	{ 15, 0b00000000}, // clkin divider 1, xtal input

	// outputs:
	{ 16, _BITS(7, clk0_pdn, 0, 0) | _BITS(6, ms0_int, 0, 0) | _BITS(5, ms0_src, 0, 0) | _BITS(4, clk0_inv, 0, 0) | _BITS(2, clk0_src, 1, 0) | _BITS(0, clk0_idrv, 1, 0)}, // CLK0: MS0 integer, PLLA, use MS0, 2 mA
	{ 17, _BITS(7, clk1_pdn, 0, 0) | _BITS(6, ms1_int, 0, 0) | _BITS(5, ms1_src, 0, 0) | _BITS(4, clk1_inv, 0, 0) | _BITS(2, clk1_src, 1, 0) | _BITS(0, clk1_idrv, 1, 0)}, // CLK0: MS0 integer, PLLA, use MS0, 2 mA
	{ 18, _BITS(7, clk2_pdn, 0, 0) | _BITS(6, ms2_int, 0, 0) | _BITS(5, ms2_src, 0, 0) | _BITS(4, clk2_inv, 0, 0) | _BITS(2, clk2_src, 1, 0) | _BITS(0, clk2_idrv, 1, 0)}, // CLK0: MS0 integer, PLLA, use MS0, 2 mA

	// PLL feedback dividers:
	{ 26, _BITS(0, msna_p3, 15, 8)},
	{ 27, _BITS(9, msna_p3, 7, 0)},
	{ 28, _BITS(0, msna_p1, 17, 16)},
	{ 29, _BITS(0, msna_p1, 15, 8)},
	{ 30, _BITS(0, msna_p1, 7, 0)},
	{ 31, _BITS(4, msna_p3, 19, 16) | _BITS(0, msna_p2, 19, 16)},
	{ 32, _BITS(0, msna_p2, 15, 8)},
	{ 33, _BITS(0, msna_p2, 7, 0)},

	/* MS0:
	fractional part probably doesn't matter since we use
	the multisynth in integer mode but let's set it to 0/1 */
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

	{165, _BITS(0, clk0_phoff, 6, 0)}, // CLK0 phase offset: 0
	{166, _BITS(0, clk1_phoff, 6, 0)}, // CLK1 phase offset equal to ms1_int -> 90 degree phase shift


	{0xFF, 0xFF} // end of table
	};

	// init SI5351
	int reg_i;
	for(reg_i = 0;; reg_i++) {
		uint8_t r = synth_init_regs[reg_i][0], v = synth_init_regs[reg_i][1];
		if(r == 0xFF && v == 0xFF) break;
		writereg(addr_synth, r, v);
	}
}

