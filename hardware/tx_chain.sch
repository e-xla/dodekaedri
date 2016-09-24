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
LIBS:dodekaedri-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1750 3750 0    60   Input ~ 0
TX_I
Text HLabel 1750 4450 0    60   Input ~ 0
TX_Q
$Comp
L 74LVC1G3157 U?
U 1 1 57E433BD
P 2650 3850
F 0 "U?" H 2650 3600 60  0000 C CNN
F 1 "74LVC1G3157" H 2650 4100 60  0000 C CNN
F 2 "" H 2650 3750 60  0001 C CNN
F 3 "" H 2650 3750 60  0001 C CNN
	1    2650 3850
	-1   0    0    1   
$EndComp
$Comp
L 74LVC1G3157 U?
U 1 1 57E433EF
P 2650 4550
F 0 "U?" H 2650 4300 60  0000 C CNN
F 1 "74LVC1G3157" H 2650 4800 60  0000 C CNN
F 2 "" H 2650 4450 60  0001 C CNN
F 3 "" H 2650 4450 60  0001 C CNN
	1    2650 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	3050 3950 3250 3950
Wire Wire Line
	3250 3950 3250 4650
Wire Wire Line
	3050 4650 3250 4650
Wire Wire Line
	3250 4650 3950 4650
Wire Wire Line
	3050 4450 3400 4450
Wire Wire Line
	3400 4450 3400 3750
Wire Wire Line
	3050 3750 3400 3750
Wire Wire Line
	3400 3750 3950 3750
$Comp
L GND #PWR?
U 1 1 57E4343C
P 3100 4100
F 0 "#PWR?" H 3100 3850 50  0001 C CNN
F 1 "GND" H 3100 3950 50  0000 C CNN
F 2 "" H 3100 4100 50  0000 C CNN
F 3 "" H 3100 4100 50  0000 C CNN
	1    3100 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3850 3100 3850
Wire Wire Line
	3100 3850 3100 4100
$Comp
L GND #PWR?
U 1 1 57E4345E
P 3100 4800
F 0 "#PWR?" H 3100 4550 50  0001 C CNN
F 1 "GND" H 3100 4650 50  0000 C CNN
F 2 "" H 3100 4800 50  0000 C CNN
F 3 "" H 3100 4800 50  0000 C CNN
	1    3100 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4550 3100 4550
Wire Wire Line
	3100 4550 3100 4800
Wire Wire Line
	1750 4450 2250 4450
Wire Wire Line
	1750 3750 2250 3750
$Comp
L +Vlogic #PWR?
U 1 1 57E434AC
P 2150 3550
F 0 "#PWR?" H 2150 3350 50  0001 C CNN
F 1 "+Vlogic" H 2150 3750 50  0000 C CNN
F 2 "" H 2150 3550 50  0000 C CNN
F 3 "" H 2150 3550 50  0000 C CNN
	1    2150 3550
	1    0    0    -1  
$EndComp
$Comp
L +Vlogic #PWR?
U 1 1 57E434C4
P 2150 4250
F 0 "#PWR?" H 2150 4050 50  0001 C CNN
F 1 "+Vlogic" H 2150 4450 50  0000 C CNN
F 2 "" H 2150 4250 50  0000 C CNN
F 3 "" H 2150 4250 50  0000 C CNN
	1    2150 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3550 2150 3850
Wire Wire Line
	2150 3850 2250 3850
Wire Wire Line
	2150 4250 2150 4550
Wire Wire Line
	2150 4550 2250 4550
Text HLabel 1750 3950 0    60   Input ~ 0
LO_I
Text HLabel 1750 4650 0    60   Input ~ 0
LO_Q
Wire Wire Line
	1750 3950 2250 3950
Wire Wire Line
	1750 4650 2250 4650
$Comp
L TRANSFO2 T?
U 1 1 57E43A1A
P 4350 4250
F 0 "T?" H 4350 4750 50  0000 C CNN
F 1 "TRANSFO2" H 4350 3750 50  0000 C CNN
F 2 "" H 4350 4250 50  0000 C CNN
F 3 "" H 4350 4250 50  0000 C CNN
	1    4350 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	3950 3750 3950 3850
