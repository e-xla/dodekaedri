/* Simple LED blink for STM32F401RE Nucleo board */

#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"
void SystemInit() {
}

#define PIN 5

volatile int i;
int main() {
	//RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

	GPIOA->MODER |= 1<<(PIN*2);

	// TODO: try to make GPIO_Init work
	/*GPIO_Init(GPIOA, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_5,
		.GPIO_Mode = GPIO_Mode_OUT,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});*/

	for(;;) {
		for(i = 0; i < 200000; i++) __asm("nop");
		GPIOA->ODR = 1<<PIN;
		for(i = 0; i < 200000; i++) __asm("nop");
		GPIOA->ODR = 0;
	}
	return 0;
}

void _exit(__attribute__((unused)) int asdf) {
	for(;;);
}
