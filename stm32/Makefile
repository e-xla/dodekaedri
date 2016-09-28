CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

# Download standard peripheral library from http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32-standard-peripheral-libraries/stsw-stm32065.html
# and write its path here
STDPERIPH=$(HOME)/Downloads/STM32F4xx_DSP_StdPeriph_Lib_V1.7.1

DRIVER=$(STDPERIPH)/Libraries/STM32F4xx_StdPeriph_Driver

CFLAGS=-g -O2 -Wall -Wextra -mlittle-endian -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32F40XX -DUSE_STDPERIPH_DRIVER

# Tell the library that our clock input has a frequency of 26 MHz
CFLAGS+= "-DHSE_VALUE=((uint32_t)26000000)"

CFLAGS+= -I$(STDPERIPH)/Libraries/CMSIS/Include
CFLAGS+= -I$(STDPERIPH)/Libraries/CMSIS/Device/ST/STM32F4xx/Include
CFLAGS+= -I$(STDPERIPH)/Libraries/STM32F4xx_StdPeriph_Driver/inc/
CFLAGS+= -I.

LDFLAGS= -TSTM32F401RETx_FLASH.ld -mlittle-endian -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 

STARTUP=$(STDPERIPH)/Libraries/CMSIS/Device/ST/STM32F4xx/Source/Templates/SW4STM32/startup_stm32f401xx.s

OBJECTS=dodekaedri.o uart.o i2c.o stm32f4xx_gpio.o stm32f4xx_rcc.o stm32f4xx_spi.o stm32f4xx_i2c.o stm32f4xx_usart.o startup.o

dodekaedri.bin: dodekaedri.elf
	$(OBJCOPY) -O binary $^ $@

dodekaedri.elf: $(OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@

stm32f4xx_gpio.o: $(DRIVER)/src/stm32f4xx_gpio.c stm32f4xx_conf.h
	$(CC) $(CFLAGS) $(DRIVER)/src/stm32f4xx_gpio.c -c -o $@

stm32f4xx_rcc.o: $(DRIVER)/src/stm32f4xx_rcc.c stm32f4xx_conf.h
	$(CC) $(CFLAGS) $(DRIVER)/src/stm32f4xx_rcc.c -c -o $@

stm32f4xx_spi.o: $(DRIVER)/src/stm32f4xx_spi.c stm32f4xx_conf.h
	$(CC) $(CFLAGS) $(DRIVER)/src/stm32f4xx_spi.c -c -o $@

stm32f4xx_i2c.o: $(DRIVER)/src/stm32f4xx_i2c.c stm32f4xx_conf.h
	$(CC) $(CFLAGS) $(DRIVER)/src/stm32f4xx_i2c.c -c -o $@

stm32f4xx_usart.o: $(DRIVER)/src/stm32f4xx_usart.c stm32f4xx_conf.h
	$(CC) $(CFLAGS) $(DRIVER)/src/stm32f4xx_usart.c -c -o $@

startup.o: $(STARTUP)
	$(CC) $(CFLAGS) $^ -c -o $@

dodekaedri.o: dodekaedri.c uart.h i2c.h stm32f4xx_conf.h
	$(CC) $(CFLAGS) dodekaedri.c -c -o $@

i2c.o: i2c.c i2c.h stm32f4xx_conf.h
	$(CC) $(CFLAGS) i2c.c -c -o $@

uart.o: uart.c uart.h stm32f4xx_conf.h
	$(CC) $(CFLAGS) uart.c -c -o $@

clean:
	rm dodekaedri.bin dodekaedri.elf $(OBJECTS)

.PHONY: clean

