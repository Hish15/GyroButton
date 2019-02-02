

set(MCU_LINKER_SCRIPT "STM32F429ZITx_FLASH.ld")
set(MCU_ARCH cortex-m4)
set(MCU_FLOAT_ABI hard)
set(MCU_FPU fpv4-sp-d16)

set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_COMPILER 	"/opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc")
set(CMAKE_ASM_COMPILER 	"/opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER 	"/opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-g++")


set(STM32F4_FLAGS "-mcpu=cortex-m4 -mthumb -mno-thumb-interwork -mfpu=vfp -msoft-float -mfix-cortex-m4-ldrd")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall ${STM32F4_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall --std=c++11 ${STM32F4_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --specs=rdimon.specs")
