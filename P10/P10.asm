%include "../LIB/pc_iox.inc"

section .data

section .bss

section .text
    global _sumar
    global _strlen
    global _getBit

_sumar:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8] ; Aqui se encuentra el primer parametro de la funcion
    add eax, [ebp+12] ; Aqui se encuentra el primer parametro de la funcion
    pop ebp
    ret

; la direccino de char* se encuentra en 'ebp+8' tomando en cuenta
; que se hizo el push de ebp y el del parametro
; Utilizamos eax como indice para recorrer 'ebp+8'
_strlen:
    push ebp
    mov ebp, esp
    push esi 
    xor eax, eax
    mov esi, [ebp+8]
    .loop:
        cmp byte[esi+eax], 0; Comprobar si la posicion es el caracter nulo
            je .salir
        inc eax
    jmp .loop
    .salir: 
        pop esi
        pop ebp
        ret

; Procedimiento que obtiene el estado del bit pedido
; en '[ebp+8]' esta el numero y en '[ebp+12]' esta el bit a obtener
_getBit:
    push ebp
    mov ebp, esp
    ; Limpiar los registros para evitar interferencias
    xor eax, eax
    xor ecx, ecx
    mov eax, [ebp+8] ; Aqui esta el numero 
    mov ecx, [ebp+12]
    shr eax, cl ; Aqui esta la posicion del bit
    and eax, 1
    pop ebp
    ret
