//============================================================================
// Name        : OStream_overload.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include  "PuppyDog.hpp"

using namespace std;

int main() {
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!

	PuppyDog myDog1;
	PuppyDog myDog2;

	myDog1.setName("Jack");
	myDog1.setBreed("Jack Rassell");
	myDog1.setAgeInYears(10);
	myDog1.setWeightInOnces(176);

	cout << myDog1.getName() << ", " << myDog1.getBreed() << ", " << " " << myDog1.getAgeInYears() << ". " << myDog1.getWeightInOnces() << endl;

	cout << myDog1 << endl;
	cout << "Enter the Name of dog " << endl;
	cin >> myDog2;
	cout << myDog2 << endl;


	cout << "Program is ending have a nice day" << endl;
	return 0;
}
