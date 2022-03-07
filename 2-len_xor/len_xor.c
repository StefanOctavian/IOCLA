#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int my_strlen(const char *str)
{
	int len = 0;
	for (; *str != '\0'; ++str, ++len);
	return len;
}

void equality_check(const char *str)
{
	int k = my_strlen(str);
	for (int i = 0; i < k; ++i) {
		if (!(*(str + i) - *(str + (i + (1 << i)) % k)))
			printf("Address of %c: %p ", *(str + i), str + i);
	}
}

int main(void)
{
	char s[256];
	scanf("%256s", s);
	printf("Length = %d ", my_strlen(s));
        equality_check(s);	
	return 0;
}

