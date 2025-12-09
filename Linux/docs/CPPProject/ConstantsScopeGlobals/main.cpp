#include <iostream>
#include <climits>

using namespace std;

//function
int addTwo(int int1, int int2)
{
	int returnValue = 0;
	returnValue = int1 + int2;
	return returnValue;
	}

int main(){
	
	const int MY_AGE = 39;
	const int MY_HEIGHT = 72;
	int myInt = 0;
	
	
	myInt = addTwo(10,20);
	cout << myInt << endl;
	
	cout << "hello world"<< endl;
	
	cout << INT_MAX << endl;
	cout << MY_AGE << endl;
	
	myInt = MY_AGE;
	myInt = MY_HEIGHT;
	
	
	
	cout << "program is ending" << endl;
	
	return 0;
	}
