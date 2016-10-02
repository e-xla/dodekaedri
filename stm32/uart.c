#include "stm32f4xx_usart.h"
#include "uart.h"


int usart_enabled = 0;
void print(char *data) {
	/* Send text to USART1 */
	if(usart_enabled == 0) return;
	for(; *data != '\0'; data++) {
		int to = 0;
		while(!(USART1->SR & USART_SR_TXE)) {
			to++;
			if(to >= 10000) return; // timeout
		}
		USART1->DR = (uint8_t)*data;
	}
}


const char hexnumbers[16] = "0123456789ABCDEF";
void printhex(uint32_t v) {
	char text[9];
	int i;
	for(i = 0; i < 8; i++)
		text[i] = hexnumbers[0xF & v >> (4*(7-i))];
	text[8] = '\0';
	print(text);
}


void printdec(uint32_t v) {
	char text[11];
	int i;
	for(i = 9; i >= 0; i--) {
		text[i] = '0' + (v % 10);
		v = v / 10;
	}
	text[10] = '\0';
	print(text);
}


void uart_init() {
	// USART1 initialization
	// External USB-UART converter is connected to PA9
	// because the built-in converter on Nucleo board in USART2
	// seems to work poorly.
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource9, GPIO_AF_USART1); // USART1_TX
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource10, GPIO_AF_USART1); // USART1_RX
	GPIO_Init(GPIOA, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_9 | GPIO_Pin_10,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_UP
	});
	USART_Init(USART1, &(USART_InitTypeDef) {
		.USART_BaudRate = 1000000,
		.USART_WordLength = USART_WordLength_8b,
		.USART_StopBits = USART_StopBits_1,
		.USART_Parity = USART_Parity_No,
		.USART_Mode = USART_Mode_Tx | USART_Mode_Rx,
		.USART_HardwareFlowControl = USART_HardwareFlowControl_None
	});
	USART_Cmd(USART1, ENABLE);
	usart_enabled = 1;
	print("\r\nUART initialized\r\n");
}
