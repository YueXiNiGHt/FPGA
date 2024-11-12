
build/gpioDemo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00001000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
    1000:	00001197          	auipc	gp,0x1
    1004:	16018193          	addi	gp,gp,352 # 2160 <__global_pointer$>

00001008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
    1008:	00002117          	auipc	sp,0x2
    100c:	97810113          	addi	sp,sp,-1672 # 2980 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
    1010:	00000517          	auipc	a0,0x0
    1014:	7dc50513          	addi	a0,a0,2012 # 17ec <_data>
	la a1, _data
    1018:	00000597          	auipc	a1,0x0
    101c:	7d458593          	addi	a1,a1,2004 # 17ec <_data>
	la a2, _edata
    1020:	81c18613          	addi	a2,gp,-2020 # 197c <__bss_start>
	bgeu a1, a2, 2f
    1024:	00c5fc63          	bgeu	a1,a2,103c <init+0x34>
1:
	lw t0, (a0)
    1028:	00052283          	lw	t0,0(a0)
	sw t0, (a1)
    102c:	0055a023          	sw	t0,0(a1)
	addi a0, a0, 4
    1030:	00450513          	addi	a0,a0,4
	addi a1, a1, 4
    1034:	00458593          	addi	a1,a1,4
	bltu a1, a2, 1b
    1038:	fec5e8e3          	bltu	a1,a2,1028 <init+0x20>
2:

	/* Clear bss section */
	la a0, __bss_start
    103c:	81c18513          	addi	a0,gp,-2020 # 197c <__bss_start>
	la a1, _end
    1040:	82018593          	addi	a1,gp,-2016 # 1980 <_end>
	bgeu a0, a1, 2f
    1044:	00b57863          	bgeu	a0,a1,1054 <init+0x4c>
1:
	sw zero, (a0)
    1048:	00052023          	sw	zero,0(a0)
	addi a0, a0, 4
    104c:	00450513          	addi	a0,a0,4
	bltu a0, a1, 1b
    1050:	feb56ce3          	bltu	a0,a1,1048 <init+0x40>
2:

#ifndef NO_LIBC_INIT_ARRAY
	call __libc_init_array
    1054:	010000ef          	jal	ra,1064 <__libc_init_array>
#endif

	call main
    1058:	65c000ef          	jal	ra,16b4 <main>

0000105c <mainDone>:
mainDone:
    j mainDone
    105c:	0000006f          	j	105c <mainDone>

00001060 <_init>:


	.globl _init
_init:
    ret
    1060:	00008067          	ret

Disassembly of section .text:

00001064 <__libc_init_array>:
    1064:	ff010113          	addi	sp,sp,-16
    1068:	00812423          	sw	s0,8(sp)
    106c:	01212023          	sw	s2,0(sp)
    1070:	00000417          	auipc	s0,0x0
    1074:	77c40413          	addi	s0,s0,1916 # 17ec <_data>
    1078:	00000917          	auipc	s2,0x0
    107c:	77490913          	addi	s2,s2,1908 # 17ec <_data>
    1080:	40890933          	sub	s2,s2,s0
    1084:	00112623          	sw	ra,12(sp)
    1088:	00912223          	sw	s1,4(sp)
    108c:	40295913          	srai	s2,s2,0x2
    1090:	00090e63          	beqz	s2,10ac <__libc_init_array+0x48>
    1094:	00000493          	li	s1,0
    1098:	00042783          	lw	a5,0(s0)
    109c:	00148493          	addi	s1,s1,1
    10a0:	00440413          	addi	s0,s0,4
    10a4:	000780e7          	jalr	a5
    10a8:	fe9918e3          	bne	s2,s1,1098 <__libc_init_array+0x34>
    10ac:	00000417          	auipc	s0,0x0
    10b0:	74040413          	addi	s0,s0,1856 # 17ec <_data>
    10b4:	00000917          	auipc	s2,0x0
    10b8:	73890913          	addi	s2,s2,1848 # 17ec <_data>
    10bc:	40890933          	sub	s2,s2,s0
    10c0:	40295913          	srai	s2,s2,0x2
    10c4:	00090e63          	beqz	s2,10e0 <__libc_init_array+0x7c>
    10c8:	00000493          	li	s1,0
    10cc:	00042783          	lw	a5,0(s0)
    10d0:	00148493          	addi	s1,s1,1
    10d4:	00440413          	addi	s0,s0,4
    10d8:	000780e7          	jalr	a5
    10dc:	fe9918e3          	bne	s2,s1,10cc <__libc_init_array+0x68>
    10e0:	00c12083          	lw	ra,12(sp)
    10e4:	00812403          	lw	s0,8(sp)
    10e8:	00412483          	lw	s1,4(sp)
    10ec:	00012903          	lw	s2,0(sp)
    10f0:	01010113          	addi	sp,sp,16
    10f4:	00008067          	ret

