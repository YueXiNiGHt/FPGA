
build/servo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00001000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
    1000:	00001197          	auipc	gp,0x1
    1004:	9b018193          	addi	gp,gp,-1616 # 19b0 <__global_pointer$>

00001008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
    1008:	00001117          	auipc	sp,0x1
    100c:	1c810113          	addi	sp,sp,456 # 21d0 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
    1010:	81018513          	addi	a0,gp,-2032 # 11c0 <_data>
	la a1, _data
    1014:	81018593          	addi	a1,gp,-2032 # 11c0 <_data>
	la a2, _edata
    1018:	81c18613          	addi	a2,gp,-2020 # 11cc <__bss_start>
	bgeu a1, a2, 2f
    101c:	00c5fc63          	bgeu	a1,a2,1034 <init+0x2c>
1:
	lw t0, (a0)
    1020:	00052283          	lw	t0,0(a0)
	sw t0, (a1)
    1024:	0055a023          	sw	t0,0(a1)
	addi a0, a0, 4
    1028:	00450513          	addi	a0,a0,4
	addi a1, a1, 4
    102c:	00458593          	addi	a1,a1,4
	bltu a1, a2, 1b
    1030:	fec5e8e3          	bltu	a1,a2,1020 <init+0x18>
2:

	/* Clear bss section */
	la a0, __bss_start
    1034:	81c18513          	addi	a0,gp,-2020 # 11cc <__bss_start>
	la a1, _end
    1038:	82018593          	addi	a1,gp,-2016 # 11d0 <_end>
	bgeu a0, a1, 2f
    103c:	00b57863          	bgeu	a0,a1,104c <init+0x44>
1:
	sw zero, (a0)
    1040:	00052023          	sw	zero,0(a0)
	addi a0, a0, 4
    1044:	00450513          	addi	a0,a0,4
	bltu a0, a1, 1b
    1048:	feb56ce3          	bltu	a0,a1,1040 <init+0x38>
2:

#ifndef NO_LIBC_INIT_ARRAY
	call __libc_init_array
    104c:	010000ef          	jal	ra,105c <__libc_init_array>
#endif

	call main
    1050:	11c000ef          	jal	ra,116c <main>

00001054 <mainDone>:
mainDone:
    j mainDone
    1054:	0000006f          	j	1054 <mainDone>

00001058 <_init>:


	.globl _init
_init:
    ret
    1058:	00008067          	ret

Disassembly of section .text:

0000105c <__libc_init_array>:
    105c:	ff010113          	addi	sp,sp,-16
    1060:	00812423          	sw	s0,8(sp)
    1064:	01212023          	sw	s2,0(sp)
    1068:	81018413          	addi	s0,gp,-2032 # 11c0 <_data>
    106c:	81018913          	addi	s2,gp,-2032 # 11c0 <_data>
    1070:	40890933          	sub	s2,s2,s0
    1074:	00112623          	sw	ra,12(sp)
    1078:	00912223          	sw	s1,4(sp)
    107c:	40295913          	srai	s2,s2,0x2
    1080:	00090e63          	beqz	s2,109c <__libc_init_array+0x40>
    1084:	00000493          	li	s1,0
    1088:	00042783          	lw	a5,0(s0)
    108c:	00148493          	addi	s1,s1,1
    1090:	00440413          	addi	s0,s0,4
    1094:	000780e7          	jalr	a5
    1098:	fe9918e3          	bne	s2,s1,1088 <__libc_init_array+0x2c>
    109c:	81018413          	addi	s0,gp,-2032 # 11c0 <_data>
    10a0:	81018913          	addi	s2,gp,-2032 # 11c0 <_data>
    10a4:	40890933          	sub	s2,s2,s0
    10a8:	40295913          	srai	s2,s2,0x2
    10ac:	00090e63          	beqz	s2,10c8 <__libc_init_array+0x6c>
    10b0:	00000493          	li	s1,0
    10b4:	00042783          	lw	a5,0(s0)
    10b8:	00148493          	addi	s1,s1,1
    10bc:	00440413          	addi	s0,s0,4
    10c0:	000780e7          	jalr	a5
    10c4:	fe9918e3          	bne	s2,s1,10b4 <__libc_init_array+0x58>
    10c8:	00c12083          	lw	ra,12(sp)
    10cc:	00812403          	lw	s0,8(sp)
    10d0:	00412483          	lw	s1,4(sp)
    10d4:	00012903          	lw	s2,0(sp)
    10d8:	01010113          	addi	sp,sp,16
    10dc:	00008067          	ret

000010e0 <set_pwm_duty_cycle>:
#define PWM_PERIOD   (SYS_CLOCK / PWM_FREQUENCY)  // 100Hz 时钟周期

