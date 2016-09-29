EESchema Schematic File Version 2
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
Sheet 3 8
Title "Antenna block, SWR-meter and RXTX switch"
Date "2016-09-22"
Rev "0.4"
Comp "PRK - OH2TI"
Comment1 "exla - OH2EHK"
Comment2 "tejeez - OH2EAT"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BNC P301
U 1 1 57E329E0
P 2800 3100
F 0 "P301" H 2810 3220 50  0000 C CNN
F 1 "BNC" V 2910 3040 50  0000 C CNN
F 2 "" H 2800 3100 50  0000 C CNN
F 3 "" H 2800 3100 50  0000 C CNN
	1    2800 3100
	-1   0    0    1   
$EndComp
$Comp
L C_Small C301
U 1 1 57E329E7
P 3150 3100
F 0 "C301" H 3160 3170 50  0000 L CNN
F 1 "1nF" H 3160 3020 50  0000 L CNN
F 2 "" H 3150 3100 50  0000 C CNN
F 3 "" H 3150 3100 50  0000 C CNN
	1    3150 3100
	0    1    1    0   
$EndComp
$Comp
L C_Small C302
U 1 1 57E329EE
P 3400 3300
F 0 "C302" H 3410 3370 50  0000 L CNN
F 1 "1nF" H 3410 3220 50  0000 L CNN
F 2 "" H 3400 3300 50  0000 C CNN
F 3 "" H 3400 3300 50  0000 C CNN
	1    3400 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 57E329F5
P 3800 3550
F 0 "#PWR010" H 3800 3300 50  0001 C CNN
F 1 "GND" H 3800 3400 50  0000 C CNN
F 2 "" H 3800 3550 50  0000 C CNN
F 3 "" H 3800 3550 50  0000 C CNN
	1    3800 3550
	1    0    0    -1  
$EndComp
$Comp
L L_Small L301
U 1 1 57E329FB
P 3600 3100
F 0 "L301" H 3630 3140 50  0000 L CNN
F 1 "660nH" H 3630 3060 50  0000 L CNN
F 2 "" H 3600 3100 50  0000 C CNN
F 3 "" H 3600 3100 50  0000 C CNN
	1    3600 3100
	0    -1   -1   0   
$EndComp
$Comp
L L_Small L302
U 1 1 57E32A02
P 4000 3100
F 0 "L302" H 4030 3140 50  0000 L CNN
F 1 "660nH" H 4030 3060 50  0000 L CNN
F 2 "" H 4000 3100 50  0000 C CNN
F 3 "" H 4000 3100 50  0000 C CNN
	1    4000 3100
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C303
U 1 1 57E32A09
P 3800 3300
F 0 "C303" H 3810 3370 50  0000 L CNN
F 1 "3nF" H 3810 3220 50  0000 L CNN
F 2 "" H 3800 3300 50  0000 C CNN
F 3 "" H 3800 3300 50  0000 C CNN
	1    3800 3300
	1    0    0    -1  
$EndComp
$Comp
L C_Small C304
U 1 1 57E32A10
P 4200 3300
F 0 "C304" H 4210 3370 50  0000 L CNN
F 1 "1nF" H 4210 3220 50  0000 L CNN
F 2 "" H 4200 3300 50  0000 C CNN
F 3 "" H 4200 3300 50  0000 C CNN
	1    4200 3300
	1    0    0    -1  
$EndComp
$Comp
L C_Small C305
U 1 1 57E32A17
P 4450 3100
F 0 "C305" H 4460 3170 50  0000 L CNN
F 1 "1nF" H 4460 3020 50  0000 L CNN
F 2 "" H 4450 3100 50  0000 C CNN
F 3 "" H 4450 3100 50  0000 C CNN
	1    4450 3100
	0    -1   -1   0   
$EndComp
$Comp
L microstrip LINE301
U 1 1 57E32A1E
P 5150 3150
F 0 "LINE301" H 5150 3000 60  0000 C CNN
F 1 "microstrip" H 5150 3300 60  0000 C CNN
F 2 "" H 5150 3125 60  0001 C CNN
F 3 "" H 5150 3125 60  0001 C CNN
	1    5150 3150
	1    0    0    -1  