Connection ~ 3400 3750
Connection ~ 3250 4650
$Comp
L CP C?
U 1 1 57E43A94
P 3550 4250
F 0 "C?" H 3575 4350 50  0000 L CNN
F 1 "CP" H 3575 4150 50  0000 L CNN
F 2 "" H 3588 4100 50  0000 C CNN
F 3 "" H 3550 4250 50  0000 C CNN
	1    3550 4250
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 57E43ABB
P 3750 4250
F 0 "C?" H 3775 4350 50  0000 L CNN
F 1 "C" H 3775 4150 50  0000 L CNN
F 2 "" H 3788 4100 50  0000 C CNN
F 3 "" H 3750 4250 50  0000 C CNN
	1    3750 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 4100 3750 4100
Wire Wire Line
	3750 4100 3950 4100
Wire Wire Line
	3950 4100 3950 4150
Wire Wire Line
	3950 4150 3950 4350
Connection ~ 3750 4100
Connection ~ 3750 4400
$Comp
L GND #PWR?
U 1 1 57E43B57
P 3650 4450
F 0 "#PWR?" H 3650 4200 50  0001 C CNN
F 1 "GND" H 3650 4300 50  0000 C CNN
F 2 "" H 3650 4450 50  0000 C CNN
F 3 "" H 3650 4450 50  0000 C CNN
	1    3650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4450 3650 4400
Connection ~ 3650 4400
$Comp
L GND #PWR?
U 1 1 57E43B98
P 5100 4800
F 0 "#PWR?" H 5100 4550 50  0001 C CNN
F 1 "GND" H 5100 4650 50  0000 C CNN
F 2 "" H 5100 4800 50  0000 C CNN
F 3 "" H 5100 4800 50  0000 C CNN
	1    5100 4800
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L?
U 1 1 57E43D3D
P 5300 4050
F 0 "L?" V 5250 4050 50  0000 C CNN
F 1 "INDUCTOR" V 5400 4050 50  0000 C CNN
F 2 "" H 5300 4050 50  0000 C CNN
F 3 "" H 5300 4050 50  0000 C CNN
	1    5300 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4750 4050 5000 4050
$Comp
L C C?
U 1 1 57E43D92
P 5700 4300
F 0 "C?" H 5725 4400 50  0000 L CNN
F 1 "C" H 5725 4200 50  0000 L CNN
F 2 "" H 5738 4150 50  0000 C CNN
F 3 "" H 5700 4300 50  0000 C CNN
	1    5700 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4450 5100 4450
Wire Wire Line
	5100 4450 5700 4450
Wire Wire Line
	5700 4150 5700 4050
Wire Wire Line
	5600 4050 5700 4050
Wire Wire Line
	5700 4050 5800 4050
$Comp
L C C?
U 1 1 57E43F9B
P 5950 4050
F 0 "C?" H 5975 4150 50  0000 L CNN
F 1 "C" H 5975 3950 50  0000 L CNN
F 2 "" H 5988 3900 50  0000 C CNN
F 3 "" H 5950 4050 50  0000 C CNN
	1    5950 4050
	0    -1   -1   0   
$EndComp
Connection ~ 5700 4050
$Comp
L Q_NPN_BCE Q?
U 1 1 57E4419A
P 6500 4050
F 0 "Q?" H 6800 4100 50  0000 R CNN
F 1 "Q_NPN_BCE" H 7100 4000 50  0000 R CNN
F 2 "" H 6700 4150 50  0000 C CNN
F 3 "" H 6500 4050 50  0000 C CNN
	1    6500 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4050 6200 4050
Wire Wire Line
	6200 4050 6300 4050
$Comp
L R R?
U 1 1 57E44201
P 6600 4500
F 0 "R?" V 6680 4500 50  0000 C CNN
F 1 "R" V 6600 4500 50  0000 C CNN
F 2 "" V 6530 4500 50  0000 C CNN
F 3 "" H 6600 4500 50  0000 C CNN
	1    6600 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4800 5100 4450
Connection ~ 5100 4450
$Comp
L GND #PWR?
U 1 1 57E44284
P 6600 4800
F 0 "#PWR?" H 6600 4550 50  0001 C CNN
F 1 "GND" H 6600 4650 50  0000 C CNN
F 2 "" H 6600 4800 50  0000 C CNN
F 3 "" H 6600 4800 50  0000 C CNN
	1    6600 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4800 6600 4650
