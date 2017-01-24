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
Sheet 4 8
Title "Power supply unit"
Date "2016-09-30"
Rev "1.0"
Comp "PRK - OH2TI"
Comment1 "exla - OH2EHK"
Comment2 "tejeez - OH2EAT"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L NCP3170-D U401
U 1 1 57E31894
P 5450 3450
F 0 "U401" H 5800 3650 60  0000 C CNN
F 1 "NCP3170-D" H 5700 3800 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 5450 3450 60  0001 C CNN
F 3 "" H 5450 3450 60  0001 C CNN
	1    5450 3450
	1    0    0    -1  
$EndComp
$Comp
L C C403
U 1 1 57E318C6
P 4800 3700
F 0 "C403" H 4825 3800 50  0000 L CNN
F 1 "6n8" H 4825 3600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4838 3550 50  0001 C CNN
F 3 "" H 4800 3700 50  0000 C CNN
	1    4800 3700
	1    0    0    -1  
$EndComp
$Comp
L C C402
U 1 1 57E31943
P 4700 3100
F 0 "C402" H 4725 3200 50  0000 L CNN
F 1 "10µF" H 4725 3000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4738 2950 50  0001 C CNN
F 3 "" H 4700 3100 50  0000 C CNN
	1    4700 3100
	-1   0    0    1   
$EndComp
$Comp
L C C404
U 1 1 57E3197A
P 7000 3750
F 0 "C404" H 7025 3850 50  0000 L CNN
F 1 "10µF" H 7025 3650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7038 3600 50  0001 C CNN
F 3 "" H 7000 3750 50  0000 C CNN
	1    7000 3750
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L402
U 1 1 57E319E7
P 6250 3350
F 0 "L402" V 6200 3350 50  0000 C CNN
F 1 "100µH" V 6350 3350 50  0000 C CNN
F 2 "dodekaedri:psu_ind" H 6250 3350 50  0001 C CNN
F 3 "" H 6250 3350 50  0000 C CNN
	1    6250 3350
	0    -1   -1   0   
$EndComp
$Comp
L R R403
U 1 1 57E31B20
P 6600 3550
F 0 "R403" V 6680 3550 50  0000 C CNN
F 1 "24k9" V 6600 3550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6530 3550 50  0001 C CNN
F 3 "" H 6600 3550 50  0000 C CNN
	1    6600 3550
	1    0    0    -1  
$EndComp
$Comp
L R R404
U 1 1 57E31B73
P 6600 3950
F 0 "R404" V 6680 3950 50  0000 C CNN
F 1 "7k87" V 6600 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6530 3950 50  0001 C CNN
F 3 "" H 6600 3950 50  0000 C CNN
	1    6600 3950
	1    0    0    -1  
$EndComp
$Comp
L R R402
U 1 1 57E31B96
P 5000 4100
F 0 "R402" V 5080 4100 50  0000 C CNN
F 1 "4k99" V 5000 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4930 4100 50  0001 C CNN
F 3 "" H 5000 4100 50  0000 C CNN
	1    5000 4100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 3350 5950 3350
Wire Wire Line
	6600 3400 6600 3350
Wire Wire Line
	6600 3700 6600 3800
Wire Wire Line
	5900 3750 6600 3750
Connection ~ 6600 3750
Wire Wire Line
	5450 4050 5450 4300
Wire Wire Line
	3350 4200 8150 4200
Wire Wire Line
	7000 3350 7000 3600
Connection ~ 6600 3350
Wire Wire Line
	5300 4050 5300 4200
Wire Wire Line
	4950 3350 4450 3350
Wire Wire Line
	4450 3350 4450 2950
Connection ~ 4700 2950
Wire Wire Line
	4800 3550 4950 3550
Wire Wire Line
	4800 3850 4800 4100
Wire Wire Line
	4800 4100 4850 4100
Connection ~ 5300 4100
Connection ~ 5450 4200
$Comp
L GND #PWR018
U 1 1 57E32388
P 5450 4300
F 0 "#PWR018" H 5450 4050 50  0001 C CNN
F 1 "GND" H 5450 4150 50  0000 C CNN
F 2 "" H 5450 4300 50  0000 C CNN
F 3 "" H 5450 4300 50  0000 C CNN
	1    5450 4300
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK CON401
U 1 1 57E323EC
P 1950 3050
F 0 "CON401" H 1950 3300 50  0000 C CNN
F 1 "BARREL_JACK" H 1950 2850 50  0000 C CNN
F 2 "Connect:BARREL_JACK" H 1950 3050 50  0001 C CNN
F 3 "" H 1950 3050 50  0000 C CNN
	1    1950 3050
	1    0    0    -1  
$EndComp
Connection ~ 4450 2950
Wire Wire Line
	2250 3050 2250 3450
Connection ~ 5300 4200
Connection ~ 2250 3150
Connection ~ 7000 3350
$Comp
L TEST_1P W401
U 1 1 57E328A9
P 4450 3800
F 0 "W401" H 4450 4070 50  0000 C CNN
F 1 "TEST_1P" H 4450 4000 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Big" H 4650 3800 50  0001 C CNN
F 3 "" H 4650 3800 50  0000 C CNN
	1    4450 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 3800 4450 3450
Wire Wire Line
	4200 3450 4950 3450
