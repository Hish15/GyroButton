cmake_minimum_required(VERSION 3.0)
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

project(GyroButton)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_definitions(
    -Wfatal-errors
    )

include_directories(
	Inc
	Drivers/STM32F4xx_HAL_Driver/Inc 
	Drivers/STM32F4xx_HAL_Driver/Inc/Legacy 
	Drivers/CMSIS/Device/ST/STM32F4xx/Include 
	Drivers/CMSIS/Include 
	Drivers/CMSIS/Include)
set(SRC 
		Src/main.c 
		Src/stm32f4xx_it.c 
		Src/stm32f4xx_hal_msp.c 
		Src/stm32f4xx_hal_timebase_tim.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c 
		Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c 
		Src/system_stm32f4xx.c )
		
		
add_library(GyroButton ${SRC})