Wire Wire Line
	6600 4350 6600 4250
$Comp
L Vin #Vin?
U 1 1 57E4514D
P 6600 3050
F 0 "#Vin?" H 6750 3100 60  0001 C CNN
F 1 "Vin" H 6450 3100 60  0000 C CNN
F 2 "" H 6600 3050 60  0001 C CNN
F 3 "" H 6600 3050 60  0001 C CNN
	1    6600 3050
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 57E45175
P 6600 3350
F 0 "R?" V 6680 3350 50  0000 C CNN
F 1 "R" V 6600 3350 50  0000 C CNN
F 2 "" V 6530 3350 50  0000 C CNN
F 3 "" H 6600 3350 50  0000 C CNN
	1    6600 3350
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 57E451B8
P 6850 3350
F 0 "C?" H 6875 3450 50  0000 L CNN
F 1 "C" H 6875 3250 50  0000 L CNN
F 2 "" H 6888 3200 50  0000 C CNN
F 3 "" H 6850 3350 50  0000 C CNN
	1    6850 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 57E451F7
P 6850 3550
F 0 "#PWR?" H 6850 3300 50  0001 C CNN
F 1 "GND" H 6850 3400 50  0000 C CNN
F 2 "" H 6850 3550 50  0000 C CNN
F 3 "" H 6850 3550 50  0000 C CNN
	1    6850 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3050 6600 3200
Wire Wire Line
	6600 3200 6850 3200
Wire Wire Line
	6850 3500 6850 3550
Wire Wire Line
	6600 3500 6600 3800
Wire Wire Line
	6600 3800 6600 3850
$Comp
L C C?
U 1 1 57E45382
P 7200 3800
F 0 "C?" H 7225 3900 50  0000 L CNN
F 1 "C" H 7225 3700 50  0000 L CNN
F 2 "" H 7238 3650 50  0000 C CNN
F 3 "" H 7200 3800 50  0000 C CNN
	1    7200 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 3800 6600 3800
Connection ~ 6600 3800
$Comp
L C C?
U 1 1 57E45449
P 7700 3800
F 0 "C?" H 7725 3900 50  0000 L CNN
F 1 "C" H 7725 3700 50  0000 L CNN
F 2 "" H 7738 3650 50  0000 C CNN
F 3 "" H 7700 3800 50  0000 C CNN
	1    7700 3800
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 57E454D9
P 7950 4200
F 0 "R?" V 8030 4200 50  0000 C CNN
F 1 "R" V 7950 4200 50  0000 C CNN
F 2 "" V 7880 4200 50  0000 C CNN
F 3 "" H 7950 4200 50  0000 C CNN
	1    7950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3800 7950 3800
Wire Wire Line
	7950 3800 8050 3800
Wire Wire Line
	7950 3800 7950 4050
Wire Wire Line
	7350 3800 7450 3800
Wire Wire Line
	7450 3800 7550 3800
$Comp
L R R?
U 1 1 57E45614
P 7950 3500
F 0 "R?" V 8030 3500 50  0000 C CNN
F 1 "R" V 7950 3500 50  0000 C CNN
F 2 "" V 7880 3500 50  0000 C CNN
F 3 "" H 7950 3500 50  0000 C CNN
	1    7950 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 3500 7450 3500
Wire Wire Line
	7450 3500 7450 3800
Connection ~ 7450 3800
$Comp
L Q_NMOS_DGS Q?
U 1 1 57E456E5
P 8250 3800
F 0 "Q?" H 8550 3850 50  0000 R CNN
F 1 "Q_NMOS_DGS" H 8900 3750 50  0000 R CNN
F 2 "" H 8450 3900 50  0000 C CNN
F 3 "" H 8250 3800 50  0000 C CNN
	1    8250 3800
	1    0    0    -1  
$EndComp
Connection ~ 7950 3800
Wire Wire Line
	8100 3500 8350 3500
Wire Wire Line
	8350 3500 9100 3500
Wire Wire Line
	9100 3500 9200 3500
Wire Wire Line
	8350 3400 8350 3500
Wire Wire Line
	8350 3500 8350 3600
