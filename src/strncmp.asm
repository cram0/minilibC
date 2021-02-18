BITS 64
GLOBAL strncmp

SECTION .text

strncmp:
    xor rcx, rcx                ; Definis le registre counter rcx a 0

loop:
    cmp rcx, rdx                ; On verifie si le compteur a atteint n
    je finish                   ; Si c'est le cas, on jump au label finish
    mov r10b, BYTE[rdi + rcx]   ; On stock la lettre 1 dans les 8 lower bits du registre rdi + l'offset rcx dans le registre r10
    mov r11b, BYTE[rsi + rcx]   ; On stock la lettre 2 dans les 8 lower bits du registre rsi + l'offset rcx dans le registre r11
    cmp r10b, r11b              ; On compare les deux lettres
    jne finish                  ; Si elles ne sont pas egales, on jump au label finish
    cmp r10b, 0                 ; On compare la lettre a 0
    je finish                   ; Si c'est egal a 0, on jump au label finish
    cmp r11b, 0                 ; On compare la lettre a 0
    je finish                   ; Si c'est egal a 0, on jump au label finish
    inc rcx                     ; On incremente le compteur du registre rcx
    jmp loop                    ; On relance la boucle

finish:
    sub r10b, r11b              ; On soustrait la valeur de la lettre 2 a la lettre 1, puis on stock le resultat dans le registre contenant la lettre 1
    movsx rax, r10b             ; On move le resultat contenu dans les 8 lower bits du registre r10 dans le registre rax, en gardant le signe negatif si c'est le cas avec movsx
    ret                         ; On return le resultat contenu dans rax