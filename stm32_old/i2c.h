#ifndef I2C_H
#define I2C_H
#include <stdint.h>

void writereg(uint8_t, uint8_t, uint8_t);
void i2c_init();

#endif
