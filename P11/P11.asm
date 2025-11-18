extern putchar

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
    push eax
    push ebx
    push ecx

    mov ebp, esp
    mov ebx, [ebp + 8] ; Aqui esta el inicio del dato 
    mov ecx, 8
    call _imprimir 

    pop ecx 
    pop ebx
    pop eax
    pop ebp
    ret
    
_pBin16b:
    push ebp

    mov ebp, esp
    mov ebx, [ebp + 8] ; Aqui esta el inicio del dato 
    mov ecx, 16
    call _imprimir

    pop ebp
    ret

_pBin32b:
    push ebp

    mov ebp, esp
    mov ebx, [ebp + 8] ; Aqui esta el inicio del dato 
    mov ecx, 32
    call _imprimir

    pop ebp
    ret

_pBin64b:
    push ebp
    push eax
    push ebx
    push ecx

    mov ebp, esp
    mov ebx, [ebp + 12] ; +12 porque son palabras, 32 es una palabra y 32 es otra palabra 4 y 4 bytes 
    mov ecx, 64
    call _imprimir

    pop ecx 
    pop ebx
    pop eax
    pop ebp
    ret

_imprimir:
    .loop:
    shl ebx, 1 ; movemos al carry el bit mas significativo porque imprimimos de izquierda a derecha
    jc .uno ; jump if carry
    jmp .cero
    .uno: 
        mov al, '1'
        call _myPutchar
        jmp .repetir
    .cero: 
        mov al, '0'
        call _myPutchar
    .repetir: 
        loop .loop ; se hara un loop de 8, 16, 32 o 64 veces dependiendo de a quien se llame
    ret

_myPutchar:
    push ebx
    push ecx
    push eax
    call putchar
    pop eax
    pop ecx
    pop ebx
    ret