$EndComp
$Comp
L R_Small R302
U 1 1 57E32A25
P 4650 3550
F 0 "R302" H 4680 3570 50  0000 L CNN
F 1 "50R" H 4680 3510 50  0000 L CNN
F 2 "" H 4650 3550 50  0000 C CNN
F 3 "" H 4650 3550 50  0000 C CNN
	1    4650 3550
	1    0    0    -1  
$EndComp
$Comp
L R_Small R303
U 1 1 57E32A2C
P 5650 3550
F 0 "R303" H 5680 3570 50  0000 L CNN
F 1 "50R" H 5680 3510 50  0000 L CNN
F 2 "" H 5650 3550 50  0000 C CNN
F 3 "" H 5650 3550 50  0000 C CNN
	1    5650 3550
	1    0    0    -1  
$EndComp
$Comp
L R_Small R301
U 1 1 57E32A33
P 4300 3900
F 0 "R301" H 4330 3920 50  0000 L CNN
F 1 "10k" H 4330 3860 50  0000 L CNN
F 2 "" H 4300 3900 50  0000 C CNN
F 3 "" H 4300 3900 50  0000 C CNN
	1    4300 3900
	0    1    1    0   
$EndComp
$Comp
L D_Schottky_Small D301
U 1 1 57E32A3A
P 4400 4200
F 0 "D301" H 4350 4280 50  0000 L CNN
F 1 "BAT83" H 4120 4120 50  0000 L CNN
F 2 "" V 4400 4200 50  0000 C CNN
F 3 "" V 4400 4200 50  0000 C CNN
	1    4400 4200
	0    -1   -1   0   
$EndComp
$Comp
L D_Schottky_Small D302
U 1 1 57E32A41
P 4950 3550
F 0 "D302" H 4900 3630 50  0000 L CNN
F 1 "BAT83" H 4670 3470 50  0000 L CNN
F 2 "" V 4950 3550 50  0000 C CNN
F 3 "" V 4950 3550 50  0000 C CNN
	1    4950 3550
	0    -1   -1   0   
$EndComp
$Comp
L D_Schottky_Small D303
U 1 1 57E32A48
P 5350 3550
F 0 "D303" H 5300 3630 50  0000 L CNN
F 1 "BAT83" H 5070 3470 50  0000 L CNN
F 2 "" V 5350 3550 50  0000 C CNN
F 3 "" V 5350 3550 50  0000 C CNN
	1    5350 3550
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C307
U 1 1 57E32A4F
P 4950 4000
F 0 "C307" H 4960 4070 50  0000 L CNN
F 1 "1nF" H 4960 3920 50  0000 L CNN
F 2 "" H 4950 4000 50  0000 C CNN
F 3 "" H 4950 4000 50  0000 C CNN
	1    4950 4000
	1    0    0    -1  
$EndComp
$Comp
L C_Small C308
U 1 1 57E32A56
P 5350 4000
F 0 "C308" H 5360 4070 50  0000 L CNN
F 1 "1nF" H 5360 3920 50  0000 L CNN
F 2 "" H 5350 4000 50  0000 C CNN
F 3 "" H 5350 4000 50  0000 C CNN
	1    5350 4000
	1    0    0    -1  
$EndComp
$Comp
L C_Small C309
U 1 1 57E32A5D
P 5650 4000
F 0 "C309" H 5660 4070 50  0000 L CNN
F 1 "100nF" H 5660 3920 50  0000 L CNN
F 2 "" H 5650 4000 50  0000 C CNN
F 3 "" H 5650 4000 50  0000 C CNN
	1    5650 4000
	1    0    0    -1  
$EndComp
$Comp
L C_Small C306
U 1 1 57E32A64
P 4650 4000
F 0 "C306" H 4660 4070 50  0000 L CNN
F 1 "100nF" H 4660 3920 50  0000 L CNN
F 2 "" H 4650 4000 50  0000 C CNN
F 3 "" H 4650 4000 50  0000 C CNN
	1    4650 4000
	1    0    0    -1  
