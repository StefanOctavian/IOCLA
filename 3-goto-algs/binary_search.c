#include <stdio.h>

int main(void)
{
	int v[] =  {1, 2, 15, 51, 53, 66, 202, 7000};
	int dest = v[2]; /* 15 */
	int start = 0;
	int end = sizeof(v) / sizeof(int) - 1;
	int mid, found = 0;

binary_search_start:
	if (start >= end) goto binary_search_end;
	mid = start + (end - start) / 2;
	if (v[mid] == dest) {
		found = 1;
		goto binary_search_end;
	}
	if (v[mid] < dest) start = mid;
	if (v[mid] > dest) end = mid;
	goto binary_search_start;

binary_search_end:
	printf("Element was%sfound ", found ? " " : " not ");
	if(found) printf("at position %d", mid);
	printf("\n");
}
