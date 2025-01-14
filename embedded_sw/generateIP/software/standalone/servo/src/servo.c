#include <stdio.h>
#include <stdint.h>
#include <unistd.h>

// 假设 PWM 配置寄存器
#define PWM_REG_BASE   0x1000  // 假设PWM控制寄存器的基地址
#define PWM_PERIOD_REG (PWM_REG_BASE + 0x00)  // PWM周期寄存器
#define PWM_DUTY_REG   (PWM_REG_BASE + 0x04)  // PWM占空比寄存器

#define SYS_CLOCK 100000000
#define PWM_FREQUENCY 100  // 50Hz PWM信号，周期 20ms
#define F_CPU 100000000UL  // 时钟频率为100MHz

// 计算周期和占空比
#define PWM_PERIOD   (SYS_CLOCK / PWM_FREQUENCY)  // 100Hz 时钟周期

// 设置 PWM 占空比控制舵机
void set_pwm_duty_cycle(uint32_t duty_cycle) {
    // 设置PWM周期
    *((volatile uint32_t *)PWM_PERIOD_REG) = PWM_PERIOD;

    // 设置PWM占空比 (duty_cycle: 0-100)
    uint32_t duty_ticks = (PWM_PERIOD * duty_cycle) / 100;
    *((volatile uint32_t *)PWM_DUTY_REG) = duty_ticks;
}

// 设置舵机的角度
void set_servo_angle(uint32_t angle) {
    // 舵机角度 0° 对应 1ms 占空比，180° 对应 2ms 占空比
    // 假设PWM周期为 20ms (50Hz)，占空比范围 5% 到 10%。
    if (angle < 0) angle = 0;
    if (angle > 180) angle = 180;

    // 将角度映射到占空比，0° -> 5% ，180° -> 10%
    uint32_t duty_cycle = (angle * 5 / 180) + 5;

    set_pwm_duty_cycle(duty_cycle);
}

// 延时函数，延时单位为毫秒
void delay_ms(uint32_t ms) {
    // 计算每毫秒需要多少个循环
    uint32_t i;
    uint32_t cycles = F_CPU / 1000;  // 每毫秒消耗的时钟周期数

    // 外部循环，控制延迟的毫秒数
    for (uint32_t m = 0; m < ms; m++) {
        // 内部循环，消耗每毫秒所需的时钟周期
        for (i = 0; i < cycles; i++) {
            // 空操作，消耗时钟周期
            __asm__ volatile("nop");  // 执行空操作，消耗一个时钟周期
        }
    }
}

int main() {
    // 初始化PWM硬件配置（此处假设硬件初始化已完成）

    // 设置舵机到 0° 位置
    set_servo_angle(0);
    delay_ms(1000);  // 延时1秒

    // 设置舵机到 90° 位置
    set_servo_angle(90);
    delay_ms(1000);  // 延时1秒

    // 设置舵机到 180° 位置
    set_servo_angle(180);
    delay_ms(1000);  // 延时1秒

    return 0;
}
