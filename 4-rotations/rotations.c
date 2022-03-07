#include <stdio.h>

void rotate_left(int *number, int bits)
{
	unsigned int mask = ~0u <<  (32 - bits);
	*number = (*number << bits) + ((mask & *number) >> (32 - bits));
}

void rotate_right(int *number, int bits)
{
	(void) number;
	(void) bits;
}

int main()
{
	int x = 0x00000001;
	rotate_left(&x, 16);
	printf("%d\n", x);
	return 0;
}

