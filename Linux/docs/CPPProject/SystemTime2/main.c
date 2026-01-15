#include <stdio.h> 
//#include <iostream>
#include <time.h>
#include <string.h>

//#include <time.h>

//using namespace std;

int main(int argc, char* argv[]){
	
	time_t theTime;
	struct tm* timeStruct;
	
	int theSeconds;
	int theMinutes;
	int theHours;
	int theYear;
	int theMonth;
	int theDay;
	
	char monthString[18];
	
	printf("Welcom to C++\n");
	time(&theTime);
	printf("%ld \n", theTime);
	timeStruct = gmtime(&theTime);
	//cout << timeStruct << endl;
	printf("the cuurrent date and time is %s \n", asctime(timeStruct));
	timeStruct = localtime(&theTime);
	printf("the cuurrent local date and time is %s \n", asctime(timeStruct));
	
	theSeconds = timeStruct->tm_sec;
	theMinutes = timeStruct->tm_min;
	theHours = timeStruct->tm_hour;
	theYear = timeStruct->tm_year;
	theMonth = timeStruct->tm_mon;
	
	printf("the disected time is %d : %d : %d \n", theHours, theMinutes, theSeconds);
	theYear += 1900;
	printf("the year is %d \n", theYear);
	theMonth += 1;
	printf("the month is %d, \n", theMonth);
	
	switch (theMonth) {
		case 1:{
			strcpy(monthString, "Janary");
			break;
		}
		case 2:{
			strcpy(monthString, "Febrery");
			break;
		}
		case 3:{
			strcpy(monthString, "Marth");
			break;
		}
		case 4:{
			strcpy(monthString, "April");
			break;
		}
		case 5:{
			strcpy(monthString, "May");
			break;
		}
		case 6:{
			strcpy(monthString, "June");
			break;
		}
		case 7:{
			strcpy(monthString, "July");
			break;
		}
		case 8:{
			strcpy(monthString, "Augest");
			break;
		}
		case 9:{
			strcpy(monthString, "September");
			break;
		}
		case 10:{
			strcpy(monthString, "October");
			break;
		}
		case 11:{
			strcpy(monthString, "November");
			break;
		}
		case 12:{
			strcpy(monthString, "Desember");
			break;
		}
		default: {
			strcpy(monthString,"System errors");
		}
	} 
	printf("the month is:: %s \n", monthString);
	
	theDay = timeStruct->tm_mday;
	printf("the day is %d \n", theDay);
	
	printf("the dayLight saving flag is %d, \n", timeStruct->tm_isdst);
	if (timeStruct->tm_isdst){
		theHours++;
	}
	else {}
	printf("the hour adjusted for dayLight savings time is %d \n", theHours);
	
	printf("Programm ending have a nice time \n");
	return 0;
}
