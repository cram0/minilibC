BITS 64
GLOBAL strpbrk

SECTION .text

strpbrk:
    xor rax, rax
    xor r8, r8
    xor r9, r9

loop:
    mov r10b, BYTE[rdi + rax]
    mov r11b, BYTE[rsi + r9]
    cmp r10b, 0
    je finishn
    cmp r11b, 0
    je next_char

    cmp r10b, r11b
    je finish
    inc r9

    jmp loop

next_char:
    xor r9, r9
    inc r8
    inc rax
    jmp loop

finish:
    add rdi, r8
    mov rax, rdi
    ret

finishn:
    mov rax, 0
    ret