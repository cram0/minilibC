BITS 64
GLOBAL rindex

SECTION .text

rindex:
    xor rax, rax
    xor rcx, rcx

loop:
    cmp BYTE[rdi + rcx], 0
    je decloop
    inc rcx
    jmp loop

decloop:
    cmp [rdi + rcx], rsi
    je finish
    dec rcx
    jmp decloop

finish:
    mov rax, [rdi + rcx]
    ret