//============================================================================
// Name        : CPP_OO_Intro.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <cstring>
#include "Puppy.hpp"

using namespace std;

struct PuppyStruct{
	char name[32];
	char breed[24];
	int ageInYears;
	float weightInPounds;
};


int main() {
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
	Puppy* myFirstpuppy;    // if not pointer Puppy myFirstpuppy;
	Puppy* mySecondpuppy;

	myFirstpuppy = new Puppy();
	mySecondpuppy = new Puppy();

	strcpy(myFirstpuppy->name, "Cassie");  //if not pointer strcpy(myFirstpuppy.name, "Cassie");
	strcpy(myFirstpuppy->breed, "Coker spanel");

	strcpy(mySecondpuppy->name, "Jack");
	strcpy(mySecondpuppy->breed, "Jack Russel terrier");

	cout << myFirstpuppy->name << " is a " << myFirstpuppy->breed << endl;
	cout << mySecondpuppy->name << " is a " << mySecondpuppy->breed << endl;

	cout << "Size of a puppy is " << sizeof(*myFirstpuppy) << endl;

	delete myFirstpuppy;
	delete mySecondpuppy;

	cout << "Program is ending have a nice day" << endl;
	return 0;
}