$EndComp
$Comp
L +Vlogic #PWR011
U 1 1 57E32A6B
P 4100 3900
F 0 "#PWR011" H 4100 3700 50  0001 C CNN
F 1 "+Vlogic" H 4100 4100 50  0000 C CNN
F 2 "" H 4100 3900 50  0000 C CNN
F 3 "" H 4100 3900 50  0000 C CNN
	1    4100 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 57E32A71
P 5150 4300
F 0 "#PWR012" H 5150 4050 50  0001 C CNN
F 1 "GND" H 5150 4150 50  0000 C CNN
F 2 "" H 5150 4300 50  0000 C CNN
F 3 "" H 5150 4300 50  0000 C CNN
	1    5150 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3100 3050 3100
Wire Wire Line
	3250 3100 3500 3100
Wire Wire Line
	3400 3100 3400 3200
Connection ~ 3400 3100
Wire Wire Line
	3700 3100 3900 3100
Wire Wire Line
	3800 3200 3800 3100
Connection ~ 3800 3100
Wire Wire Line
	3400 3400 3400 3550
Wire Wire Line
	2600 3550 4200 3550
Wire Wire Line
	3800 3550 3800 3400
Wire Wire Line
	2800 2900 2600 2900
Wire Wire Line
	2600 2900 2600 3550
Connection ~ 3400 3550
Wire Wire Line
	4100 3100 4350 3100
Wire Wire Line
	4200 3100 4200 3200
Wire Wire Line
	4200 3550 4200 3400
Connection ~ 3800 3550
Connection ~ 4200 3100
Wire Wire Line
	4550 3100 4650 3100
Wire Wire Line
	4100 3900 4200 3900
Wire Wire Line
	4400 3900 4400 4100
Wire Wire Line
	4400 3900 4650 3900
Wire Wire Line
	4550 3900 4550 4550
Wire Wire Line
	4550 4550 5950 4550
Wire Wire Line
	5950 4550 5950 3850
Wire Wire Line
	5950 3850 5650 3850
Wire Wire Line
	5650 3650 5650 3900
Connection ~ 4550 3900
Connection ~ 5650 3850
Wire Wire Line
	5650 3450 5350 3450
Wire Wire Line
	5650 3450 5650 3200
Wire Wire Line
	4650 3200 4650 3450
Wire Wire Line
	4650 3450 4950 3450
Wire Wire Line
	4650 3900 4650 3650
Wire Wire Line
	4950 3650 4950 3900
Wire Wire Line
	5350 3650 5350 3900
Wire Wire Line
	4650 4100 4650 4200
Wire Wire Line
	4650 4200 5650 4200
Wire Wire Line
	5650 4200 5650 4100
Wire Wire Line
	5350 4100 5350 4200
Connection ~ 5350 4200
Wire Wire Line
	4950 4100 4950 4200
Connection ~ 4950 4200
Wire Wire Line
	5150 4200 5150 4300
Connection ~ 5150 4200
Text HLabel 6000 3700 2    60   Output ~ 0
SWR_ADC_A
Text HLabel 6000 3800 2    60   Output ~ 0
SWR_ADC_B
Wire Wire Line
	6000 3700 4950 3700
Connection ~ 4950 3700
Wire Wire Line
	6000 3800 5350 3800
Connection ~ 5350 3800
$Comp
L GND #PWR013
U 1 1 57E32AAA
P 4400 4400
F 0 "#PWR013" H 4400 4150 50  0001 C CNN
F 1 "GND" H 4400 4250 50  0000 C CNN
F 2 "" H 4400 4400 50  0000 C CNN
F 3 "" H 4400 4400 50  0000 C CNN
	1    4400 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4300 4400 4400
$Comp
L L_Small L303
U 1 1 57E32AB1
P 7200 3200
F 0 "L303" H 7230 3240 50  0000 L CNN
F 1 "1µ6" H 7230 3160 50  0000 L CNN
F 2 "" H 7200 3200 50  0000 C CNN
F 3 "" H 7200 3200 50  0000 C CNN
	1    7200 3200
	-1   0    0    1   
