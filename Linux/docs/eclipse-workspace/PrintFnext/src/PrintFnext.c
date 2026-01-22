/*
 ============================================================================
 Name        : PrintFnext.c
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
#include <locale.h>
#include <stdbool.h>

void removeLeading(char* theString, int theLength);
void removeTrailing(char* theString, int theLength);

int main(void) {

		char myName[64] = "Bill sky the ...";
		char dollardepositBuffer[16];
		char dollarInterestBuffer[16];
		char workBuffer[32] = {'\0'};
		struct lconv *lc;

		int interstYear = 0;
		double interestRate = 0.0;
		double interestEarned = 0.0;
		double totalDeposit = 0.0;
		double totalinterestEarned = 0.00;

		setlocale(LC_ALL, "");
		lc = localeconv();

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

			strcpy(dollardepositBuffer, lc->currency_symbol);
			snprintf(workBuffer, 16, "%'11.4f", totalDeposit);
			removeLeading(workBuffer, 32);
			strcat(dollardepositBuffer, workBuffer);

			strcpy(dollarInterestBuffer, lc->currency_symbol);
			snprintf(workBuffer, 16, "%'11.4f", interestEarned);
			removeLeading(workBuffer, 32);
			strcat(dollarInterestBuffer, workBuffer);

			printf("%6u %13.4f %13s %14s\n",interstYear , interestRate, dollardepositBuffer, dollarInterestBuffer);
		}
		printf("%34s %14s\n", " " , "--------------");
		strcpy(dollardepositBuffer, lc->currency_symbol);
		snprintf(workBuffer, 16, "%'11.4f", totalinterestEarned);
		strcat(dollardepositBuffer, workBuffer);

		printf("%34s %14s\n\n", "Total interest Earned:", dollardepositBuffer);
		puts("Program is ending gave a nice");
	return EXIT_SUCCESS;
}

void removeTrailing(char* theString, int theLength)
{
	int currentPos = theLength-1;
	if (theLength <=0 || theString[0] == '\0'){
		return;
	}
		else{
			while(currentPos >=0){
				if (theString[currentPos] == ' ' || theString[currentPos] == '\0'){
					theString[currentPos] = '\0';
					currentPos++;
					continue;
				}else{
					break;
				}
			}
		}
}

void removeLeading(char* theString, int theLength){
	int currentPos = 0;
	int startPos = 0;
	bool justCopying = false;
	if (theLength <= 0 || theString[0] == '\0'){
		return;
	}
	else{
		while (currentPos < theLength){
			if (theString[currentPos] == ' ' && !justCopying){
				currentPos++;
			continue;
		}
		else{
			theString[startPos] = theString[currentPos];
			currentPos++;
			startPos++;
			justCopying = true;
		}
	}
}
}