000010f8 <uart_writeAvailability>:
#include "type.h"
#include "soc.h"


    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
    10f8:	00452503          	lw	a0,4(a0)
        enum UartStop stop;
        u32 clockDivider;
    } Uart_Config;
    
    static u32 uart_writeAvailability(u32 reg){
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    10fc:	01055513          	srli	a0,a0,0x10
    }
    1100:	0ff57513          	andi	a0,a0,255
    1104:	00008067          	ret

00001108 <uart_write>:
    static u32 uart_readOccupancy(u32 reg){
        return read_u32(reg + UART_STATUS) >> 24;
    }
    
    static void uart_write(u32 reg, char data){
    1108:	ff010113          	addi	sp,sp,-16
    110c:	00112623          	sw	ra,12(sp)
    1110:	00812423          	sw	s0,8(sp)
    1114:	00912223          	sw	s1,4(sp)
    1118:	00050413          	mv	s0,a0
    111c:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    1120:	00040513          	mv	a0,s0
    1124:	fd5ff0ef          	jal	ra,10f8 <uart_writeAvailability>
    1128:	fe050ce3          	beqz	a0,1120 <uart_write+0x18>
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
    112c:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
    1130:	00c12083          	lw	ra,12(sp)
    1134:	00812403          	lw	s0,8(sp)
    1138:	00412483          	lw	s1,4(sp)
    113c:	01010113          	addi	sp,sp,16
    1140:	00008067          	ret

00001144 <clint_uDelay>:
    
        return (((u64)hi) << 32) | lo;
    }
    
    static void clint_uDelay(u32 usec, u32 hz, u32 reg){
        u32 mTimePerUsec = hz/1000000;
    1144:	000f47b7          	lui	a5,0xf4
    1148:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xf18c0>
    114c:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1150:	0000c7b7          	lui	a5,0xc
    1154:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x9678>
    1158:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    115c:	00062783          	lw	a5,0(a2)
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
    1160:	02a58533          	mul	a0,a1,a0
    1164:	00f50533          	add	a0,a0,a5
    1168:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
    116c:	40f507b3          	sub	a5,a0,a5
    1170:	fe07dce3          	bgez	a5,1168 <clint_uDelay+0x24>
    }
    1174:	00008067          	ret

