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
Sheet 1 8
Title "Block layer"
Date "2016-09-30"
Rev "1.0"
Comp "PRK - OH2TI"
Comment1 "exla - OH2EHK"
Comment2 "tejeez - OH2EAT"
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3850 4550 1450 1050
U 57E30E5C
F0 "Frequency synthesizer" 60
F1 "freq_synth.sch" 60
F2 "CLK_CPU" O L 3850 5400 60 
F3 "I2C1_SCL" B L 3850 5200 60 
F4 "I2C1_SDA" B L 3850 5050 60 
F5 "TX_LO_I" O R 5300 5150 60 
F6 "TX_LO_Q" O R 5300 5300 60 
F7 "RX_LO_Q" O R 5300 4850 60 
F8 "RX_LO_I" O R 5300 4700 60 
$EndSheet
$Sheet
S 9300 4600 1100 800 
U 57E31F2A
F0 "antenna_block" 60
F1 "antenna_block.sch" 60
F2 "SWR_ADC_A" O L 9300 5300 60 
F3 "SWR_ADC_B" O L 9300 5200 60 
F4 "TX_CHAIN" I L 9300 5000 60 
F5 "RX_TX" I L 9300 5100 60 
F6 "RX_CHAIN" O L 9300 4800 60 
$EndSheet
$Sheet
S 3800 1700 1400 950 
U 57E31551
F0 "PSU" 60
F1 "psu.sch" 60
F2 "Vlogic_OUT" O R 5200 1950 60 
F3 "Vin_connector" I L 3800 1950 60 
F4 "Vin_out" O R 5200 1800 60 
$EndSheet
$Comp
L +Vlogic #PWR01
U 1 1 57E3367B
P 5650 1900
F 0 "#PWR01" H 5650 1700 50  0001 C CNN
F 1 "+Vlogic" H 5650 2100 50  0000 C CNN
F 2 "" H 5650 1900 50  0000 C CNN
F 3 "" H 5650 1900 50  0000 C CNN
	1    5650 1900
	1    0    0    -1  
$EndComp
$Sheet
S 7550 4600 1100 800 
U 57E42B3F
F0 "TX_chain" 60
F1 "tx_chain.sch" 60
F2 "TX_I" I L 7550 4850 60 
F3 "TX_Q" I L 7550 4950 60 
F4 "LO_I" I L 7550 5150 60 
F5 "LO_Q" I L 7550 5300 60 
F6 "PA_BIAS" I R 8650 5300 60 
F7 "TX_CHAIN" O R 8650 5000 60 
F8 "TX_BIAS" I L 7550 4750 60 
F9 "PA_CURR_ADC" O R 8650 5200 60 
F10 "RX_TX" I R 8650 5100 60 
$EndSheet
$Sheet
S 7550 2500 1100 900 
U 57E4503B
F0 "RX_chain" 60
F1 "rx_chain.sch" 60
F2 "RX_CHAIN" I R 8650 3300 60 
F3 "LO_I" I L 7550 2600 60 
F4 "LO_Q" I L 7550 2700 60 
F5 "RX_I" O L 7550 3200 60 
F6 "RX_Q" O L 7550 3300 60 
F7 "RX_BIAS" I L 7550 3100 60 
$EndSheet
Wire Wire Line
	5200 1950 5650 1950
Wire Wire Line
	5650 1950 5650 1900
Wire Wire Line
	6800 4850 7550 4850
Wire Wire Line
	6650 4950 7550 4950
Wire Wire Line
	5300 5150 7550 5150
Wire Wire Line
	5300 5300 7550 5300
Wire Wire Line
	8650 5000 9300 5000
Wire Wire Line
	5200 3800 6650 3800
Wire Wire Line
	6650 3800 6650 4950
Wire Wire Line
	6800 4850 6800 3700
Wire Wire Line
	6800 3700 5200 3700
Wire Wire Line
	3650 3700 3650 5050
Wire Wire Line
	3650 5050 3850 5050
Wire Wire Line
	3000 3800 3950 3800
Wire Wire Line
	3550 3800 3550 5200
Wire Wire Line
	3550 5200 3850 5200
Wire Wire Line
	5900 2600 7550 2600
Wire Wire Line
	6000 2700 7550 2700
Wire Wire Line
	8650 3300 9150 3300
Wire Wire Line
	9150 3300 9150 4800
Wire Wire Line
	9150 4800 9300 4800
Wire Wire Line
	5200 3200 7550 3200
Wire Wire Line
	5200 3300 7550 3300
Wire Wire Line
	5300 4700 5900 4700
Wire Wire Line
	5900 4700 5900 2600
Wire Wire Line
	6000 2700 6000 4850
Wire Wire Line
	6000 4850 5300 4850
$Comp
L Vin #Vin02
U 1 1 57E58C68
P 5400 1550
F 0 "#Vin02" H 5550 1600 60  0001 C CNN
F 1 "Vin" H 5250 1600 60  0000 C CNN
F 2 "" H 5400 1550 60  0001 C CNN
F 3 "" H 5400 1550 60  0001 C CNN
	1    5400 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1800 5400 1800
Wire Wire Line
	5400 1800 5400 1550
