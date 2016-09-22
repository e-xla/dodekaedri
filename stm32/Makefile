CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

# Download standard peripheral library from http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32-standard-peripheral-libraries/stsw-stm32065.html
# and write its path here
STDPERIPH=$(HOME)/Downloads/STM32F4xx_DSP_StdPeriph_Lib_V1.7.1

DRIVER=$(STDPERIPH)/Libraries/STM32F4xx_StdPeriph_Driver

CFLAGS=-g -O2 -Wall -Wextra -mlittle-endian -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32F40XX -DUSE_STDPERIPH_DRIVER
CFLAGS+= -I$(STDPERIPH)/Libraries/CMSIS/Include
CFLAGS+= -I$(STDPERIPH)/Libraries/CMSIS/Device/ST/STM32F4xx/Include
CFLAGS+= -I$(STDPERIPH)/Libraries/STM32F4xx_StdPeriph_Driver/inc/
CFLAGS+= -I.

LDFLAGS= -T$(STDPERIPH)/Project/STM32F4xx_StdPeriph_Templates/SW4STM32/STM32F401xx/STM32F401VCTx_FLASH.ld -mlittle-endian -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 

STARTUP=$(STDPERIPH)/Libraries/CMSIS/Device/ST/STM32F4xx/Source/Templates/SW4STM32/startup_stm32f401xx.s

TARGETS=dodekaedri.o stm32f4xx_gpio.o stm32f4xx_rcc.o stm32f4xx_spi.o startup.o

dodekaedri.bin: dodekaedri.elf
	$(OBJCOPY) -O binary $^ $@

dodekaedri.elf: $(TARGETS)
	$(CC) $(LDFLAGS) $^ -o $@

stm32f4xx_gpio.o: $(DRIVER)/src/stm32f4xx_gpio.c
	$(CC) $(CFLAGS) $^ -c -o $@

stm32f4xx_rcc.o: $(DRIVER)/src/stm32f4xx_rcc.c
	$(CC) $(CFLAGS) $^ -c -o $@

stm32f4xx_spi.o: $(DRIVER)/src/stm32f4xx_spi.c
	$(CC) $(CFLAGS) $^ -c -o $@

startup.o: $(STARTUP)
	$(CC) $(CFLAGS) $^ -c -o $@

dodekaedri.o: dodekaedri.c $(DRIVER)/inc/stm32f4xx_gpio.h $(DRIVER)/inc/stm32f4xx_rcc.h
	$(CC) $(CFLAGS) dodekaedri.c -c -o $@

clean:
	rm dodekaedri.bin dodekaedri.elf $(TARGETS)

.PHONY: clean

