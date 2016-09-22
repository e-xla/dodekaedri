CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

# Download standard peripheral library from http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32-standard-peripheral-libraries/stsw-stm32065.html
# and write its path here
STDPERIPH=/home/prk-3/Downloads/STM32F4xx_DSP_StdPeriph_Lib_V1.7.1

DRIVER=$(STDPERIPH)/Libraries/STM32F4xx_StdPeriph_Driver/src

CFLAGS=-g -O2 -Wall -Wextra -mlittle-endian -mthumb -mcpu=cortex-m4 -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32F40XX -DUSE_STDPERIPH_DRIVER

CFLAGS+= -T$(STDPERIPH)/Project/STM32F4xx_StdPeriph_Templates/SW4STM32/STM32F401xx/STM32F401VCTx_FLASH.ld
CFLAGS+= -I$(STDPERIPH)/Libraries/CMSIS/Include
CFLAGS+= -I$(STDPERIPH)/Libraries/CMSIS/Device/ST/STM32F4xx/Include
CFLAGS+= -I$(STDPERIPH)/Libraries/STM32F4xx_StdPeriph_Driver/inc/
CFLAGS+= -I.
STARTUP=$(STDPERIPH)/Libraries/CMSIS/Device/ST/STM32F4xx/Source/Templates/SW4STM32/startup_stm32f401xx.s

dodekaedri.bin: dodekaedri.elf
	$(OBJCOPY) -O binary $^ $@

dodekaedri.elf: $(STARTUP) dodekaedri.c $(DRIVER)/stm32f4xx_gpio.c $(DRIVER)/stm32f4xx_rcc.c
	$(CC) $(CFLAGS) $^ -o $@
