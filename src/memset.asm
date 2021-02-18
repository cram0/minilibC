BITS 64
GLOBAL memset

SECTION .text

memset:
    mov rax, rdi                ; On stock les data du registre rdi dans le registre rax (le pointeur du premier parametre en l'occurence)
    xor rcx, rcx                ; On initialize le registre rcx a 0

loop:
    cmp rcx, rdx                ; On verifie si on a bien incremente rcx fois par rapport au 3e parametre
    je finish                   ; Si c'est le cas, on return rax
    mov BYTE[rdi + rcx], sil    ; On stock la valeur contenue dans les 8 lower bits (le caractere donc) du registre rsi dans le registre rdi + l'offset (rcx * BYTE)
    inc rcx                     ; On incremente le registre rcx
    jmp loop                    ; On recommence la boucle

finish:
    ret                         ; On retourne rax