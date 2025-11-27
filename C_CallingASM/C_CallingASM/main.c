#include <stdlib.h>
#include <stdio.h>

extern long long getFive(void);

int main(int argc, char* argv[])
{
	long long int returnValue = 0;
	puts("welcom to my program\n");
	
	returnValue = getFive();
	printf("the value returned from getFive() is: %llu\n", returnValue);

	puts("Program ending");
	return 0;
}