$EndComp
$Comp
L D_Small D304
U 1 1 57E32AC6
P 7200 3550
F 0 "D304" H 7150 3630 50  0000 L CNN
F 1 "1N4007" H 7050 3470 50  0000 L CNN
F 2 "" V 7200 3550 50  0000 C CNN
F 3 "" V 7200 3550 50  0000 C CNN
	1    7200 3550
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R304
U 1 1 57E32ACD
P 6900 3550
F 0 "R304" H 6930 3570 50  0000 L CNN
F 1 "100k" H 6930 3510 50  0000 L CNN
F 2 "" H 6900 3550 50  0000 C CNN
F 3 "" H 6900 3550 50  0000 C CNN
	1    6900 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C311
U 1 1 57E32AD4
P 7850 3450
F 0 "C311" H 7860 3520 50  0000 L CNN
F 1 "330pF" H 7860 3370 50  0000 L CNN
F 2 "" H 7850 3450 50  0000 C CNN
F 3 "" H 7850 3450 50  0000 C CNN
	1    7850 3450
	0    -1   -1   0   
$EndComp
$Comp
L D_Small D305
U 1 1 57E32ADB
P 7450 3100
F 0 "D305" H 7400 3180 50  0000 L CNN
F 1 "1N4007" H 7300 3020 50  0000 L CNN
F 2 "" V 7450 3100 50  0000 C CNN
F 3 "" V 7450 3100 50  0000 C CNN
	1    7450 3100
	1    0    0    -1  
$EndComp
$Comp
L R_Small R305
U 1 1 57E32AE2
P 7650 2950
F 0 "R305" H 7680 2970 50  0000 L CNN
F 1 "100R" H 7680 2910 50  0000 L CNN
F 2 "" H 7650 2950 50  0000 C CNN
F 3 "" H 7650 2950 50  0000 C CNN
	1    7650 2950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C310
U 1 1 57E32AE9
P 7850 3100
F 0 "C310" H 7860 3170 50  0000 L CNN
F 1 "10nF" H 7860 3020 50  0000 L CNN
F 2 "" H 7850 3100 50  0000 C CNN
F 3 "" H 7850 3100 50  0000 C CNN
	1    7850 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 3100 7350 3100
Connection ~ 7200 3100
Wire Wire Line
	7550 3100 7750 3100
Wire Wire Line
	7650 3050 7650 3100
Connection ~ 7650 3100
Wire Wire Line
	7200 3450 7200 3300
Wire Wire Line
	6900 3450 7750 3450
Connection ~ 7200 3450
Connection ~ 6900 3450
$Comp
L GND #PWR014
U 1 1 57E32AFA
P 7400 3750
F 0 "#PWR014" H 7400 3500 50  0001 C CNN
F 1 "GND" H 7400 3600 50  0000 C CNN
F 2 "" H 7400 3750 50  0000 C CNN
F 3 "" H 7400 3750 50  0000 C CNN
	1    7400 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 3750 7400 3750
Wire Wire Line
	7200 3650 7200 3750
Wire Wire Line
	6900 3750 6900 3650
Connection ~ 7200 3750
Text HLabel 8450 3100 2    60   Input ~ 0
TX_CHAIN
Wire Wire Line
	8450 3100 7950 3100
Text HLabel 8450 2850 2    60   Input ~ 0
RX_TX
Text HLabel 8000 4000 2    60   Output ~ 0
RX_CHAIN
$Comp
L INDUCTOR L304
U 1 1 57E72AA5
P 8050 2850
F 0 "L304" V 8000 2850 50  0000 C CNN
F 1 "10µH" V 8150 2850 50  0000 C CNN
F 2 "" H 8050 2850 50  0000 C CNN
F 3 "" H 8050 2850 50  0000 C CNN
	1    8050 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 2850 7750 2850
Wire Wire Line
	8350 2850 8450 2850
Wire Wire Line
	7950 3450 7950 4000
Wire Wire Line
	7950 4000 8000 4000
$EndSCHEMATC
