#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void mirror(char *s)
{
	int k = strlen(s);
	for (int i = 0; i < k / 2; ++i) {
		char aux = *(s + i);
		char* p = s + k - 1 - i;
		*(s + i) = *p;
		*p = aux;
	}
}

int main()
{
	char s[256];
	scanf("%s", s);
	mirror(s);
	printf("%s", s);
	return 0;
}

