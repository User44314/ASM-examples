#include <iostream>

using namespace std;

int main(){
	
	int anInteger = 100;
	int anInteger2 = 200;
	string aString = "hello ho";
	double aDouble = 1234.45;
	anInteger = 900;
	
	cout << "hello world" << endl;
	
	cout << anInteger << endl;
	cout << &anInteger << endl; // get me address of that memory
	anInteger = anInteger2;
	anInteger = aDouble;
	cout << anInteger << endl;
	aDouble = anInteger;
	cout << aDouble << endl;
	
	aString = anInteger;   // not correct
	
	cout << aString << endl;
	
	
	cout << "programm ending have a nice day" << endl;
	
	
	
	return 0;
	}
