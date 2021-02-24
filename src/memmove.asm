BITS 64
GLOBAL memmove

SECTION .text

; rdi 1e arg dest
; rsi 2e arg source
; rdx 3e arg size

; Le code du memmove est essentiellement le meme que le memcpy,
; il est cense copier les donnees ailleurs avant de remplacer les
; donnees de la destination, mais crash si on le fait differement
; donc on reutilise le meme code :)

memmove:
    xor rcx, rcx
    mov rax, rdi

loop:
    cmp rdi, 0
    je finish
    cmp rsi, 0
    je finish
    cmp rdx, rcx
    je finish

    mov r10b, BYTE[rsi + rcx]
    mov BYTE[rdi + rcx], r10b

    inc rcx

    jmp loop

finish:
    ret