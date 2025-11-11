; Ramon Manriquez Guerrero
; 10/11/2025
; Procedimiento para imprimir una cadena terminada en 0

%include "../LIB/pc_iox.inc"

section .data
    mensaje db "Deng no se ha terminado Silkgod", 0xa, 0

section .text
    define global _start

_start:
    mov esi, 0
    mov ebx, mensaje
    call _printStr
    call _invertirStr
    ;call _printStr

    mov eax, 1
    int 80h

; Procedimiento que imprime lo que este en 'ebx'
; imprime hasta encontrar un caracter nulo o 0
; hace uso de putchar el cual trabaja con al
_printStr:
    push eax ; Se utiliza al
    push esi ; Se utiliza esi como indice
    .imprimir: ; bucle para imprimir
        mov al, [ebx+esi] ; caracter de la cadena
        cmp al, 0
            je .salir
        call putchar
        inc esi
        jmp .imprimir
    .salir:
        pop esi
        pop eax
        ret

; Procedimiento que invierte una cadena terminada en caracter nulo o 0
; la cadena original esta en ebx y la cadena invertida esta tambien en ebx
_invertirStr:
    push eax
    push esi
    push edi ; Utilizaremos edi para guardar la cedena invertida de manera temporal
    mov edi, 0 ; trabajaremos con edi para el inicio de ebx y esi para el fin de la cadena
    ; Recorrer hasta encontrar el caracter nulo
    .buscar:
        cmp byte[ebx+esi], 0
            je .invertir
        inc esi
        jmp .buscar
    ; Pasar a 'edx' la cadena de 'ebx' pero invertida
    .invertir:
        dec esi
        cmp esi, -1
            je .regresar
        mov al, [ebx+esi]
        mov [edx+edi], al
        inc edi
        jmp .invertir
    ; Regresar a 'ebx' la cadena invertida en 'edx'
    .regresar:
        cmp edi, -1
            je .salir
        mov al, [edx + edi]
        mov [ebx+esi], al
        inc esi
        dec edi
        jmp .regresar
    .salir:
        pop edi
        pop esi
        pop eax
        ret