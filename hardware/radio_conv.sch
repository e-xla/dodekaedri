EESchema Schematic File Version 2
LIBS:dodekaedri-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:dodekaedri
LIBS:Oscillators
LIBS:stm32
LIBS:dodekaedri-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 8
Title "RF chain ADC/DAC"
Date "2016-09-30"
Rev "1.0"
Comp "PRK - OH2TI"
Comment1 "exla - OH2EHK"
Comment2 "tejeez - OH2EAT"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L WM8731 U701
U 1 1 57E4C10B
P 5800 3600
F 0 "U701" H 5800 3450 60  0000 C CNN
F 1 "WM8731" H 5800 3800 60  0000 C CNN
F 2 "Housings_SSOP:SSOP-28_5.3x10.2mm_Pitch0.65mm" H 5800 4050 60  0001 C CNN
F 3 "" H 5800 4050 60  0001 C CNN
	1    5800 3600
	1    0    0    -1  
$EndComp
$Comp
L +Vlogic #PWR044
U 1 1 57E4C112
P 5800 2200
F 0 "#PWR044" H 5800 2000 50  0001 C CNN
F 1 "+Vlogic" H 5800 2400 50  0000 C CNN
F 2 "" H 5800 2200 50  0000 C CNN
F 3 "" H 5800 2200 50  0000 C CNN
	1    5800 2200
	1    0    0    -1  
$EndComp
$Comp
L C C701
U 1 1 57E4C13B
P 4675 2450
F 0 "C701" H 4700 2550 50  0000 L CNN
F 1 "10µF" H 4700 2350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4713 2300 50  0001 C CNN
F 3 "" H 4675 2450 50  0000 C CNN
	1    4675 2450
	1    0    0    -1  
$EndComp
$Comp
L C C702
U 1 1 57E4C142
P 4675 2750
F 0 "C702" H 4700 2850 50  0000 L CNN
F 1 "10µF" H 4700 2650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4713 2600 50  0001 C CNN
F 3 "" H 4675 2750 50  0000 C CNN
	1    4675 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR045
U 1 1 57E4C149
P 4300 2600
F 0 "#PWR045" H 4300 2350 50  0001 C CNN
F 1 "GND" H 4300 2450 50  0000 C CNN
F 2 "" H 4300 2600 50  0000 C CNN
F 3 "" H 4300 2600 50  0000 C CNN
	1    4300 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2600 5050 2600
Wire Wire Line
	5050 2300 5050 2400
Connection ~ 4675 2300
Wire Wire Line
	4675 2300 4675 2200
Wire Wire Line
	4200 2200 6975 2200
Connection ~ 4675 2600
$Comp
L C C703
U 1 1 57E4C15D
P 6700 2500
F 0 "C703" H 6725 2600 50  0000 L CNN
F 1 "10µF" H 6725 2400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6738 2350 50  0001 C CNN
F 3 "" H 6700 2500 50  0000 C CNN
	1    6700 2500
	1    0    0    -1  
$EndComp
$Comp
L C C704
U 1 1 57E4C164
P 6700 2950
F 0 "C704" H 6725 3050 50  0000 L CNN
F 1 "10µF" H 6725 2850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6738 2800 50  0001 C CNN
F 3 "" H 6700 2950 50  0000 C CNN
	1    6700 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2200 6700 2350
Connection ~ 5800 2200
Wire Wire Line
	6500 2350 6500 2400
Connection ~ 6700 2350
Wire Wire Line
	6500 2650 7225 2650
Wire Wire Line
	6500 2650 6500 2600
Connection ~ 6700 2650
$Comp
L GND #PWR046
U 1 1 57E4C178
P 7225 2650
F 0 "#PWR046" H 7225 2400 50  0001 C CNN
F 1 "GND" H 7225 2500 50  0000 C CNN
F 2 "" H 7225 2650 50  0000 C CNN
F 3 "" H 7225 2650 50  0000 C CNN
	1    7225 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6975 2200 6975 2800
Wire Wire Line
	6975 2800 6500 2800
Connection ~ 6700 2200
Connection ~ 6700 2800
Wire Wire Line
	6500 3000 6500 3100
