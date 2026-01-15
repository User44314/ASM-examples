/*
 ============================================================================
 Name        : CString.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int main(void) {
	puts("!!!Hello World!!!"); /* prints !!!Hello World!!! */
	char myName[64] = "Hello World1";
	char herName[64] = "new name ";
	puts(myName);

	strcpy(myName, "hello world2");
	puts(myName);

	strcpy(myName, herName);
	puts(myName);

	strcat(myName, herName);
	puts(myName);

	strcat(myName, " so there ");
	puts(myName);

	puts("Before the comparisons");
	puts(myName);
	puts(herName);
	if (strcmp(myName, herName) == 0){
		puts("my name is equal");
	}
	if (strcmp(myName, herName) < 0){
			puts("my name is not equal");
		}

	if(strcmp(myName, herName) > 0){
		puts("****myName is greater than herName ");
	}

	puts("Program is ending");
	return EXIT_SUCCESS;
}
