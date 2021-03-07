BITS 64
GLOBAL strchr

SECTION .text

strchr:
    xor rax, rax                ; Definis la valeur du registre rax a 0

loop:
    cmp BYTE[rdi], sil      ; Compares si le caractere a l'adresse BYTE[rdi] est egal au caractere recherche, stocke dans sil (les lower 8 bit de rsi)
    je finish               ; Si c'est le cas, on jump vers le label finish
    cmp BYTE[rdi], 0        ; Compares si on est a la fin de la string dans le registre rdi
    je nfinish              ; Si c'est le cas, cela veut dire que l'on a pas trouve l'occurence du mot a l'index BYTE[rdi]
    inc rdi                 ; Sinon, on incremente le registre rdi de 1
    jmp loop                ; Puis on relance la boucle

finish:
    mov rax, rdi            ; On stock dans le registre de retour rax la valeur de l'adresse de rdi
    ret

nfinish:
    mov rax, 0                  ; Si le caractere n'est pas trouve, place 0 dans le registre de retour rax, ce qui equivaut a renvoyer (null)
    ret