#include <stdio.h>

extern int _sumar(int, int);
extern int _strlen(char*);

int main() {
    char *str = "Hola, Mundo!\0"; // 12 caracteres
    int x = 7;
    int y = 3;
    int result = _sumar(x, y);
    printf("El resultado es: %d\n", result);
    int len = _strlen(str);
    printf("La longitud de str es de: %d caracteres\n", len);

    return 0;
}