        ;       LED_PIN_0 = 22
        ;       LED_PIN_1 = 23
        ;       LED_PIN_2 = 24

GPFSEL0 EQU     0x3F200000 ; Direccion inicial seleccion de modo
GPFSEL2 EQU     GPFSEL0 + 8 ; Direccion seleccion modo pines 20-29
GPFSEL5 EQU     GPFSEL2 + 12 ; Direccion final seleccion de modo
GPSET0  EQU     GPFSEL5 + 8 ; Direccion inicial encendido
GPCLR0  EQU     GPSET0 + 12 ; Direccion inicial apagado

ENTRY   

        BL      CLEAN

SETUP   LDR     R2, =GPFSEL2 ; Pines 22, 23, 24 OUTPUT
        MOV     R1, #0x00001240 ; (00000000000000000001001001000000)
        STR     R1, [R2]

        LDR     R2, =GPSET0 ; 32 bits/pines por pasar a HIGH
        LDR     R3, =GPCLR0 ; 32 bits/pines por pasar a LOW

ESTA    MOV     R1, #0x00C00000 ; (00000000110000000000000000000000)
        STR     R1, [R3] ; Pines 22, 23 LOW
        MOV     R1, #0x01000000 ; (00000001000000000000000000000000)
        STR     R1, [R2] ; Pin 24 HIGH
        BL      WAIT

ESTB    MOV     R1, #0x00800000 ; (00000000100000000000000000000000)
        STR     R1, [R3] ; Pin 23 LOW
        MOV     R1, #0x01400000 ; (00000001010000000000000000000000)
        STR     R1, [R2] ; Pines 22, 24 HIGH
        BL      WAIT

ESTC    MOV     R1, #0x01000000 ; (00000001000000000000000000000000)
        STR     R1, [R3] ; Pin 24 LOW
        MOV     R1, #0x00C00000 ; (00000000110000000000000000000000)
        STR     R1, [R2] ; Pines 22, 23 HIGH
        BL      WAIT

ESTD    MOV     R1, #0x01400000 ; (00000001010000000000000000000000)
        STR     R1, [R3] ; Pines 22, 24 LOW
        MOV     R1, #0x00800000 ; (00000000100000000000000000000000)
        STR     R1, [R2] ; Pin 23 HIGH
        BL      WAIT

        B       ESTA

        BL      CLEAN
        END

CLEAN   STMDB   SP!, {LR} ; Todos pins INPUT
        MOV     R1, #0 ; (00000000000000000000000000000000)
        LDR     R2, =GPFSEL0
        LDR     R3, =GPFSEL5 + 4
FSELN   STR     R1, [R2],#4 ; Ciclo para cubrir cada GPFSEL
        CMP     R2, R3
        BNE     FSELN
        LDMIA   SP!, {PC}

WAIT    STMDB   SP!, {LR} ; Resta de un numero grande para esperar
        MOV     R4, #1
        MOV     R5, #0x00019000
LOOP    SUB     R5, R5, R4
        CMP     R5, #0
        BNE     LOOP
        LDMIA   SP!, {PC}