BITS 64
GLOBAL strstr

SECTION .text

; rdi foin
; rsi aiguille

strstr:
    xor rax, rax
    xor r8, r8
    xor r9, r9

loop:
    mov r10b, BYTE[rsi + r9]
    mov r11b, BYTE[rdi + rax]
    cmp r10b, 0
    je finish
    cmp r11b, 0
    je finishn

    cmp r10b, r11b
    jne reset_needle

    inc rax
    inc r9

    jmp loop

reset_needle:
    xor r9, r9
    inc r8
    mov rax, r8
    jmp loop

finish:
    add rdi, r8
    mov rax, rdi
    ret

finishn:
    mov rax, 0
    ret
