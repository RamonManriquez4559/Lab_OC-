%include "../LIB/pc_iox.inc" 

section .data

section .bss

section .text
    global _pBin8b
    global _pBin16b
    global _pBin32b
    global _pBin64b

; ecx tiene la cantidad de veces a repetir el loop
; ebx tiene el dato a repetir
; eax tendra los bites a imprimir

_pBin8b:
    push ebp
    mov ebp, esp
    call _limpiar
    mov ecx, 8
    call _imprimir 
    pop ebp
    ret
    
_pBin16b:
    push ebp
    mov ebp, esp
    call _limpiar
    mov ecx, 16
    call _imprimir
    pop ebp
    ret

_pBin32b:
    push ebp
    mov ebp, esp
    call _limpiar
    mov ecx, 32
    call _imprimir
    pop ebp
    ret

_pBin64b:
    push ebp
    mov ebp, esp
    call _limpiar
    mov ecx, 64
    call _imprimir
    pop ebp
    ret

_imprimir:
    mov ebx, [ebp + 8] ; Aqui esta el inicio del dato 
    .loop:
    shr ebx, 1 ; movemos al carry el bit menos significativo
    jc .uno
    jmp .cero
    .uno: 
        mov al, '1'
        call putchar
        jmp .repetir
    .cero: 
        mov al, '0'
        call putchar
    .repetir: 
        loop .loop ; se hara un loop de 8, 16, 32 o 64 veces dependiendo de a quien se llame
    ret

_limpiar:
    xor eax, eax
    xor ecx, ecx
    xor ebx, ebx
    ret





