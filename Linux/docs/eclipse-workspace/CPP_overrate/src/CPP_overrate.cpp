//============================================================================
// Name        : CPP_overrate.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <string>
#include "PuppyDog.hpp"

using namespace std;

int main() {
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

	    cout << endl;

	    PuppyDog* puppy1 = new PuppyDog();
	    puppy1->setWeightInOnces(16);
	    cout << "the puppy weighs " << puppy1->getWeightInOnces() << " ounces" << endl;
	    puppy1->setWeightInOnces(puppy1->getWeightInOnces()+1);
	    cout << "the puppy weighs " << puppy1->getWeightInOnces() << " ounces" << endl;
	    puppy1->setWeightInOnces(puppy1->getWeightInOnces()-1);
	    cout << "the puppy weighs " << puppy1->getWeightInOnces() << " ounces" << endl;

	    cout << "Overloaded Increment/Decrement test Postprefix" << endl;
	    (*puppy1)++;
	    cout << "the puppy weighs " << puppy1->getWeightInOnces() << " ounces" << endl;
	    (*puppy1)--;
	    cout << "the puppy weighs " << puppy1->getWeightInOnces() << " ounces" << endl;
	    cout << endl;
	    cout << "Overloaded Increment/Decrement test Prefix" << endl;
	    ++(*puppy1);
	    cout << "the puppy weighs " << puppy1->getWeightInOnces() << " ounces" << endl;
	    --(*puppy1);
	    cout << "the puppy weighs " << puppy1->getWeightInOnces() << " ounces" << endl;

	    delete puppy1;

	    cout << endl;


	    //----------------------------------

	    PuppyDog* myDog = new PuppyDog();
	    myDog->setWeightInOnces(96);
	    cout << "My Puppy dog weight " << myDog->getWeightInOnces() << " ounces" << endl;

	    myDog->setWeightInOnces(myDog->getWeightInOnces()+10);
	    cout << "My Puppy dog weight " << myDog->getWeightInOnces() << " ounces" << endl;

	    *myDog = *myDog + 11;
	    cout << "My Puppy dog weight " << myDog->getWeightInOnces() << " ounces" << endl;
	    *myDog = *myDog - 11;
	    cout << "My Puppy dog weight " << myDog->getWeightInOnces() << " ounces" << endl;
	    *myDog = *myDog * 10;
	    cout << "My Puppy dog weight " << myDog->getWeightInOnces() << " ounces" << endl;
	    *myDog = *myDog / 10;
	    cout << "My Puppy dog weight " << myDog->getWeightInOnces() << " ounces" << endl;
	    *myDog = *myDog / .5;
	    cout << "My Puppy dog weight " << myDog->getWeightInOnces() << " ounces" << endl;
	   // delete myDog;


	    cout << endl;
	    //----------------------------------

	    PuppyDog* myDog2 = new PuppyDog();
	   // PuppyDog* myDog3 = new PuppyDog();
	    cout << "Ny dog 2 test weight is " << myDog2->getWeightInOnces()  << endl;
	    cout << "my dog weight is " << myDog->getWeightInOnces() << endl;

	    *myDog2 = *myDog2 + *myDog;
	    cout << "My Puppy dog weight " << myDog2->getWeightInOnces() << " ounces" << endl;
	    myDog2 = *myDog2 + myDog;
	    cout << "My Puppy dog weight " << myDog2->getWeightInOnces() << " ounces" << endl;

	    *myDog2 +=300;
	    cout << "My puppy dogs weight " << myDog2->getWeightInOnces() << endl;


	    PuppyDog staticDog1;
	    staticDog1.setWeightInOnces(10);
	    staticDog1 += 100;
	    cout << staticDog1.getWeightInOnces() << endl;


	    delete myDog;
	    delete myDog2;

	    //delete myDog3;
	cout << "Programming ending" << endl;
	return 0;
}