$Comp
L C C401
U 1 1 57ECEA95
P 3350 3200
F 0 "C401" H 3375 3300 50  0000 L CNN
F 1 "10µF" H 3375 3100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3388 3050 50  0001 C CNN
F 3 "" H 3350 3200 50  0000 C CNN
	1    3350 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2950 5350 2950
Wire Wire Line
	4700 3250 4700 4200
Connection ~ 4700 4200
$Comp
L C C405
U 1 1 57E32EF4
P 7800 3750
F 0 "C405" H 7825 3850 50  0000 L CNN
F 1 "10µF" H 7825 3650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7838 3600 50  0001 C CNN
F 3 "" H 7800 3750 50  0000 C CNN
	1    7800 3750
	1    0    0    -1  
$EndComp
Connection ~ 7800 3350
Wire Wire Line
	7800 4200 7800 3900
Connection ~ 7000 4200
Wire Wire Line
	7800 3350 7800 3600
Text HLabel 8350 3350 2    60   Output ~ 0
Vlogic_OUT
Wire Wire Line
	5150 4100 6600 4100
$Comp
L R R401
U 1 1 57E40BA6
P 4200 3300
F 0 "R401" V 4280 3300 50  0000 C CNN
F 1 "100k" V 4200 3300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4130 3300 50  0001 C CNN
F 3 "" H 4200 3300 50  0000 C CNN
	1    4200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 2950 4200 3150
Connection ~ 4200 2950
Connection ~ 4450 3450
Connection ~ 3350 2950
$Comp
L PWR_FLAG #FLG019
U 1 1 57E44620
P 5350 2950
F 0 "#FLG019" H 5350 3045 50  0001 C CNN
F 1 "PWR_FLAG" H 5350 3130 50  0000 C CNN
F 2 "" H 5350 2950 50  0000 C CNN
F 3 "" H 5350 2950 50  0000 C CNN
	1    5350 2950
	1    0    0    -1  
$EndComp
Text HLabel 2150 2650 0    60   Input ~ 0
Vin_connector
Wire Wire Line
	2150 2650 2250 2650
Wire Wire Line
	2250 2950 3400 2950
Wire Wire Line
	3350 2600 3350 3050
$Comp
L ZENER D401
U 1 1 57E57556
P 3100 3200
F 0 "D401" H 3100 3300 50  0000 C CNN
F 1 "824520141" H 3100 3100 50  0000 C CNN
F 2 "Diodes_SMD:SMA_Handsoldering" H 3100 3200 50  0001 C CNN
F 3 "" H 3100 3200 50  0000 C CNN
	1    3100 3200
	0    1    1    0   
$EndComp
Connection ~ 3100 3450
Wire Wire Line
	3350 3350 3350 4200
Text HLabel 3500 2600 2    60   Output ~ 0
Vin_out
Wire Wire Line
	3500 2600 3350 2600
$Comp
L FILTER FB401
U 1 1 57E5F407
P 3750 2950
F 0 "FB401" H 3750 3100 50  0000 C CNN
F 1 "FILTER" H 3750 2850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 3750 2950 50  0001 C CNN
F 3 "" H 3750 2950 50  0000 C CNN
	1    3750 2950
	1    0    0    -1  
$EndComp
$Comp
L FILTER FB402
U 1 1 57E5F6B8
P 7400 3350
F 0 "FB402" H 7400 3500 50  0000 C CNN
F 1 "FILTER" H 7400 3250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 7400 3350 50  0001 C CNN
F 3 "" H 7400 3350 50  0000 C CNN
	1    7400 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3350 8350 3350
Wire Wire Line
	6550 3350 7050 3350
$Comp
L ZENER D402
U 1 1 57ED7CD8
P 8150 3750
F 0 "D402" H 8150 3850 50  0000 C CNN
F 1 "MSP3V3" H 8150 3650 50  0000 C CNN
F 2 "dodekaedri:Micro_SMP" H 8150 3750 50  0001 C CNN
F 3 "" H 8150 3750 50  0000 C CNN
	1    8150 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 3550 8150 3350
Connection ~ 8150 3350
Wire Wire Line
	8150 4200 8150 3950
Connection ~ 7800 4200
Connection ~ 3350 3450
Wire Wire Line
	3100 3000 3100 2950
Wire Wire Line
	2250 3450 3350 3450
Wire Wire Line
	3100 3400 3100 3450
Wire Wire Line
	7000 3900 7000 4200
Wire Wire Line
	2250 2650 2250 2950
$Comp
L PWR_FLAG #FLG020
U 1 1 57EE5195
P 3700 4200
F 0 "#FLG020" H 3700 4295 50  0001 C CNN
F 1 "PWR_FLAG" H 3700 4380 50  0000 C CNN
F 2 "" H 3700 4200 50  0000 C CNN
F 3 "" H 3700 4200 50  0000 C CNN
	1    3700 4200
	1    0    0    -1  
$EndComp
Connection ~ 3700 4200
Connection ~ 3100 2950
$Comp
L Vin #Vin021
U 1 1 57F50F83
P 3350 2600
F 0 "#Vin021" H 3500 2650 60  0001 C CNN
F 1 "Vin" H 3200 2650 60  0000 C CNN
F 2 "" H 3350 2600 60  0001 C CNN
F 3 "" H 3350 2600 60  0001 C CNN
	1    3350 2600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
