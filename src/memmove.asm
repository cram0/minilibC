BITS 64
GLOBAL memmove

SECTION .text

; rdi 1e arg dest
; rsi 2e arg source
; rdx 3e arg n

memmove:
    mov rax, rdi            ; On copie l'adresse du parametre 1 dans le registre rax
    xor rcx, rcx            ; On definis le registre counter rcx a 0

loop:
    cmp rdx, rcx            ; On compare le compteur au parametre 3
    je domove               ; Si il est egal on bouge la memoire stockee
    mov rbx, [rsi + rcx]    ; On place l'octet a l'adresse rsi + rcx dans le registre rbx
    push rbx                ; On push le contenu de rbx sur la pile
    inc rcx                 ; On incremente le compteur
    jmp loop                ; On relance la boucle

domove:
    cmp rcx, 0              ; On compare si le compteur est egal a 0
    je finish               ; Si c'est le cas, on jump a finish
    pop rbx                 ; On pop le dernier element de la pile vers le registre rbx
    mov [rdi + rcx], rbx    ; On bouge l'octet stocke dans rbx vers la destination stockee dans rdi + l'offset rcx
    dec rcx                 ; On decremente le compteur

finish:
    ret                     ; On retourne rax