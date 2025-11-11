%include "../LIB/pc_iox.inc"

section .data

section .bss

section .text
    global _sumar
    global _strlen

_sumar:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8] ; Aqui se encuentra el segundo parametro de la funcion
    add eax, [ebp+12] ; Aqui se encuentra el primer parametro de la funcion
    pop ebp
    ret

; la direccino de char* se encuentra en 'ebp+8' tomando en cuenta
; que se hizo el push de ebp y el del parametro
; Utilizamos eax como indice para recorrer 'ebp+8'
_strlen:
    push ebp
    mov ebp, esp
    mov esi, 0
    .loop:
        mov al, [ebp+4+esi]
        cmp al, 0; Comprobar si la posicion es el caracter nulo
            je .salir
        call putchar
        inc esi
    jmp .loop
    .salir: 
        mov eax, esi
        pop ebp
        ret