$Sheet
S 3950 3000 1250 900 
U 57E49662
F0 "radio_conv" 60
F1 "radio_conv.sch" 60
F2 "RF_CHAIN_I2S" B L 3950 3150 60 
F3 "I2C1_SDA" B L 3950 3700 60 
F4 "I2C1_CLK" B L 3950 3800 60 
F5 "I2S_MCLK" I L 3950 3550 60 
F6 "RX_I" I R 5200 3200 60 
F7 "RX_Q" I R 5200 3300 60 
F8 "TX_I" O R 5200 3700 60 
F9 "TX_Q" O R 5200 3800 60 
F10 "RX_BIAS" O R 5200 3100 60 
F11 "TX_BIAS" O R 5200 3600 60 
F12 "RFLRC" B L 3950 3450 60 
F13 "RFDACDAT" I L 3950 3225 60 
F14 "RFADCDAT" O L 3950 3300 60 
F15 "RFBCLK" B L 3950 3375 60 
$EndSheet
Wire Wire Line
	5200 3100 7550 3100
Wire Wire Line
	5200 3600 6950 3600
Wire Wire Line
	6950 3600 6950 4750
Wire Wire Line
	6950 4750 7550 4750
$Sheet
S 1500 2975 1500 1100
U 57E5C816
F0 "CPU" 60
F1 "cpu.sch" 60
F2 "I2C1_SDA" B R 3000 3700 50 
F3 "I2C1_CLK" B R 3000 3800 50 
F4 "I2S_MCLK" O R 3000 3550 50 
F5 "RF_CHAIN_I2S" B R 3000 3150 50 
F6 "CLK_CPU" I R 3000 3925 50 
F7 "RX_TX" O L 1500 3825 60 
F8 "SWR_ADC_A" I L 1500 3625 60 
F9 "SWR_ADC_B" I L 1500 3725 60 
F10 "PA_CURR_ADC" I L 1500 3925 60 
F11 "PA_BIAS" O L 1500 4025 60 
F12 "RFDACDAT" B R 3000 3225 60 
F13 "RFADCDAT" B R 3000 3300 60 
F14 "RFBCLK" B R 3000 3375 60 
F15 "RFLRC" B R 3000 3450 60 
$EndSheet
Connection ~ 3550 3800
Wire Wire Line
	3000 3700 3950 3700
Connection ~ 3650 3700
Wire Wire Line
	3000 3550 3950 3550
Wire Wire Line
	3850 5400 3350 5400
Wire Wire Line
	3350 5400 3350 3925
Wire Wire Line
	3350 3925 3000 3925
Wire Wire Line
	8650 5100 9300 5100
Wire Wire Line
	9000 5100 9000 6200
Wire Wire Line
	9000 6200 1200 6200
Wire Wire Line
	1200 6200 1200 3825
Wire Wire Line
	1200 3825 1500 3825
Wire Wire Line
	8650 5200 8900 5200
Wire Wire Line
	8900 5200 8900 6100
Wire Wire Line
	8900 6100 1300 6100
Wire Wire Line
	1300 6100 1300 3925
Wire Wire Line
	1300 3925 1500 3925
Wire Wire Line
	8650 5300 8800 5300
Wire Wire Line
	8800 5300 8800 6000
Wire Wire Line
	8800 6000 1400 6000
Wire Wire Line
	1400 6000 1400 4025
Wire Wire Line
	1400 4025 1500 4025
Wire Wire Line
	9300 5200 9100 5200
Wire Wire Line
	9100 5200 9100 6300
Wire Wire Line
	9100 6300 1100 6300
Wire Wire Line
	1100 6300 1100 3725
Wire Wire Line
	1100 3725 1500 3725
Wire Wire Line
	9300 5300 9200 5300
Wire Wire Line
	9200 5300 9200 6400
Wire Wire Line
	9200 6400 1000 6400
Wire Wire Line
	1000 6400 1000 3625
Wire Wire Line
	1000 3625 1500 3625
Connection ~ 9000 5100
$Comp
L PWR_FLAG #FLG03
U 1 1 57EDEDF4
P 5700 1550
F 0 "#FLG03" H 5700 1645 50  0001 C CNN
F 1 "PWR_FLAG" H 5700 1730 50  0000 C CNN
F 2 "" H 5700 1550 50  0000 C CNN
F 3 "" H 5700 1550 50  0000 C CNN
	1    5700 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1550 5700 1550
$Comp
L PWR_FLAG #FLG04
U 1 1 57EDF2FE
P 3550 1950
F 0 "#FLG04" H 3550 2045 50  0001 C CNN
F 1 "PWR_FLAG" H 3550 2130 50  0000 C CNN
F 2 "" H 3550 1950 50  0000 C CNN
F 3 "" H 3550 1950 50  0000 C CNN
	1    3550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1950 3800 1950
Wire Wire Line
	3000 3225 3950 3225
Wire Wire Line
	3950 3300 3000 3300
Wire Wire Line
	3000 3375 3950 3375
Wire Wire Line
	3950 3450 3000 3450
NoConn ~ 3000 3150
NoConn ~ 3950 3150
Wire Notes Line
	2400 3100 3050 3100
Wire Notes Line
	3050 3100 3050 3600
Wire Notes Line
	3050 3600 2400 3600
Wire Notes Line
	2400 3600 2400 3100
Wire Notes Line
	3900 3100 4650 3100
Wire Notes Line
	4650 3100 4650 3600
Wire Notes Line
	4650 3600 3900 3600
Wire Notes Line
	3900 3600 3900 3100
Text Notes 3075 3175 0    50   ~ 0
This looks stupid\nbecause I2S in BUS\ndoes not work
$EndSCHEMATC
