GPFSEL0 EQU     0x3F200000 ; 32 bits. 3 bit por pin. Pines de 0 a 9
GPFSEL1 EQU     0x3F200004 ; pines de 10 a 19. 
ENTRY

MODE   LDR R2 = GPFSEL0 ; carga GPSELF1 en el registro 2
        MOV R1, #1 ; Coloca un 1 en el registro 1
        LSL R1, #12 ; Mueve en 1 doce veces a la izquierda
        STR R1, [R2] ; Guarda lo que esté en el registro 1, en la dirección que está en el registro 2

PWR0    LDR R2, = GPSET0 ; 
        MOV R1, #1
        LSL R1, #4
        STR R1,[R2]

