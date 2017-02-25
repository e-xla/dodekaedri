#include <stm32f4xx.h>
#include <stm32f4xx_i2c.h>

#include "i2c.h"

// SCL 8, SDA 9
#define I2C_SCL 0x100
#define I2C_SDA 0x200

int i2cdelay = 20;
void i2c_delay() {
	int d;
	for(d = 0; d < i2cdelay; d++) __asm("nop");
}

void writereg(uint8_t addr, uint8_t reg, uint8_t v) {
	int i;
	uint32_t odr = GPIOB->ODR & (~(I2C_SCL | I2C_SDA));
	uint32_t allbits;
	// start
	GPIOB->ODR = odr | I2C_SCL;
	i2c_delay();
	GPIOB->ODR = odr;
	i2c_delay();

	allbits =
	(addr << (9*2+2)) | (0 << (9*2+1)) | (1 << (9*2)) |
	(reg  << (9*1+1)) |                  (1 << (9*1)) |
	(v    << (9*0+1)) |                  (1 << (9*0));
	for(i = 0; i < 9*3; i++) {
		uint32_t odr_bit;
		if(allbits & (1 << (9*3-1)))
			odr_bit = odr | I2C_SDA;
		else
			odr_bit = odr;
		allbits <<= 1;
		// send bit
		GPIOB->ODR = odr_bit;
		i2c_delay();
		GPIOB->ODR = odr_bit | I2C_SCL;
		i2c_delay();
		GPIOB->ODR = odr_bit;
		i2c_delay();
	}

	// stop
	GPIOB->ODR = odr | I2C_SCL;
	i2c_delay();
	GPIOB->ODR = odr | I2C_SCL | I2C_SDA;
	i2c_delay();
}


void i2c_init() {
	// bit banged I2C pins
	GPIO_Init(GPIOB, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9,
		.GPIO_Mode = GPIO_Mode_OUT,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_OD,
		.GPIO_PuPd = GPIO_PuPd_UP
	});
}