$Comp
L INDUCTOR L?
U 1 1 57E457BC
P 8350 3100
F 0 "L?" V 8300 3100 50  0000 C CNN
F 1 "INDUCTOR" V 8450 3100 50  0000 C CNN
F 2 "" H 8350 3100 50  0000 C CNN
F 3 "" H 8350 3100 50  0000 C CNN
	1    8350 3100
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 57E45873
P 8100 2950
F 0 "C?" H 8125 3050 50  0000 L CNN
F 1 "C" H 8125 2850 50  0000 L CNN
F 2 "" H 8138 2800 50  0000 C CNN
F 3 "" H 8100 2950 50  0000 C CNN
	1    8100 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 57E458EE
P 8100 3150
F 0 "#PWR?" H 8100 2900 50  0001 C CNN
F 1 "GND" H 8100 3000 50  0000 C CNN
F 2 "" H 8100 3150 50  0000 C CNN
F 3 "" H 8100 3150 50  0000 C CNN
	1    8100 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3100 8100 3150
Wire Wire Line
	8100 2800 8350 2800
Connection ~ 8350 3500
$Comp
L INDUCTOR L?
U 1 1 57E45A17
P 8350 2500
F 0 "L?" V 8300 2500 50  0000 C CNN
F 1 "FB" V 8450 2500 50  0000 C CNN
F 2 "" H 8350 2500 50  0000 C CNN
F 3 "" H 8350 2500 50  0000 C CNN
	1    8350 2500
	1    0    0    -1  
$EndComp
$Comp
L Vin #Vin?
U 1 1 57E45ADD
P 8350 2200
F 0 "#Vin?" H 8500 2250 60  0001 C CNN
F 1 "Vin" H 8200 2250 60  0000 C CNN
F 2 "" H 8350 2200 60  0001 C CNN
F 3 "" H 8350 2200 60  0001 C CNN
	1    8350 2200
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 57E45DCC
P 8350 4750
F 0 "R?" V 8430 4750 50  0000 C CNN
F 1 "R" V 8350 4750 50  0000 C CNN
F 2 "" V 8280 4750 50  0000 C CNN
F 3 "" H 8350 4750 50  0000 C CNN
	1    8350 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 57E45E2D
P 8350 4900
F 0 "#PWR?" H 8350 4650 50  0001 C CNN
F 1 "GND" H 8350 4750 50  0000 C CNN
F 2 "" H 8350 4900 50  0000 C CNN
F 3 "" H 8350 4900 50  0000 C CNN
	1    8350 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 4000 8350 4600
$Comp
L INDUCTOR L?
U 1 1 57E462B8
P 9500 3500
F 0 "L?" V 9450 3500 50  0000 C CNN
F 1 "INDUCTOR" V 9600 3500 50  0000 C CNN
F 2 "" H 9500 3500 50  0000 C CNN
F 3 "" H 9500 3500 50  0000 C CNN
	1    9500 3500
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 57E46317
P 9100 3750
F 0 "C?" H 9125 3850 50  0000 L CNN
F 1 "C" H 9125 3650 50  0000 L CNN
F 2 "" H 9138 3600 50  0000 C CNN
F 3 "" H 9100 3750 50  0000 C CNN
	1    9100 3750
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 57E46389
P 9900 3750
F 0 "C?" H 9925 3850 50  0000 L CNN
F 1 "C" H 9925 3650 50  0000 L CNN
F 2 "" H 9938 3600 50  0000 C CNN
F 3 "" H 9900 3750 50  0000 C CNN
	1    9900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3500 9100 3600
Connection ~ 9100 3500
Wire Wire Line
	9900 3600 9900 3500
Connection ~ 9900 3500
$Comp
L GND #PWR?
U 1 1 57E465CB
P 9500 4100
F 0 "#PWR?" H 9500 3850 50  0001 C CNN
F 1 "GND" H 9500 3950 50  0000 C CNN
F 2 "" H 9500 4100 50  0000 C CNN
F 3 "" H 9500 4100 50  0000 C CNN
	1    9500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3900 9500 3900
Wire Wire Line
	9500 3900 9900 3900
Wire Wire Line
	9500 4100 9500 3900
Connection ~ 9500 3900
Text HLabel 8300 5250 2    60   Input ~ 0
PA_BIAS
Wire Wire Line
	7950 4350 7950 5250
Wire Wire Line
	7950 5250 8300 5250
Wire Wire Line
	9800 3500 9900 3500
Wire Wire Line
	9900 3500 10200 3500
