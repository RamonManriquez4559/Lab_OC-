#include <stdio.h>
#include <stdint.h>

extern void _pBin8b(uint8_t);
extern void _pBin16b(uint16_t);
extern void _pBin32b(uint32_t);
extern void _pBin64b(uint64_t);

int main(void) {
    printf("Imprimiendo dato de 8 bits\n");
    _pBin8b(8);
    printf("\nImprimiendo dato de 16 bits\n");
    _pBin16b(16);
    printf("\nImprimiendo dato de 32 bits\n");
    _pBin32b(32);
    printf("\nImprimiendo dato de 64 bits\n");
    _pBin64b(64);
    printf("\n");
    return 0;
}
