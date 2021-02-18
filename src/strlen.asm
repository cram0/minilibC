BITS 64
GLOBAL strlen

SECTION .text


strlen:
    xor rax, rax            ; Definis le registre rax a 0 avec la comparaison XOR
    xor rcx, rcx            ; Definis le registre compteur rcx a 0 avec XOR

loop:
    cmp BYTE[rdi + rcx], 0  ; Compare si le caractere a l'adresse de rdi + (rcx * BYTE) est egal a 0 (\0)
    je finish               ; Si la derniere instruction est vraie, on jump vers le label finish
    inc rcx                 ; Sinon, on increment le registre rcx
    inc rax                 ; On incremente aussi le registre du resultat
    jmp loop                ; Et on relance la boucle

finish:
    ret                     ; Retourne le resultat