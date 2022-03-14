#include <stdio.h>

/**
 * Afisati adresele elementelor din vectorul "v" impreuna cu valorile
 * de la acestea.
 * Parcurgeti adresele, pe rand, din octet in octet,
 * din 2 in 2 octeti si apoi din 4 in 4.
 */

int main() {
    int v[] = {0xCAFEBABE, 0xDEADBEEF, 0x0B00B135, 0xBAADF00D, 0xDEADC0DE};

    for(unsigned char* p = (unsigned char*)v; p - (unsigned char*)v < (signed)sizeof(v); p++)
	printf("%p -> 0x%x\n", p, *p);	
    for(unsigned short int* p = (unsigned short int*)v; p - (unsigned short int*)v < (signed)(sizeof(v) / sizeof(short int)); p++)
	printf("%p -> 0x%x\n", p, *p);
    for(unsigned int* p = (unsigned int*)v; p - (unsigned int*)v < (signed)(sizeof(v) / sizeof(int)) ; p++)
	printf("%p -> 0x%x\n", p, *p);

    return 0;
}
