cmake_minimum_required(VERSION 3.0)
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")


set(MCU_FAMILY STM32F4xx)
set(MCU_LINE STM32F429xx)

cmake_minimum_required(VERSION 3.6)

add_definitions(-D${MCU_LINE})


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
	Drivers/CMSIS/Include)
add_definitions(-D${MCU_LINE})
add_definitions(-DUSE_HAL_LIBRARY)

file(GLOB_RECURSE USER_SOURCES
Src/main.c 
Src/gpio.c 
Src/i2c.c 
Src/usart.c 
Src/stm32f4xx_it.c 
Src/stm32f4xx_hal_msp.c 
Src/stm32f4xx_hal_timebase_tim.c 
Src/system_stm32f4xx.c
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
startup_stm32f429xx.s
)
set_source_files_properties(startup_stm32f429xx.s PROPERTIES COMPILE_FLAGS "-x assembler-with-cpp")


set(SOURCE_FILES ${USER_SOURCES} ${MCU_LINKER_SCRIPT})

add_executable(${PROJECT_NAME}.elf ${SOURCE_FILES})

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-Map=${PROJECT_SOURCE_DIR}/build/${PROJECT_NAME}.map")
set(HEX_FILE ${PROJECT_SOURCE_DIR}/build/${PROJECT_NAME}.hex)
set(BIN_FILE ${PROJECT_SOURCE_DIR}/build/${PROJECT_NAME}.bin)
add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:${PROJECT_NAME}.elf> ${HEX_FILE}
        COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:${PROJECT_NAME}.elf> ${BIN_FILE}
COMMENT "Building ${HEX_FILE} \nBuilding ${BIN_FILE}")