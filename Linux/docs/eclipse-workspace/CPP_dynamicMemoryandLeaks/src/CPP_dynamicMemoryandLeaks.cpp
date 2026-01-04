//============================================================================
// Name        : CPP_dynamicMemoryandLeaks.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
using namespace std;

struct Donut {
	int Calories;
	float Cost;
	float Price;
};

int main() {
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!

	int* intPtr = nullptr;
	double* adoublePtr = nullptr;
	Donut* aDonutPtr = nullptr;

	//int anPtr = 100;
	//intPtr = &anPtr;

	intPtr = new int(100);
	cout << *intPtr << endl;

	*intPtr = 200;
	cout << *intPtr << endl;

	adoublePtr = new double(123.45);
	cout << *adoublePtr << endl;

	*adoublePtr = 567.89;
	cout << *adoublePtr << endl;

	aDonutPtr = new Donut;
	if (aDonutPtr != nullptr){
	(*aDonutPtr).Price = 1.29;
	(*aDonutPtr).Cost = .59;
	(*aDonutPtr).Calories = 500;
	}
	else {
		cout << "the pointer is not pointing to anything" << endl;
	}


	delete aDonutPtr;
	aDonutPtr = nullptr;
	cout << aDonutPtr << endl;
	delete intPtr;
	intPtr = nullptr;
	cout << intPtr << endl;
	delete adoublePtr;
	adoublePtr = nullptr;
	cout << adoublePtr << endl;

	cout << "Program is ending have a nice day" << endl;
	return 0;
}
