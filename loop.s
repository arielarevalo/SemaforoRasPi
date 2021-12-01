loop():
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L9:
        mov     DWORD PTR [rbp-8], 0
        jmp     .L3
.L8:
        mov     DWORD PTR [rbp-12], 0
        jmp     .L4
.L7:
        mov     DWORD PTR [rbp-16], 0
        jmp     .L5
.L11:
        nop
        add     DWORD PTR [rbp-16], 1
.L5:
        cmp     DWORD PTR [rbp-16], 8999
        jle     .L11
        add     DWORD PTR [rbp-12], 1
.L4:
        cmp     DWORD PTR [rbp-12], 8999
        jle     .L7
        add     DWORD PTR [rbp-8], 1
.L3:
        cmp     DWORD PTR [rbp-8], 8999
        jle     .L8
        add     DWORD PTR [rbp-4], 1
.L2:
        cmp     DWORD PTR [rbp-4], 8999
        jle     .L9
        nop
        pop     rbp
        ret
