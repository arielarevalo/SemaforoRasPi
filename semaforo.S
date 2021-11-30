GPFSEL0 EQU     0x7E200000 ; Direccion inicial seleccion de modo
GPFSEL5 EQU     GPFSEL0 + 20 ; Direccion final seleccion de modo
GPSET0  EQU     GPFSEL5 + 8 ; Direccion inicial encendido
GPSCLR0 EQU     GPSET0 + 12 ; Direccion inicial apagado

ENTRY   

SETUP   LDR     R1, =0 ; FSEL set to INPUT (000000000000000000000000000000)
        LDR     R2, =GPFSEL0
        LDR     R3, =GPFSEL5 + 4

MOD0    STR     R1, [R2],#4
        CMP     R2, R3
        BNE     MODE ; Todos los pines en INPUT

        ; CAMBIOS DE SEMAFORO

TRDWN   LDR     R1, =0 ; FSEL set to INPUT (000000000000000000000000000000)
        LDR     R2, =GPFSEL0
        LDR     R3, =GPFSEL5 + 4

MOD1    STR     R1, [R2],#4
        CMP     R2, R3
        BNE     MODE ; Todos los pines en INPUT