Wire Wire Line
	6500 3100 7075 3100
Wire Wire Line
	7075 3100 7075 2650
Connection ~ 7075 2650
Connection ~ 6700 3100
NoConn ~ 6500 3300
NoConn ~ 6500 3450
NoConn ~ 6500 4150
NoConn ~ 6500 4750
NoConn ~ 5050 3550
NoConn ~ 5050 3650
Wire Wire Line
	4200 2900 5050 2900
Wire Wire Line
	5050 2900 5050 2800
Connection ~ 4675 2900
Wire Wire Line
	4200 2900 4200 2200
Connection ~ 4675 2200
$Comp
L +Vlogic #PWR047
U 1 1 57E4C199
P 4550 4300
F 0 "#PWR047" H 4550 4100 50  0001 C CNN
F 1 "+Vlogic" H 4550 4450 50  0000 C CNN
F 2 "" H 4550 4300 50  0000 C CNN
F 3 "" H 4550 4300 50  0000 C CNN
	1    4550 4300
	1    0    0    -1  
$EndComp
$Comp
L R R701
U 1 1 57E4C19F
P 4450 4450
F 0 "R701" V 4530 4450 50  0000 C CNN
F 1 "10k" V 4450 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4380 4450 50  0001 C CNN
F 3 "" H 4450 4450 50  0000 C CNN
	1    4450 4450
	1    0    0    -1  
$EndComp
$Comp
L R R702
U 1 1 57E4C1A6
P 4650 4450
F 0 "R702" V 4730 4450 50  0000 C CNN
F 1 "10k" V 4650 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4580 4450 50  0001 C CNN
F 3 "" H 4650 4450 50  0000 C CNN
	1    4650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4650 5050 4650
Wire Wire Line
	4650 4650 4650 4600
Wire Wire Line
	4150 4750 5050 4750
Wire Wire Line
	4450 4750 4450 4600
Connection ~ 4550 4300
$Comp
L C C705
U 1 1 57E4C1B6
P 6850 4600
F 0 "C705" H 6875 4700 50  0000 L CNN
F 1 "10µF" H 6875 4500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6888 4450 50  0001 C CNN
F 3 "" H 6850 4600 50  0000 C CNN
	1    6850 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4450 7350 4450
Connection ~ 6850 4450
Wire Wire Line
	6850 4750 7550 4750
$Comp
L GND #PWR048
U 1 1 57E4C1C1
P 7100 4750
F 0 "#PWR048" H 7100 4500 50  0001 C CNN
F 1 "GND" H 7100 4600 50  0000 C CNN
F 2 "" H 7100 4750 50  0000 C CNN
F 3 "" H 7100 4750 50  0000 C CNN
	1    7100 4750
	1    0    0    -1  
$EndComp
Text HLabel 4125 3625 0    60   BiDi ~ 0
RF_CHAIN_I2S
Text HLabel 4150 4650 0    60   BiDi ~ 0
I2C1_SDA
Connection ~ 4650 4650
Text HLabel 4150 4750 0    60   BiDi ~ 0
I2C1_CLK
Connection ~ 4450 4750
Text HLabel 6650 5050 2    60   Input ~ 0
I2S_MCLK
Wire Wire Line
	6500 4650 6600 4650
Wire Wire Line
	6600 4650 6600 5050
Wire Wire Line
	6600 5050 6650 5050
Text HLabel 4100 3050 0    60   Input ~ 0
RX_I
Text HLabel 4100 3250 0    60   Input ~ 0
RX_Q
$Comp
L GND #PWR049
U 1 1 57E4C1DF
P 5000 5200
F 0 "#PWR049" H 5000 4950 50  0001 C CNN
F 1 "GND" H 5000 5050 50  0000 C CNN
F 2 "" H 5000 5200 50  0000 C CNN
F 3 "" H 5000 5200 50  0000 C CNN
	1    5000 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4550 5000 4550
Wire Wire Line
	5000 4450 5000 4850
Text Notes 5450 4590 0    60   ~ 0
i2c=0x1A
Wire Notes Line
	5275 4500 5275 4600