00001178 <_putchar>:
// use bsp_printf_full as bsp_printf
#define ENABLE_BRIDGE_FULL_TO_LITE          1 // If this is enabled, bsp_printf_full can be called with bsp_printf. Enabling both ENABLE_BSP_PRINTF and ENABLE_BSP_PRINTF_FULL, bsp_printf_full will be remained as bsp_printf_full. Default: Enable
#define ENABLE_PRINTF_WARNING               1 // Print warning when the specifier not supported. Default: Enable


    static void _putchar(char character){
    1178:	ff010113          	addi	sp,sp,-16
    117c:	00112623          	sw	ra,12(sp)
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
    1180:	00050593          	mv	a1,a0
    1184:	f8010537          	lui	a0,0xf8010
    1188:	f81ff0ef          	jal	ra,1108 <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
    118c:	00c12083          	lw	ra,12(sp)
    1190:	01010113          	addi	sp,sp,16
    1194:	00008067          	ret

00001198 <_putchar_s>:

    static void _putchar_s(char *p)
    {
    1198:	ff010113          	addi	sp,sp,-16
    119c:	00112623          	sw	ra,12(sp)
    11a0:	00812423          	sw	s0,8(sp)
    11a4:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
    11a8:	00044503          	lbu	a0,0(s0)
    11ac:	00050863          	beqz	a0,11bc <_putchar_s+0x24>
            _putchar(*(p++));
    11b0:	00140413          	addi	s0,s0,1
    11b4:	fc5ff0ef          	jal	ra,1178 <_putchar>
    11b8:	ff1ff06f          	j	11a8 <_putchar_s+0x10>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
    11bc:	00c12083          	lw	ra,12(sp)
    11c0:	00812403          	lw	s0,8(sp)
    11c4:	01010113          	addi	sp,sp,16
    11c8:	00008067          	ret

000011cc <bsp_printHex>:


    //bsp_printHex is used in BSP_PRINTF
    static void bsp_printHex(uint32_t val)
    {
    11cc:	ff010113          	addi	sp,sp,-16
    11d0:	00112623          	sw	ra,12(sp)
    11d4:	00812423          	sw	s0,8(sp)
    11d8:	00912223          	sw	s1,4(sp)
    11dc:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    11e0:	01c00413          	li	s0,28
    11e4:	0240006f          	j	1208 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    11e8:	0084d7b3          	srl	a5,s1,s0
    11ec:	00f7f713          	andi	a4,a5,15
    11f0:	000017b7          	lui	a5,0x1
    11f4:	7ec78793          	addi	a5,a5,2028 # 17ec <_data>
    11f8:	00e787b3          	add	a5,a5,a4
    11fc:	0007c503          	lbu	a0,0(a5)
    1200:	f79ff0ef          	jal	ra,1178 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1204:	ffc40413          	addi	s0,s0,-4
    1208:	fe0450e3          	bgez	s0,11e8 <bsp_printHex+0x1c>
        }
    }
    120c:	00c12083          	lw	ra,12(sp)
    1210:	00812403          	lw	s0,8(sp)
    1214:	00412483          	lw	s1,4(sp)
    1218:	01010113          	addi	sp,sp,16
    121c:	00008067          	ret

00001220 <bsp_printHex_lower>:

    static void bsp_printHex_lower(uint32_t val)
        {
    1220:	ff010113          	addi	sp,sp,-16
    1224:	00112623          	sw	ra,12(sp)
    1228:	00812423          	sw	s0,8(sp)
    122c:	00912223          	sw	s1,4(sp)
    1230:	00050493          	mv	s1,a0
            uint32_t digits;
            digits =8;

            for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1234:	01c00413          	li	s0,28
    1238:	0240006f          	j	125c <bsp_printHex_lower+0x3c>
                _putchar("0123456789abcdef"[(val >> i) % 16]);
    123c:	0084d7b3          	srl	a5,s1,s0
    1240:	00f7f713          	andi	a4,a5,15
    1244:	000027b7          	lui	a5,0x2
    1248:	80078793          	addi	a5,a5,-2048 # 1800 <_data+0x14>
    124c:	00e787b3          	add	a5,a5,a4
    1250:	0007c503          	lbu	a0,0(a5)
    1254:	f25ff0ef          	jal	ra,1178 <_putchar>
            for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1258:	ffc40413          	addi	s0,s0,-4
    125c:	fe0450e3          	bgez	s0,123c <bsp_printHex_lower+0x1c>

            }
        }
    1260:	00c12083          	lw	ra,12(sp)
    1264:	00812403          	lw	s0,8(sp)
    1268:	00412483          	lw	s1,4(sp)
    126c:	01010113          	addi	sp,sp,16
    1270:	00008067          	ret

00001274 <bsp_printf_c>:
    #endif //#if (ENABLE_FLOATING_POINT_SUPPORT)

    

    static void bsp_printf_c(int c)
    {
    1274:	ff010113          	addi	sp,sp,-16
    1278:	00112623          	sw	ra,12(sp)
        _putchar(c);
    127c:	0ff57513          	andi	a0,a0,255
    1280:	ef9ff0ef          	jal	ra,1178 <_putchar>
    }
    1284:	00c12083          	lw	ra,12(sp)
    1288:	01010113          	addi	sp,sp,16
    128c:	00008067          	ret

00001290 <bsp_printf_s>:

    static void bsp_printf_s(char *p)
    {
    1290:	ff010113          	addi	sp,sp,-16
    1294:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    1298:	f01ff0ef          	jal	ra,1198 <_putchar_s>
    }
    129c:	00c12083          	lw	ra,12(sp)
    12a0:	01010113          	addi	sp,sp,16
    12a4:	00008067          	ret

000012a8 <bsp_printf_d>:



    static void bsp_printf_d(int val)
    {
    12a8:	fd010113          	addi	sp,sp,-48
    12ac:	02112623          	sw	ra,44(sp)
    12b0:	02812423          	sw	s0,40(sp)
    12b4:	02912223          	sw	s1,36(sp)
    12b8:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
    12bc:	00054663          	bltz	a0,12c8 <bsp_printf_d+0x20>
    {
    12c0:	00010413          	mv	s0,sp
    12c4:	02c0006f          	j	12f0 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    12c8:	02d00513          	li	a0,45
    12cc:	fa9ff0ef          	jal	ra,1274 <bsp_printf_c>
            val = -val;
    12d0:	409004b3          	neg	s1,s1
    12d4:	fedff06f          	j	12c0 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
    12d8:	00a00713          	li	a4,10
    12dc:	02e4e7b3          	rem	a5,s1,a4
    12e0:	03078793          	addi	a5,a5,48
    12e4:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    12e8:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    12ec:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    12f0:	fe0494e3          	bnez	s1,12d8 <bsp_printf_d+0x30>
    12f4:	00010793          	mv	a5,sp
    12f8:	fef400e3          	beq	s0,a5,12d8 <bsp_printf_d+0x30>
    12fc:	0100006f          	j	130c <bsp_printf_d+0x64>
        }
        while (p != buffer)
            bsp_printf_c(*(--p));
    1300:	fff40413          	addi	s0,s0,-1
    1304:	00044503          	lbu	a0,0(s0)
    1308:	f6dff0ef          	jal	ra,1274 <bsp_printf_c>
        while (p != buffer)
    130c:	00010793          	mv	a5,sp
    1310:	fef418e3          	bne	s0,a5,1300 <bsp_printf_d+0x58>
    }
    1314:	02c12083          	lw	ra,44(sp)
    1318:	02812403          	lw	s0,40(sp)
    131c:	02412483          	lw	s1,36(sp)
    1320:	03010113          	addi	sp,sp,48
    1324:	00008067          	ret

