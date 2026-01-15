#include <iostream> 
#include <ctime>
#include <string>

//#include <time.h>

using namespace std;

int main(int argc, char* argv[]){
	
	time_t theTime;
	struct tm* timeStruct;
	
	int theSeconds;
	int theMinutes;
	int theHours;
	
	int theYear;
	int theMonth;
	int theDay;
	
	string monthString;
	
	cout << "Welcom to C++" << endl;
	time(&theTime);
	cout << theTime << endl;
	timeStruct = gmtime(&theTime);
	//cout << timeStruct << endl;
	cout << "the cuurrent date and time is " << asctime(timeStruct) << endl;
	timeStruct = localtime(&theTime);
	cout << "the cuurrent local date and time is " << asctime(timeStruct) << endl;
	
	theSeconds = timeStruct->tm_sec;
	theMinutes = timeStruct->tm_min;
	theHours = timeStruct->tm_hour;
	theYear = timeStruct->tm_year;
	theMonth = timeStruct->tm_mon;
	
	cout << "the disected time is " << theHours << ":" << theMinutes << ":" << theSeconds << endl;
	theYear += 1900;
	cout << "the year is " << theYear << endl;
	theMonth += 1;
	cout << "the month is " << theMonth << endl;
	
	switch (theMonth) {
		case 1:{
			monthString = "Janary";
			break;
		}
		case 2:{
			monthString = "Febrery";
			break;
		}
		case 3:{
			monthString = "Marth";
			break;
		}
		case 4:{
			monthString = "April";
			break;
		}
		case 5:{
			monthString = "May";
			break;
		}
		case 6:{
			monthString = "June";
			break;
		}
		case 7:{
			monthString = "July";
			break;
		}
		case 8:{
			monthString = "Augest";
			break;
		}
		case 9:{
			monthString = "September";
			break;
		}
		case 10:{
			monthString = "October";
			break;
		}
		case 11:{
			monthString = "November";
			break;
		}
		case 12:{
			monthString = "Desember";
			break;
		}
		default: {
			monthString = "System errors";
		}
	} 
	cout << "the month is:: " << monthString << endl;
	
	theDay = timeStruct->tm_mday;
	cout << "the day is " << theDay << endl;
	
	cout << "the dayLight saving flag is " << timeStruct->tm_isdst << endl;
	if (timeStruct->tm_isdst){
		theHours++;
	}
	else {}
	cout << "the hour adjusted for dayLight savings time is " << theHours << endl;
	
	cout << "Programm ending have a nice time" << endl;
	return 0;
}
