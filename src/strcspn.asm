BITS 64
GLOBAL strcspn

SECTION .text

strcspn:
    xor rax, rax
    xor rcx, rcx

loop:
    mov r10b, BYTE[rdi + rax]
    mov r11b, BYTE[rsi + rcx]

    cmp r10b, 0
    je quit

    cmp r11b, 0
    je next_char

    cmp r10b, r11b
    je quit

    inc rcx

    jmp loop

next_char:
    xor rcx, rcx
    inc rax
    jmp loop

quit:
    ret