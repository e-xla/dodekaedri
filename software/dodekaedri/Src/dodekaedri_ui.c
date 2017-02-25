#include "stm32f4xx_hal.h"
#include "cmsis_os.h"

extern SPI_HandleTypeDef hspi1;


static void tft_send(uint8_t *bytes, int n, int dc) {
	if(dc) // data
		HAL_GPIO_WritePin(TFT_DC_GPIO_Port, TFT_DC_Pin, GPIO_PIN_SET);
	else // command
		HAL_GPIO_WritePin(TFT_DC_GPIO_Port, TFT_DC_Pin, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(TFT_CS_GPIO_Port, TFT_CS_Pin, GPIO_PIN_RESET);
	HAL_SPI_Transmit(&hspi1, bytes, n, 1);
	HAL_GPIO_WritePin(TFT_CS_GPIO_Port, TFT_CS_Pin, GPIO_PIN_SET);
}


static void writecommand(uint8_t v) {
	tft_send(&v, 1, 0);
}

static void writedata(uint8_t v) {
	tft_send(&v, 1, 1);
}

static void delay(int ms) {
	osDelay(ms);
}

#include "tft.h"

void start_ui_task(void const * argument)
{
	int t;
	// turn backlight on
	HAL_GPIO_WritePin(TFT_BL_GPIO_Port, TFT_BL_Pin, GPIO_PIN_SET);

	// Initialize display
	Adafruit_ST7735_commandList(Rcmd1);
	Adafruit_ST7735_commandList(Rcmd2red);
	Adafruit_ST7735_commandList(Rcmd3);

	for(t=0;;t++) {
		HAL_GPIO_WritePin(TFT_BL_GPIO_Port, TFT_BL_Pin, 1&t); // test

		writecommand(0x2A); // column address set
		writedata(0);
		writedata(0);
		writedata(0);
		writedata(128);
		writecommand(0x2B); // row address set
		writedata(0);
		writedata(0);
		writedata(0);
		writedata(160);
		writecommand(0x2C); // memory write

		int y;
		for(y = 0; y < 160; y++) {
			int x;
			for(x = 0; x < 128; x++) {
				writedata((x + t) ^ y);
				writedata(t ^ (y + t));
			}
		}
	}
}