Text HLabel 10200 3500 2    60   Output ~ 0
TX_CHAIN
$Comp
L R R?
U 1 1 57E47067
P 6050 3400
F 0 "R?" V 6130 3400 50  0000 C CNN
F 1 "R" V 6050 3400 50  0000 C CNN
F 2 "" V 5980 3400 50  0000 C CNN
F 3 "" H 6050 3400 50  0000 C CNN
	1    6050 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6200 3400 6200 4050
Connection ~ 6200 4050
$Comp
L ZENER D?
U 1 1 57E47172
P 5700 3600
F 0 "D?" H 5700 3700 50  0000 C CNN
F 1 "ZENER" H 5700 3500 50  0000 C CNN
F 2 "" H 5700 3600 50  0000 C CNN
F 3 "" H 5700 3600 50  0000 C CNN
	1    5700 3600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 57E471D5
P 5700 3800
F 0 "#PWR?" H 5700 3550 50  0001 C CNN
F 1 "GND" H 5700 3650 50  0000 C CNN
F 2 "" H 5700 3800 50  0000 C CNN
F 3 "" H 5700 3800 50  0000 C CNN
	1    5700 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3400 5700 3400
$Comp
L C C?
U 1 1 57E4750C
P 8850 4750
F 0 "C?" H 8875 4850 50  0000 L CNN
F 1 "C" H 8875 4650 50  0000 L CNN
F 2 "" H 8888 4600 50  0000 C CNN
F 3 "" H 8850 4750 50  0000 C CNN
	1    8850 4750
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 57E4759D
P 8600 4600
F 0 "R?" V 8680 4600 50  0000 C CNN
F 1 "R" V 8600 4600 50  0000 C CNN
F 2 "" V 8530 4600 50  0000 C CNN
F 3 "" H 8600 4600 50  0000 C CNN
	1    8600 4600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8750 4600 8850 4600
Wire Wire Line
	8850 4600 9450 4600
Connection ~ 8850 4600
Wire Wire Line
	8850 4900 8350 4900
Text HLabel 9450 4600 2    60   Output ~ 0
joku_adc
Wire Wire Line
	5700 3400 5700 3150
Text Notes 6100 3100 2    60   ~ 0
tejeezin joku juttu
Wire Wire Line
	5700 3150 5250 3150
Wire Wire Line
	5250 3150 5250 3000
Wire Wire Line
	5250 3000 6100 3000
Wire Wire Line
	6100 3000 6100 3150
Wire Wire Line
	6100 3150 5750 3150
NoConn ~ 5750 3150
Wire Wire Line
	3550 4400 3650 4400
Wire Wire Line
	3650 4400 3750 4400
Connection ~ 3950 4150
Wire Wire Line
	8350 4600 8450 4600
$Comp
L +Vlogic #PWR?
U 1 1 57E47CF4
P 9150 4300
F 0 "#PWR?" H 9150 4100 50  0001 C CNN
F 1 "+Vlogic" H 9150 4500 50  0000 C CNN
F 2 "" H 9150 4300 50  0000 C CNN
F 3 "" H 9150 4300 50  0000 C CNN
	1    9150 4300
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky D?
U 1 1 57E47D6E
P 9150 4450
F 0 "D?" H 9150 4550 50  0000 C CNN
F 1 "BAT83" H 9150 4350 50  0000 C CNN
F 2 "" H 9150 4450 50  0000 C CNN
F 3 "" H 9150 4450 50  0000 C CNN
	1    9150 4450
	0    1    1    0   
$EndComp
$Comp
L D_Schottky D?
U 1 1 57E47E31
P 9150 4750
F 0 "D?" H 9150 4850 50  0000 C CNN
F 1 "BAT83" H 9150 4650 50  0000 C CNN
F 2 "" H 9150 4750 50  0000 C CNN
F 3 "" H 9150 4750 50  0000 C CNN
	1    9150 4750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 57E47E8B
P 9150 4900
F 0 "#PWR?" H 9150 4650 50  0001 C CNN
F 1 "GND" H 9150 4750 50  0000 C CNN
F 2 "" H 9150 4900 50  0000 C CNN
F 3 "" H 9150 4900 50  0000 C CNN
	1    9150 4900
	1    0    0    -1  
$EndComp
$EndSCHEMATC