00001328 <bsp_printf_x>:

    static void bsp_printf_x(int val)
    {
    1328:	ff010113          	addi	sp,sp,-16
    132c:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
    1330:	00000713          	li	a4,0
    1334:	00700793          	li	a5,7
    1338:	02e7c063          	blt	a5,a4,1358 <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    133c:	00271693          	slli	a3,a4,0x2
    1340:	ff000793          	li	a5,-16
    1344:	00d797b3          	sll	a5,a5,a3
    1348:	00f577b3          	and	a5,a0,a5
    134c:	00078663          	beqz	a5,1358 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    1350:	00170713          	addi	a4,a4,1
    1354:	fe1ff06f          	j	1334 <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
    1358:	ec9ff0ef          	jal	ra,1220 <bsp_printHex_lower>
    }
    135c:	00c12083          	lw	ra,12(sp)
    1360:	01010113          	addi	sp,sp,16
    1364:	00008067          	ret

00001368 <bsp_printf_X>:

    static void bsp_printf_X(int val)
        {
    1368:	ff010113          	addi	sp,sp,-16
    136c:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
    1370:	00000713          	li	a4,0
    1374:	00700793          	li	a5,7
    1378:	02e7c063          	blt	a5,a4,1398 <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    137c:	00271693          	slli	a3,a4,0x2
    1380:	ff000793          	li	a5,-16
    1384:	00d797b3          	sll	a5,a5,a3
    1388:	00f577b3          	and	a5,a0,a5
    138c:	00078663          	beqz	a5,1398 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    1390:	00170713          	addi	a4,a4,1
    1394:	fe1ff06f          	j	1374 <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
    1398:	e35ff0ef          	jal	ra,11cc <bsp_printHex>
        }
    139c:	00c12083          	lw	ra,12(sp)
    13a0:	01010113          	addi	sp,sp,16
    13a4:	00008067          	ret

000013a8 <plic_set_priority>:
#define PLIC_CLAIM_BASE         0x200004
#define PLIC_ENABLE_PER_HART    0x80
#define PLIC_CONTEXT_PER_HART   0x1000

    static void plic_set_priority(u32 plic, u32 gateway, u32 priority){
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
    13a8:	00259593          	slli	a1,a1,0x2
    13ac:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
    13b0:	00c5a023          	sw	a2,0(a1)
    }
    13b4:	00008067          	ret

000013b8 <plic_set_enable>:
    static u32 plic_get_priority(u32 plic, u32 gateway){
        return read_u32(plic + PLIC_PRIORITY_BASE + gateway*4);
    }
    
    static void plic_set_enable(u32 plic, u32 target,u32 gateway, u32 enable){
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
    13b8:	00759593          	slli	a1,a1,0x7
    13bc:	00a58533          	add	a0,a1,a0
    13c0:	00565593          	srli	a1,a2,0x5
    13c4:	00259593          	slli	a1,a1,0x2
    13c8:	00b50533          	add	a0,a0,a1
    13cc:	000025b7          	lui	a1,0x2
    13d0:	00b50533          	add	a0,a0,a1
        u32 mask = 1 << (gateway % 32);
    13d4:	00100793          	li	a5,1
    13d8:	00c797b3          	sll	a5,a5,a2
        if (enable)
    13dc:	00068a63          	beqz	a3,13f0 <plic_set_enable+0x38>
        return *((volatile u32*) address);
    13e0:	00052603          	lw	a2,0(a0) # f8010000 <__freertos_irq_stack_top+0xf800d680>
            write_u32(read_u32(word) | mask, word);
    13e4:	00c7e7b3          	or	a5,a5,a2
        *((volatile u32*) address) = data;
    13e8:	00f52023          	sw	a5,0(a0)
    13ec:	00008067          	ret
        return *((volatile u32*) address);
    13f0:	00052603          	lw	a2,0(a0)
        else
            write_u32(read_u32(word) & ~mask, word);
    13f4:	fff7c793          	not	a5,a5
    13f8:	00c7f7b3          	and	a5,a5,a2
        *((volatile u32*) address) = data;
    13fc:	00f52023          	sw	a5,0(a0)
    }
    1400:	00008067          	ret

