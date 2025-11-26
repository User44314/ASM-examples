#include <stdio.h>
extern long long getFive(void);

int main (int argc, char* argv[])
{
	long long returnValue = 0;
	
	printf ("welcom to C!\n");
	returnValue = getFive();
	printf ("retunr value  from getFive() is %llu \n", returnValue);
	
	
	
	printf("program ending have a nice day\n");
	return 0;
}
//main
//
