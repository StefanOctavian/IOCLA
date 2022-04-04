#include <stdio.h>

int main(void)
{
	int v[] = {4, 1, 2, -17, 15, 22, 6, 2};
	int max;
	int i;

	max = v[0];
	i = 1;

loop:
	if (v[i] > max)
		max = v[i];
	++i;
	if (i < 8) goto loop;

	printf("Max=%d\n", max);
}
