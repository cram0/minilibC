BITS 64
GLOBAL memcpy

SECTION .text

; rdi 1e arg dest
; rsi 2e arg source
; rdx 3e arg size

memcpy:
    xor rcx, rcx                ; Definis le registre counter rcx a 0
    mov rax, rdi                ; Bouge l'adresse dans le registre rdi dans le registre rax

loop:
    cmp rdx, rcx                ; Compare si on a atteint le parametre 3 size avec le registre counter rcx
    je finish                   ; Si c'est le cas, on return rax
    mov r10b, BYTE[rsi + rcx]   ; On stock dans les 8 lower bits du registre r10 la valeur du byte contenu a l'adresse de rsi + l'offset rcx * BYTE
    mov BYTE[rdi + rcx], r10b   ; On stock la valeur contenue dans les 8 lower bit du registre r10 a l'adresse de rdi + l'offset rxc * BYTE
    inc rcx                     ; On incremente le registre rcx
    jmp loop                    ; On reboucle

finish:
    ret                         ; Retourne le registre de retour rax