// 设置 PWM 占空比控制舵机
void set_pwm_duty_cycle(uint32_t duty_cycle) {
    // 设置PWM周期
    *((volatile uint32_t *)PWM_PERIOD_REG) = PWM_PERIOD;
    10e0:	40000737          	lui	a4,0x40000
    10e4:	000f47b7          	lui	a5,0xf4
    10e8:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xf2070>
    10ec:	00f72023          	sw	a5,0(a4) # 40000000 <__freertos_irq_stack_top+0x3fffde30>

    // 设置PWM占空比 (duty_cycle: 0-100)
    uint32_t duty_ticks = (PWM_PERIOD * duty_cycle) / 100;
    10f0:	02f50533          	mul	a0,a0,a5
    10f4:	06400793          	li	a5,100
    10f8:	02f55533          	divu	a0,a0,a5
    *((volatile uint32_t *)PWM_DUTY_REG) = duty_ticks;
    10fc:	00a72223          	sw	a0,4(a4)
}
    1100:	00008067          	ret

00001104 <set_servo_angle>:

// 设置舵机的角度
void set_servo_angle(uint32_t angle) {
    1104:	ff010113          	addi	sp,sp,-16
    1108:	00112623          	sw	ra,12(sp)
    // 舵机角度 0° 对应 1ms 占空比，180° 对应 2ms 占空比
    // 假设PWM周期为 20ms (50Hz)，占空比范围 5% 到 10%。
    if (angle < 0) angle = 0;
    if (angle > 180) angle = 180;
    110c:	0b400793          	li	a5,180
    1110:	00a7f463          	bgeu	a5,a0,1118 <set_servo_angle+0x14>
    1114:	0b400513          	li	a0,180

    // 将角度映射到占空比，0° -> 5% ，180° -> 10%
    uint32_t duty_cycle = (angle * 5 / 180) + 5;
    1118:	00251793          	slli	a5,a0,0x2
    111c:	00a78533          	add	a0,a5,a0
    1120:	0b400793          	li	a5,180
    1124:	02f55533          	divu	a0,a0,a5

    set_pwm_duty_cycle(duty_cycle);
    1128:	00550513          	addi	a0,a0,5
    112c:	fb5ff0ef          	jal	ra,10e0 <set_pwm_duty_cycle>
}
    1130:	00c12083          	lw	ra,12(sp)
    1134:	01010113          	addi	sp,sp,16
    1138:	00008067          	ret

0000113c <delay_ms>:
    // 计算每毫秒需要多少个循环
    uint32_t i;
    uint32_t cycles = F_CPU / 1000;  // 每毫秒消耗的时钟周期数

    // 外部循环，控制延迟的毫秒数
    for (uint32_t m = 0; m < ms; m++) {
    113c:	00000693          	li	a3,0
    1140:	0080006f          	j	1148 <delay_ms+0xc>
    1144:	00168693          	addi	a3,a3,1
    1148:	02a6f063          	bgeu	a3,a0,1168 <delay_ms+0x2c>
        // 内部循环，消耗每毫秒所需的时钟周期
        for (i = 0; i < cycles; i++) {
    114c:	00000713          	li	a4,0
    1150:	000187b7          	lui	a5,0x18
    1154:	69f78793          	addi	a5,a5,1695 # 1869f <__freertos_irq_stack_top+0x164cf>
    1158:	fee7e6e3          	bltu	a5,a4,1144 <delay_ms+0x8>
            // 空操作，消耗时钟周期
            __asm__ volatile("nop");  // 执行空操作，消耗一个时钟周期
    115c:	00000013          	nop
        for (i = 0; i < cycles; i++) {
    1160:	00170713          	addi	a4,a4,1
    1164:	fedff06f          	j	1150 <delay_ms+0x14>
        }
    }
}
    1168:	00008067          	ret

0000116c <main>:

int main() {
    116c:	ff010113          	addi	sp,sp,-16
    1170:	00112623          	sw	ra,12(sp)
    1174:	00812423          	sw	s0,8(sp)
    // 初始化PWM硬件配置（此处假设硬件初始化已完成）

    // 设置舵机到 0° 位置
    set_servo_angle(0);
    1178:	00000513          	li	a0,0
    117c:	f89ff0ef          	jal	ra,1104 <set_servo_angle>
    delay_ms(1000000);  // 延时1秒
    1180:	000f4437          	lui	s0,0xf4
    1184:	24040513          	addi	a0,s0,576 # f4240 <__freertos_irq_stack_top+0xf2070>
    1188:	fb5ff0ef          	jal	ra,113c <delay_ms>

    // 设置舵机到 90° 位置
    set_servo_angle(90);
    118c:	05a00513          	li	a0,90
    1190:	f75ff0ef          	jal	ra,1104 <set_servo_angle>
    delay_ms(1000000);  // 延时1秒
    1194:	24040513          	addi	a0,s0,576
    1198:	fa5ff0ef          	jal	ra,113c <delay_ms>

    // 设置舵机到 180° 位置
    set_servo_angle(180);
    119c:	0b400513          	li	a0,180
    11a0:	f65ff0ef          	jal	ra,1104 <set_servo_angle>
    delay_ms(1000000);  // 延时1秒
    11a4:	24040513          	addi	a0,s0,576
    11a8:	f95ff0ef          	jal	ra,113c <delay_ms>

    return 0;
}
    11ac:	00000513          	li	a0,0
    11b0:	00c12083          	lw	ra,12(sp)
    11b4:	00812403          	lw	s0,8(sp)
    11b8:	01010113          	addi	sp,sp,16
    11bc:	00008067          	ret