Wire Notes Line
	5275 4600 5900 4600
Wire Notes Line
	5900 4600 5900 4500
Wire Notes Line
	5900 4500 5275 4500
Wire Wire Line
	5050 3050 4100 3050
Wire Wire Line
	4100 3250 5050 3250
Text HLabel 6750 3700 2    60   Output ~ 0
TX_I
Text HLabel 6750 3850 2    60   Output ~ 0
TX_Q
Wire Wire Line
	6500 3700 6750 3700
Wire Wire Line
	6500 3850 6750 3850
$Comp
L TL972IDR U702
U 1 1 57E46913
P 8050 4600
F 0 "U702" H 8050 4300 60  0000 C CNN
F 1 "MCP6L02" H 8050 4900 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 8100 4600 60  0001 C CNN
F 3 "" H 8100 4600 60  0001 C CNN
	1    8050 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4450 7350 5000
Wire Wire Line
	7350 4650 7550 4650
Wire Wire Line
	7350 5000 8550 5000
Wire Wire Line
	8550 5000 8550 4750
Connection ~ 7350 4650
Connection ~ 7100 4750
Wire Wire Line
	7550 4200 7550 4550
Wire Wire Line
	8550 4550 8550 4650
$Comp
L +Vlogic #PWR050
U 1 1 57E46B0D
P 8550 4150
F 0 "#PWR050" H 8550 3950 50  0001 C CNN
F 1 "+Vlogic" H 8550 4350 50  0000 C CNN
F 2 "" H 8550 4150 50  0000 C CNN
F 3 "" H 8550 4150 50  0000 C CNN
	1    8550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4150 8550 4450
Text HLabel 8850 4550 2    60   Output ~ 0
RX_BIAS
Text HLabel 8850 4200 2    60   Output ~ 0
TX_BIAS
Wire Wire Line
	7550 4200 8850 4200
Connection ~ 7550 4450
Wire Wire Line
	8550 4550 8850 4550
Wire Wire Line
	4825 3850 5050 3850
Wire Wire Line
	4750 3950 5050 3950
Wire Wire Line
	4675 4050 5050 4050
Wire Wire Line
	4825 4150 5050 4150
Wire Wire Line
	4750 4250 5050 4250
Connection ~ 5000 4550
Wire Wire Line
	4450 4300 4650 4300
Wire Wire Line
	5000 4450 5050 4450
Text Label 4850 3850 0    25   ~ 0
RFLRC
Text Label 4850 4150 0    25   ~ 0
RFLRC
Text Label 4850 3950 0    25   ~ 0
RFDACDAT
Text Label 4850 4050 0    25   ~ 0
RFADCDAT
Text Label 4850 4250 0    25   ~ 0
RFBCLK
$Comp
L R R703
U 1 1 57E786C6
P 5000 5000
F 0 "R703" V 5080 5000 50  0000 C CNN
F 1 "10k" V 5000 5000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4930 5000 50  0001 C CNN
F 3 "" H 5000 5000 50  0000 C CNN
	1    5000 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5200 5000 5150
Wire Wire Line
	5050 2300 4675 2300
Wire Wire Line
	6700 2350 6500 2350
NoConn ~ 4125 3625
Text HLabel 4125 3725 0    60   BiDi ~ 0
RFLRC
Text HLabel 4125 3800 0    60   Input ~ 0
RFDACDAT
Text HLabel 4125 3875 0    60   Output ~ 0
RFADCDAT
Text HLabel 4125 3950 0    60   BiDi ~ 0
RFBCLK
Wire Wire Line
	4825 3725 4825 4150
Wire Wire Line
	4825 3725 4125 3725
Wire Wire Line
	4750 3950 4750 3800
Wire Wire Line
	4750 3800 4125 3800
Wire Wire Line
	4125 3875 4675 3875
Wire Wire Line
	4675 3875 4675 4050
Connection ~ 4825 3850
Wire Wire Line
	4750 4250 4750 4100
Wire Wire Line
	4750 4100 4600 4100
Wire Wire Line
	4600 4100 4600 3950
Wire Wire Line
	4600 3950 4125 3950
$EndSCHEMATC
