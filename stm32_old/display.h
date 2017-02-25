#ifndef DISPLAY_H
#define DISPLAY_H
#include <stdint.h>

void writecommand(uint8_t v);
void writedata(uint8_t v);
void display_init();
#endif
