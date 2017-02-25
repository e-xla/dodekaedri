#include "stm32f4xx_hal.h"
void start_ui_task(void const * argument)
{
  /* USER CODE BEGIN start_ui_task */
  /* Infinite loop */
  for(;;)
  {
    // blink backlight as first test
    HAL_GPIO_WritePin(TFT_BL_GPIO_Port, TFT_BL_Pin, GPIO_PIN_SET);
    osDelay(100);
    HAL_GPIO_WritePin(TFT_BL_GPIO_Port, TFT_BL_Pin, GPIO_PIN_RESET);
    osDelay(100);
  }
  /* USER CODE END start_ui_task */
}

