#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* delete_first(char *s, char *pattern) {
	char* ret = malloc(sizeof(char) * (strlen(s) - strlen(pattern) + 1));
	char* occ = strstr(s, pattern);
	strncpy(ret, s, occ - s);
       	ret[occ - s] = '\0';
	strcat(ret, occ + strlen(pattern));
	return ret;	
}

int main(){
	char *s = "Ana are mere";
	char *pattern = "re";

	// Decomentati linia dupa ce ati implementat functia delete_first.
	printf("%s\n", delete_first(s, pattern));

	return 0;
}
