#pragma once

#ifdef SYSTEM_I2C_0_IO_CTRL
    #define I2C_CTRL SYSTEM_I2C_0_IO_CTRL
    #define I2C_CTRL_PLIC_INTERRUPT SYSTEM_PLIC_SYSTEM_I2C_0_IO_INTERRUPT
#endif
#define I2C_CTRL_HZ SYSTEM_CLINT_HZ