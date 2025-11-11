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
    mov eax, 0
    .loop:
        cmp byte[ebp+8+eax], 0; Comprobar si la posicion es el caracter nulo
            je .salir
        inc eax
    jmp .loop
    .salir: 
        pop ebp
        ret
