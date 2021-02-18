BITS 64
GLOBAL memmove

SECTION .text

; rdi 1e arg dest
; rsi 2e arg source
; rdx 3e arg n

memmove:
    mov rax, rdi
    xor rcx, rcx

loop:
    cmp rdx, rcx
    je domove
    mov rbx, [rsi + rcx]
    push rbx
    inc rcx
    jmp loop

domove:
    cmp rcx, 0
    je finish
    pop rbx
    mov [rdi + rcx], rbx
    dec rcx

finish:
    ret