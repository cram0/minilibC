BITS 64
GLOBAL strchr

SECTION .text

strchr:
    xor rax, rax                ; Definis la valeur du registre rax a 0
    xor rcx, rcx                ; Definis la valeur du registre rcx a 0

loop:
    cmp BYTE[rdi + rcx], 0      ; Compares si on est a la fin de la string dans le registre rdi
    je nfinish                  ; Si c'est le cas, cela veut dire que l'on a pas trouve l'occurence du mot a l'index rdi + (rcx * BYTE)
    cmp QWORD[rdi + rcx], rsi   ; Compares si le caractere a l'adresse rdi + (rcx * QWORD) est egal au caractere recherche, stocke dans rsi
    je finish                   ; Si c'est le cas, on jump vers le label finish
    inc rcx                     ; Sinon, on incremente le registre rcx de 1
    jmp loop                    ; Puis on relance la boucle

finish:
    mov rax, QWORD[rdi + rcx]   ; On stock dans le registre de retour rax la valeur de l'adresse de rdi + l'offset (rcx * QWORD)
    ret

nfinish:
    mov rax, 0                  ; Si le caractere n'est pas trouve, place 0 dans le registre de retour rax, ce qui equivaut a renvoyer (null)
    ret