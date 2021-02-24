BITS 64
GLOBAL memmove

SECTION .text

; rdi 1e arg dest
; rsi 2e arg source
; rdx 3e arg n

memmove:
    xor rcx, rcx

loop:
    cmp rdi, 0
    je finish
    cmp rsi, 0
    je finish

    cmp rdx, rcx
    jz finish

    mov r10b, BYTE[rsi + rcx]
    mov BYTE[rdi + rcx], r10b

    inc rcx

    jmp loop

finish:
    mov rax, rdi
    ret