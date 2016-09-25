
#include <Wire.h>

//Register map for use with AN428 (JumpStart)
//http://www.silabs.com/clocks 
//Copyright 2014 Silicon Laboratories
//**************************************************
//C-Code File version = 1
//#BEGIN_HEADER
//Date = Friday, September 23, 2016 3:43 PM
//File version = 3
//Software Name = Si5351 ClockBuilder Desktop
//Software version = 6.5
//Software date = June 4, 2015
//Chip = Si5351A
//Part Number = Si5351A-x-GT
//#END_HEADER
//I2C address = 0x60
/*
#XTAL (MHz) = 25.000000000
#Mode = Automatic
#PLL A
# Input Frequency (MHz) = 25.000000000
# F divider = 1
# PFD (MHz) = 25.000000000
# VCO Frequency (MHz) =  800.000000000
# Feedback Divider = 32
# Internal Load Cap (pf) = 0
# SSC disabled
#PLL B
# Input Frequency (MHz) = 25.000000000
# F divider = 1
# PFD (MHz) = 25.000000000
# VCO Frequency (MHz) =  798.984000000
# Feedback Divider = 31  2998/3125
# Pull Range (±ppm) = 0.0
#Output Clocks
#Channel 0
# Output Frequency (MHz) = 3.699000000
# Multisynth Output Frequency (MHz) = 3.699000000
# Multisynth Divider = 216
# R Divider = 1
# PLL source = PLLB
# Initial phase offset (ns) = 0.000
# Error (ppm) = 0.0000
# Powered = On
# Inverted = No
# Drive Strength = b11
# Disable State = Low
# Clock Source = b11
#Channel 1
# Output Frequency (MHz) = 3.699000000
# Multisynth Output Frequency (MHz) = 3.699000000
# Multisynth Divider = 216
# R Divider = 1
# PLL source = PLLB
# Initial phase offset (ns) = 45.000
# Error (ppm) = 0.0000
# Powered = On
# Inverted = No
# Drive Strength = b11
# Disable State = Low
# Clock Source = b11
#Channel 2
# Output Frequency (MHz) = 25.000000000
# Multisynth Output Frequency (MHz) = 25.000000000
# Multisynth Divider = 32
# R Divider = 1
# PLL source = PLLA
# Initial phase offset (ns) = 0.000
# Error (ppm) = 0.0000
# Powered = On
# Inverted = No
# Drive Strength = b11
# Disable State = Low
# Clock Source = b11
#Channel 3
# Powered = Off
#Channel 4
# Powered = Off
#Channel 5
# Powered = Off
#Channel 6
# Powered = Off
#Channel 7
# Powered = Off
#
*/

#define NUM_REGS_MAX 100

typedef struct Reg_Data{
   unsigned char Reg_Addr;
   unsigned char Reg_Val;
} Reg_Data;

Reg_Data const Reg_Store[NUM_REGS_MAX] = {
{ 15,0x00},
{ 16,0x6F},
{ 17,0x2F},
{ 18,0x4F},
{ 19,0x80},
{ 20,0x80},
{ 21,0x80},
{ 22,0xC0},
{ 23,0x80},
{ 24,0x00},
{ 25,0x00},
{ 26,0x00},
{ 27,0x01},
{ 28,0x00},
{ 29,0x0E},
{ 30,0x00},
{ 31,0x00},
{ 32,0x00},
{ 33,0x00},
{ 34,0x0C},
{ 35,0x35},
{ 36,0x00},
{ 37,0x0D},
{ 38,0xFA},
{ 39,0x00},
{ 40,0x09},
{ 41,0xBE},
{ 42,0x00},
{ 43,0x01},
{ 44,0x00},
{ 45,0x6A},
{ 46,0x00},
{ 47,0x00},
{ 48,0x00},
{ 49,0x00},
{ 50,0x00},
{ 51,0x01},
{ 52,0x00},
{ 53,0x6A},
{ 54,0x00},
{ 55,0x00},
{ 56,0x00},
{ 57,0x00},
{ 58,0x00},
{ 59,0x01},
{ 60,0x00},
{ 61,0x0E},
{ 62,0x00},
{ 63,0x00},
{ 64,0x00},
{ 65,0x00},
{ 66,0x00},
{ 67,0x00},
{ 68,0x00},
{ 69,0x00},
{ 70,0x00},
{ 71,0x00},
{ 72,0x00},
{ 73,0x00},
{ 74,0x00},
{ 75,0x00},
{ 76,0x00},
{ 77,0x00},
{ 78,0x00},
{ 79,0x00},
{ 80,0x00},
{ 81,0x00},
{ 82,0x00},
{ 83,0x00},
{ 84,0x00},
{ 85,0x00},
{ 86,0x00},
{ 87,0x00},
{ 88,0x00},
{ 89,0x00},
{ 90,0x00},
{ 91,0x00},
{ 92,0x00},
{149,0x00},
{150,0x00},
{151,0x00},
{152,0x00},
{153,0x00},
{154,0x00},
{155,0x00},
{156,0x00},
{157,0x00},
{158,0x00},
{159,0x00},
{160,0x00},
{161,0x00},
{162,0x00},
{163,0x00},
{164,0x00},
{165,0x00},
{166,0x8F},
{167,0x00},
{168,0x00},
{169,0x00},
{170,0x00},
};
//End of file


void writereg(unsigned char addr, unsigned char reg, unsigned char v) {
  Wire.beginTransmission(addr);
  Wire.write(reg);
  Wire.write(v);
  Wire.endTransmission();
}

void setup() {
  Wire.begin();
}

unsigned char a = 0x60;
void loop() {
  int i;
  for(i = 0; i < NUM_REGS_MAX; i++) {
    writereg(a, Reg_Store[i].Reg_Addr, Reg_Store[i].Reg_Val);
  }
  //a++;
}

