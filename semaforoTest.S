.equ GPFSEL0, 0x3F200000
.equ GPFSEL5, GPFSEL0 + 20 // Direccion final seleccion de modo
.equ GPSET0, GPFSEL5 + 8 // Direccion inicial encendido
.equ GPSCLR0, GPSET0 + 12 // Direccion inicial apagado

.text
.section .init
.globl _start
_start:
    bl setup

    ldr r2, =GPFSEL0
    mov r1, #1
    lsl r1, #12
    str r1, [r2]

    ldr r1, =GPSET0
    mov r1, #1
    lsl r1, #4
    str r1,[r2]

    mov r2,#0x3F0000
wait1$:
    sub r2,#1
    cmp r2,#0
    bne wait1$

    bl setup
.end

setup:
    push {lr}
    mov r1, #0
    ldr r2, =GPFSEL0
    ldr r3, =GPFSEL5 + 4

    str r1, [r2],#4
    cmp r2, r3
    bne mode
    pop {pc}

loop: 
b loop
