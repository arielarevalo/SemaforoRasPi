GPFSEL0 EQU     0x20200000 ; Direccion inicial seleccion de modo
GPFSEL5 EQU     GPFSEL0 + 20 ; Direccion final seleccion de modo
GPSET0  EQU     GPFSEL5 + 8 ; Direccion inicial encendido
GPSCLR0 EQU     GPSET0 + 12 ; Direccion inicial apagado

MACRO   ; one for each state
MEND    

ENTRY  

SETUP   LDR     R1, =153391689 ; 001 001 001 001 001 001 001 001 001 001
        LDR     R2, =GPFSEL0
        LDR     R3, =GPFSEL5 + 4
LOOP    STR     R1, [R2],#4
        CMP     R2, R3
        BNE     LOOP ; Todos los pines en OUTPUT



        END
