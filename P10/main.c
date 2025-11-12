#include <stdio.h>

extern int _sumar(int, int);
extern int _strlen(char*);
extern int _getBit(int, int);

int main() {
    char *str = "Mi nombre es Ramon Manriquez\0"; // 12 caracteres
    int x = 1;
    int y = 0;
    int result = _sumar(x, y);
    printf("El resultado es: %d\n", result);
    int len = _strlen(str);
    printf("La longitud de str es de: %d caracteres\n", len);
    /*
    0000 0
    0001 1
    0010 2
    0011 3
    0100 4
    0101 5
    0110 6
    0111 7
    1000 8
    1001 9
    1010 10
    1011 11
    1100 12
    1101 13
    1110 14
    1111 15
    */
    int bit = _getBit(x, y);
    printf("El bit en la posición %d de %d es: %d\n", y, x, bit);
    return 0;
}