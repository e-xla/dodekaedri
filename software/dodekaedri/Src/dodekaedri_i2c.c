#include <stdint.h>
#include "stm32f4xx_hal.h"
#include "cmsis_os.h"

extern osMutexId i2c_mutexHandle;
extern I2C_HandleTypeDef hi2c1;

void writereg(uint8_t addr, uint8_t reg, uint8_t v) {
	uint8_t data[2] = { reg, v };
	// use mutex to prevent multiple tasks from trying to use I2C at the same time
	xSemaphoreTake(i2c_mutexHandle, 10000);
	HAL_I2C_Master_Transmit(&hi2c1, addr, data, 2, 100);
	xSemaphoreGive(i2c_mutexHandle);
}

int32_t readreg(uint8_t addr, uint8_t reg) {
	uint8_t data[1] = { reg };
	int32_t failed = 0;
	// use mutex to prevent multiple tasks from trying to use I2C at the same time
	xSemaphoreTake(i2c_mutexHandle, 10000);
	if(HAL_I2C_Master_Transmit(&hi2c1, addr, data, 2, 100) != HAL_OK) failed = -1;
	if(HAL_I2C_Master_Receive( &hi2c1, addr, data, 1, 100) != HAL_OK) failed = -2;
	xSemaphoreGive(i2c_mutexHandle);
	
	if(failed) return failed;
	return data[0];
}