00001404 <plic_set_threshold>:
    
    static void plic_set_threshold(u32 plic, u32 target, u32 threshold){
        write_u32(threshold, plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
    1404:	00c59593          	slli	a1,a1,0xc
    1408:	00a585b3          	add	a1,a1,a0
    140c:	00200537          	lui	a0,0x200
    1410:	00a585b3          	add	a1,a1,a0
    1414:	00c5a023          	sw	a2,0(a1) # 2000 <_end+0x680>
    }
    1418:	00008067          	ret

0000141c <plic_claim>:
    static u32 plic_get_threshold(u32 plic, u32 target){
        return read_u32(plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
    }
    
    static u32 plic_claim(u32 plic, u32 target){
        return read_u32(plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
    141c:	00c59593          	slli	a1,a1,0xc
    1420:	00a585b3          	add	a1,a1,a0
    1424:	00200537          	lui	a0,0x200
    1428:	00450513          	addi	a0,a0,4 # 200004 <__freertos_irq_stack_top+0x1fd684>
    142c:	00a585b3          	add	a1,a1,a0
        return *((volatile u32*) address);
    1430:	0005a503          	lw	a0,0(a1)
    }
    1434:	00008067          	ret

00001438 <plic_release>:
    
    static void plic_release(u32 plic, u32 target, u32 gateway){
        write_u32(gateway,plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
    1438:	00c59593          	slli	a1,a1,0xc
    143c:	00a585b3          	add	a1,a1,a0
    1440:	00200537          	lui	a0,0x200
    1444:	00450513          	addi	a0,a0,4 # 200004 <__freertos_irq_stack_top+0x1fd684>
    1448:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
    144c:	00c5a023          	sw	a2,0(a1)
    }
    1450:	00008067          	ret

00001454 <bsp_printf>:
#if (ENABLE_SEMIHOSTING_PRINT == 0)
    static void bsp_printf(const char *format, ...)
    {
    1454:	fc010113          	addi	sp,sp,-64
    1458:	00112e23          	sw	ra,28(sp)
    145c:	00812c23          	sw	s0,24(sp)
    1460:	00912a23          	sw	s1,20(sp)
    1464:	00050493          	mv	s1,a0
    1468:	02b12223          	sw	a1,36(sp)
    146c:	02c12423          	sw	a2,40(sp)
    1470:	02d12623          	sw	a3,44(sp)
    1474:	02e12823          	sw	a4,48(sp)
    1478:	02f12a23          	sw	a5,52(sp)
    147c:	03012c23          	sw	a6,56(sp)
    1480:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
    1484:	02410793          	addi	a5,sp,36
    1488:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
    148c:	00000413          	li	s0,0
    1490:	01c0006f          	j	14ac <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
    1494:	00c12783          	lw	a5,12(sp)
    1498:	00478713          	addi	a4,a5,4
    149c:	00e12623          	sw	a4,12(sp)
    14a0:	0007a503          	lw	a0,0(a5)
    14a4:	dd1ff0ef          	jal	ra,1274 <bsp_printf_c>
        for (i = 0; format[i]; i++)
    14a8:	00140413          	addi	s0,s0,1
    14ac:	008487b3          	add	a5,s1,s0
    14b0:	0007c503          	lbu	a0,0(a5)
    14b4:	0c050263          	beqz	a0,1578 <bsp_printf+0x124>
            if (format[i] == '%') {
    14b8:	02500793          	li	a5,37
    14bc:	06f50663          	beq	a0,a5,1528 <bsp_printf+0xd4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
    14c0:	db5ff0ef          	jal	ra,1274 <bsp_printf_c>
    14c4:	fe5ff06f          	j	14a8 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    14c8:	00c12783          	lw	a5,12(sp)
    14cc:	00478713          	addi	a4,a5,4
    14d0:	00e12623          	sw	a4,12(sp)
    14d4:	0007a503          	lw	a0,0(a5)
    14d8:	db9ff0ef          	jal	ra,1290 <bsp_printf_s>
                        break;
    14dc:	fcdff06f          	j	14a8 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    14e0:	00c12783          	lw	a5,12(sp)
    14e4:	00478713          	addi	a4,a5,4
    14e8:	00e12623          	sw	a4,12(sp)
    14ec:	0007a503          	lw	a0,0(a5)
    14f0:	db9ff0ef          	jal	ra,12a8 <bsp_printf_d>
                        break;
    14f4:	fb5ff06f          	j	14a8 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    14f8:	00c12783          	lw	a5,12(sp)
    14fc:	00478713          	addi	a4,a5,4
    1500:	00e12623          	sw	a4,12(sp)
    1504:	0007a503          	lw	a0,0(a5)
    1508:	e61ff0ef          	jal	ra,1368 <bsp_printf_X>
                        break;
    150c:	f9dff06f          	j	14a8 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    1510:	00c12783          	lw	a5,12(sp)
    1514:	00478713          	addi	a4,a5,4
    1518:	00e12623          	sw	a4,12(sp)
    151c:	0007a503          	lw	a0,0(a5)
    1520:	e09ff0ef          	jal	ra,1328 <bsp_printf_x>
                        break;
    1524:	f85ff06f          	j	14a8 <bsp_printf+0x54>
                while (format[++i]) {
    1528:	00140413          	addi	s0,s0,1
    152c:	008487b3          	add	a5,s1,s0
    1530:	0007c783          	lbu	a5,0(a5)
    1534:	f6078ae3          	beqz	a5,14a8 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    1538:	06300713          	li	a4,99
    153c:	f4e78ce3          	beq	a5,a4,1494 <bsp_printf+0x40>
                    else if (format[i] == 's') {
    1540:	07300713          	li	a4,115
    1544:	f8e782e3          	beq	a5,a4,14c8 <bsp_printf+0x74>
                    else if (format[i] == 'd') {
    1548:	06400713          	li	a4,100
    154c:	f8e78ae3          	beq	a5,a4,14e0 <bsp_printf+0x8c>
                    else if (format[i] == 'X') {
    1550:	05800713          	li	a4,88
    1554:	fae782e3          	beq	a5,a4,14f8 <bsp_printf+0xa4>
                    else if (format[i] == 'x') {
    1558:	07800713          	li	a4,120
    155c:	fae78ae3          	beq	a5,a4,1510 <bsp_printf+0xbc>
                    else if (format[i] == 'f') {
    1560:	06600713          	li	a4,102
    1564:	fce792e3          	bne	a5,a4,1528 <bsp_printf+0xd4>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    1568:	00002537          	lui	a0,0x2
    156c:	81450513          	addi	a0,a0,-2028 # 1814 <_data+0x28>
    1570:	d21ff0ef          	jal	ra,1290 <bsp_printf_s>
                        break;
    1574:	f35ff06f          	j	14a8 <bsp_printf+0x54>

        va_end(ap);
    }
    1578:	01c12083          	lw	ra,28(sp)
    157c:	01812403          	lw	s0,24(sp)
    1580:	01412483          	lw	s1,20(sp)
    1584:	04010113          	addi	sp,sp,64
    1588:	00008067          	ret

0000158c <init>:
void trap();
void crash();
void trap_entry();
void externalInterrupt();

void init(){
    158c:	ff010113          	addi	sp,sp,-16
    1590:	00112623          	sw	ra,12(sp)
    //configure PLIC
    //cpu 0 accept all interrupts with priority above 0
    plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0); 
    1594:	00000613          	li	a2,0
    1598:	00000593          	li	a1,0
    159c:	f8c00537          	lui	a0,0xf8c00
    15a0:	e65ff0ef          	jal	ra,1404 <plic_set_threshold>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_GPIO_0_IO_INTERRUPTS_0, 1);
    15a4:	00100693          	li	a3,1
    15a8:	00c00613          	li	a2,12
    15ac:	00000593          	li	a1,0
    15b0:	f8c00537          	lui	a0,0xf8c00
    15b4:	e05ff0ef          	jal	ra,13b8 <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_GPIO_0_IO_INTERRUPTS_0, 1);
    15b8:	00100613          	li	a2,1
    15bc:	00c00593          	li	a1,12
    15c0:	f8c00537          	lui	a0,0xf8c00
    15c4:	de5ff0ef          	jal	ra,13a8 <plic_set_priority>
    15c8:	f80157b7          	lui	a5,0xf8015
    15cc:	00100713          	li	a4,1
    15d0:	02e7a023          	sw	a4,32(a5) # f8015020 <__freertos_irq_stack_top+0xf80126a0>
    //Enable rising edge interrupts
    gpio_setInterruptRiseEnable(GPIO0, 1); 
    //enable interrupts
    //Set the machine trap vector (../common/trap.S)
    csr_write(mtvec, trap_entry); 
    15d4:	000017b7          	lui	a5,0x1
    15d8:	75c78793          	addi	a5,a5,1884 # 175c <trap_entry>
    15dc:	30579073          	csrw	mtvec,a5
    //Enable external interrupts
    csr_set(mie, MIE_MEIE); 
    15e0:	000017b7          	lui	a5,0x1
    15e4:	80078793          	addi	a5,a5,-2048 # 800 <regnum_t6+0x7e1>
    15e8:	3047a073          	csrs	mie,a5
    csr_write(mstatus, csr_read(mstatus) | MSTATUS_MPP | MSTATUS_MIE);
    15ec:	300027f3          	csrr	a5,mstatus
    15f0:	00002737          	lui	a4,0x2
    15f4:	80870713          	addi	a4,a4,-2040 # 1808 <_data+0x1c>
    15f8:	00e7e7b3          	or	a5,a5,a4
    15fc:	30079073          	csrw	mstatus,a5
}
    1600:	00c12083          	lw	ra,12(sp)
    1604:	01010113          	addi	sp,sp,16
    1608:	00008067          	ret

0000160c <crash>:
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); 
    }
}

//Used on unexpected trap/interrupt codes
void crash(){
    160c:	ff010113          	addi	sp,sp,-16
    1610:	00112623          	sw	ra,12(sp)
    bsp_printf("\r\n*** CRASH ***\r\n");
    1614:	00002537          	lui	a0,0x2
    1618:	86050513          	addi	a0,a0,-1952 # 1860 <_data+0x74>
    161c:	e39ff0ef          	jal	ra,1454 <bsp_printf>
    while(1);
    1620:	0000006f          	j	1620 <crash+0x14>

00001624 <externalInterrupt>:
void externalInterrupt(){
    1624:	ff010113          	addi	sp,sp,-16
    1628:	00112623          	sw	ra,12(sp)
    162c:	00812423          	sw	s0,8(sp)
    while(claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0)){
    1630:	00000593          	li	a1,0
    1634:	f8c00537          	lui	a0,0xf8c00
    1638:	de5ff0ef          	jal	ra,141c <plic_claim>
    163c:	00050413          	mv	s0,a0
    1640:	02050863          	beqz	a0,1670 <externalInterrupt+0x4c>
        switch(claim){
    1644:	00c00793          	li	a5,12
    1648:	02f41263          	bne	s0,a5,166c <externalInterrupt+0x48>
        case SYSTEM_PLIC_SYSTEM_GPIO_0_IO_INTERRUPTS_0: bsp_printf("gpio 0 interrupt routine \r\n"); break;
    164c:	00002537          	lui	a0,0x2
    1650:	87450513          	addi	a0,a0,-1932 # 1874 <_data+0x88>
    1654:	e01ff0ef          	jal	ra,1454 <bsp_printf>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); 
    1658:	00040613          	mv	a2,s0
    165c:	00000593          	li	a1,0
    1660:	f8c00537          	lui	a0,0xf8c00
    1664:	dd5ff0ef          	jal	ra,1438 <plic_release>
    1668:	fc9ff06f          	j	1630 <externalInterrupt+0xc>
        default: crash(); break;
    166c:	fa1ff0ef          	jal	ra,160c <crash>
}
    1670:	00c12083          	lw	ra,12(sp)
    1674:	00812403          	lw	s0,8(sp)
    1678:	01010113          	addi	sp,sp,16
    167c:	00008067          	ret

00001680 <trap>:
void trap(){
    1680:	ff010113          	addi	sp,sp,-16
    1684:	00112623          	sw	ra,12(sp)
    int32_t mcause = csr_read(mcause);
    1688:	342027f3          	csrr	a5,mcause
    if(interrupt){
    168c:	0207d263          	bgez	a5,16b0 <trap+0x30>
    1690:	00f7f713          	andi	a4,a5,15
        switch(cause){
    1694:	00b00793          	li	a5,11
    1698:	00f71a63          	bne	a4,a5,16ac <trap+0x2c>
        case CAUSE_MACHINE_EXTERNAL: externalInterrupt(); break;
    169c:	f89ff0ef          	jal	ra,1624 <externalInterrupt>
}
    16a0:	00c12083          	lw	ra,12(sp)
    16a4:	01010113          	addi	sp,sp,16
    16a8:	00008067          	ret
        default: crash(); break;
    16ac:	f61ff0ef          	jal	ra,160c <crash>
        crash();
    16b0:	f5dff0ef          	jal	ra,160c <crash>

000016b4 <main>:
}

void main() {
    16b4:	ff010113          	addi	sp,sp,-16
    16b8:	00112623          	sw	ra,12(sp)
    16bc:	00812423          	sw	s0,8(sp)
    bsp_init();
    bsp_printf("gpio 0 demo ! \r\n");
    16c0:	00002537          	lui	a0,0x2
    16c4:	89050513          	addi	a0,a0,-1904 # 1890 <_data+0xa4>
    16c8:	d8dff0ef          	jal	ra,1454 <bsp_printf>
    bsp_printf("onboard LEDs blinking \r\n");
    16cc:	00002537          	lui	a0,0x2
    16d0:	8a450513          	addi	a0,a0,-1884 # 18a4 <_data+0xb8>
    16d4:	d81ff0ef          	jal	ra,1454 <bsp_printf>
    16d8:	f80157b7          	lui	a5,0xf8015
    16dc:	00e00713          	li	a4,14
    16e0:	00e7a423          	sw	a4,8(a5) # f8015008 <__freertos_irq_stack_top+0xf8012688>
    16e4:	0007a223          	sw	zero,4(a5)
    //configure 4 bits gpio 0
    gpio_setOutputEnable(GPIO0, 0xe);
    gpio_setOutput(GPIO0, 0x0);
    for (int i=0; i<50; i=i+1) {
    16e8:	00000413          	li	s0,0
    16ec:	0300006f          	j	171c <main+0x68>
        return *((volatile u32*) address);
    16f0:	f8015737          	lui	a4,0xf8015
    16f4:	00472783          	lw	a5,4(a4) # f8015004 <__freertos_irq_stack_top+0xf8012684>
        gpio_setOutput(GPIO0, gpio_getOutput(GPIO0) ^ 0xe);
    16f8:	00e7c793          	xori	a5,a5,14
        *((volatile u32*) address) = data;
    16fc:	00f72223          	sw	a5,4(a4)
        bsp_uDelay(LOOP_UDELAY);
    1700:	f8b00637          	lui	a2,0xf8b00
    1704:	05f5e5b7          	lui	a1,0x5f5e
    1708:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f5b780>
    170c:	00018537          	lui	a0,0x18
    1710:	6a050513          	addi	a0,a0,1696 # 186a0 <__freertos_irq_stack_top+0x15d20>
    1714:	a31ff0ef          	jal	ra,1144 <clint_uDelay>
    for (int i=0; i<50; i=i+1) {
    1718:	00140413          	addi	s0,s0,1
    171c:	03100793          	li	a5,49
    1720:	fc87d8e3          	bge	a5,s0,16f0 <main+0x3c>
    }   
    bsp_printf("gpio 0 interrupt demo ! \r\n");
    1724:	00002537          	lui	a0,0x2
    1728:	8c050513          	addi	a0,a0,-1856 # 18c0 <_data+0xd4>
    172c:	d29ff0ef          	jal	ra,1454 <bsp_printf>
    bsp_printf("Ti180 press and release onboard button sw4 \r\n");
    1730:	00002537          	lui	a0,0x2
    1734:	8dc50513          	addi	a0,a0,-1828 # 18dc <_data+0xf0>
    1738:	d1dff0ef          	jal	ra,1454 <bsp_printf>
    bsp_printf("Ti60 press and release onboard button sw6 \r\n");
    173c:	00002537          	lui	a0,0x2
    1740:	90c50513          	addi	a0,a0,-1780 # 190c <_data+0x120>
    1744:	d11ff0ef          	jal	ra,1454 <bsp_printf>
    bsp_printf("T120 press and release onboard button sw7 \r\n");
    1748:	00002537          	lui	a0,0x2
    174c:	93c50513          	addi	a0,a0,-1732 # 193c <_data+0x150>
    1750:	d05ff0ef          	jal	ra,1454 <bsp_printf>
    init();
    1754:	e39ff0ef          	jal	ra,158c <init>
    while(1); 
    1758:	0000006f          	j	1758 <main+0xa4>

0000175c <trap_entry>:
.global  trap_entry
.align(2) //mtvec require 32 bits allignement
trap_entry:
  addi sp,sp, -16*4
    175c:	fc010113          	addi	sp,sp,-64
  sw x1,   0*4(sp)
    1760:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
    1764:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
    1768:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
    176c:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
    1770:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
    1774:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
    1778:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
    177c:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
    1780:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
    1784:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
    1788:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
    178c:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
    1790:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
    1794:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
    1798:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
    179c:	03f12e23          	sw	t6,60(sp)
  call trap
    17a0:	ee1ff0ef          	jal	ra,1680 <trap>
  lw x1 ,  0*4(sp)
    17a4:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
    17a8:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
    17ac:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
    17b0:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
    17b4:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
    17b8:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
    17bc:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
    17c0:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
    17c4:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
    17c8:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
    17cc:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
    17d0:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
    17d4:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
    17d8:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
    17dc:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
    17e0:	03c12f83          	lw	t6,60(sp)
  addi sp,sp, 16*4
    17e4:	04010113          	addi	sp,sp,64
  mret
    17e8:	30200073          	mret
