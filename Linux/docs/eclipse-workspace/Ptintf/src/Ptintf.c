/*
 ============================================================================
 Name        : Ptintf.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int main(void) {

	int anInt = 999;
	int anInt1 = -999;
	char myName[64] = "Bill sky the ...";
	float myFloat = 123.45;
	double myDouble = 567.89991;

	int interstYear = 0;
	double interestRate = 0.0;
	double interestEarned = 0.0;
	double totalDeposit = 0.0;
	double totalinterestEarned = 0.00;

	puts("!!!Hello World!!!"); /* prints !!!Hello World!!! */
	printf("%s\n", myName);
	printf("%80s\n", myName);
	printf("%u\n", anInt);
	printf("the value of anInt and anInt1 is: %u\n and %i\n", anInt, anInt1);
	printf("the value of myFloat is %12.2f\n", myFloat);
	printf("the value of %%myDouble is %12.3f\n", myDouble);

	printf("\n%s\n","Insert Incoming Report");
	printf("%s\n","----------------------");
	printf("%6s %6s %12s %10s\n","Year" , "Interest-Rate", "total-Deposit", "Interest-Earned");
	printf("%6s %6s %12s %10s\n","----" , "-------------", "-------------", "---------------");
	for (int i=0; i < 10; i++){
		interstYear = 2000 + 1;
		interestRate = (rand()%8)/100.00;
		totalDeposit = rand()%15000 + ((rand()%100)/100.00);
		interestEarned = totalDeposit * interestRate;
		totalinterestEarned += interestEarned;
		printf("%6u %13.2f %13.2f %14.2f\n",interstYear , interestRate, totalDeposit, interestEarned);
		fprintf(stderr, "This is an error:%u %s\n", i, "Test error");
	}
	printf("%34s %14s\n", " " , "--------------");
	printf("%34s %14.2f\n\n", "Total interest Earned:", totalinterestEarned);
	puts("Program is ending gave a nice");
	return EXIT_SUCCESS;
}
