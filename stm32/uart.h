#ifndef UART_H
#define UART_H
#include <stdint.h>

void print(char *);
void printhex(uint32_t);
void printdec(uint32_t);
void uart_init();

#endif
