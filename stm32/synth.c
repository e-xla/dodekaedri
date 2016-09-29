#include <stm32f4xx.h>
#include <stm32f4xx_i2c.h>
#include "i2c.h"

const uint8_t addr_synth = 0x60; // SI5351 synthesizer I2C address

void synth_init() {
	uint32_t plla_int = 27;
	uint32_t plla_num = 4000;

	uint32_t plla_den = 26000; // 1 kHz step with 26 MHz reference

	uint32_t ms0_int = 100; // divide by 100 -> 10 Hz step

	uint32_t ms1_int = ms0_int;

	uint8_t synth_init_regs[][2] = {
	{167, 0b10100000}, // PLLA, PLLB reset
	{183, 0b01010010}, // minimum crystal load capacitance
	{187, 0b01010000},

	{  3, 0b11111000}, // enable CLK0, 1, 2
	{  9, 0b11111111}, // disable OEB pins
	{ 15, 0b00000000}, // clkin divider 1, xtal input

	// outputs:
	{ 16, 0b01001100}, // CLK0: MS0 integer, PLLA, use MS0, 2 mA
	{ 17, 0b01001100}, // CLK1: MS1 integer, PLLA, use MS1, 2 mA
	{ 18, 0b01100000}, // CLK2: input directly from xtal,   2 mA

	// PLL feedback dividers:
	{ 26, 0xFF & plla_den >> 8},
	{ 27, 0xFF & plla_den},
	{ 28, 0x03 & plla_int >> 16},
	{ 29, 0xFF & plla_int >> 8},
	{ 30, 0xFF & plla_int},
	{ 31, (0xF0 & plla_den >> 12) | (0x0F & plla_num >> 16)},
	{ 32, 0xFF & plla_num >> 8},
	{ 33, 0xFF & plla_num},

	/* MS0:
	fractional part probably doesn't matter since we use
	the multisynth in integer mode but let's set it to 0/1 */
	{ 42, 0},
	{ 43, 1},
	{ 44, 0x03 & ms0_int >> 16}, // R0 divide by 1, MS0 divide by other than 4
	{ 45, 0xFF & ms0_int >> 8},
	{ 46, 0xFF & ms0_int},
	{ 47, 0},
	{ 48, 0},
	{ 49, 0},

	// MS1
	{ 50, 0},
	{ 51, 1},
	{ 52, 0x03 & ms1_int >> 16}, // R1 divide by 1, MS1 divide by other than 4
	{ 53, 0xFF & ms1_int >> 8},
	{ 54, 0xFF & ms1_int},
	{ 55, 0},
	{ 56, 0},
	{ 57, 0},

	{165, 0}, // CLK0 phase offset: 0
	{166, ms1_int}, // CLK1 phase offset equal to ms1_int -> 90 degree phase shift


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

