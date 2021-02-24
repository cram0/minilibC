BITS 64
GLOBAL rindex

SECTION .text

rindex:
    mov rax, rdi
    xor rcx, rcx

loop:
    cmp BYTE[rdi], 0
    je finish

    cmp BYTE[rax], sil
    je inc_loop

    cmp BYTE[rax], 0
    je finish

    inc rax
    jmp loop

inc_loop:
    mov rcx, rax
    inc rax
    jmp loop

finish:
    mov rax, rcx
    ret