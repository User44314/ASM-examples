//============================================================================
// Name        : CPP_Operator_inctrement_dicrement_overloading.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "PuppyDog.hpp"

using namespace std;

int main() {

	PuppyDog* myDog = new PuppyDog();
	myDog->setWeightInOunces(96);
	cout << "My Puppy dog weight " << myDog->getWeightInOunces() << endl;
	myDog->setWeightInOunces(myDog->getWeightInOunces()+10);
	cout << "My Puppy dog weight " << myDog->getWeightInOunces() << endl;

	*myDog = *myDog + 10;
	cout << "My Puppy dog weight " << myDog->getWeightInOunces() << endl;

	*myDog = *myDog - 10;
	cout << "My Puppy dog weight " << myDog->getWeightInOunces() << endl;


	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!

	int someInteger = 0;
	cout << someInteger << endl;
	someInteger++;
	cout << someInteger << endl;
	someInteger--;
	cout << someInteger << endl;
	cout << someInteger++ << endl;
	cout << someInteger << endl;

	cout << ++someInteger << endl;
	cout << someInteger << endl;

	cout << "Program is ending have a nice day" << endl;
	delete myDog;
	return 0;
}
