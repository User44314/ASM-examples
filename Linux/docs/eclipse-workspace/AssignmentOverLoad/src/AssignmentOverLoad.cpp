//============================================================================
// Name        : AssignmentOverLoad.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "PuppyDog.hpp"

using namespace std;
void printDog(string dogName, PuppyDog &theDog){
	cout << "*** dog being printed mydog1 ***" << dogName <<endl;
	cout << theDog.getName() << endl;
	cout << theDog.getBreed() << endl;
	cout << theDog.getWeightInOnces() << endl;
	cout << theDog.getAgeInYears()<< endl;

}

int main() {
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!

	PuppyDog myDog1;
	PuppyDog myDog2;
	PuppyDog myDog4;
	cout << "*** Initalizaet " << endl;
	myDog1.setBreed("Pug");
	myDog1.setName("Puggie");
	myDog1.setWeightInOnces(32);
	myDog1.setAgeInYears(5);

	printDog("myDog1", myDog1);


	myDog2.setBreed("Collie");
	myDog2.setName("Chelsie");
	myDog2.setWeightInOnces(120);
	myDog2.setAgeInYears(15);
	printDog("myDog2", myDog2);


	//member wise copy or assigment
	myDog1 = myDog2;
	cout << "*** after the mydog2 to myDog1 assigmant " << endl;
	printDog("myDog1", myDog1);


	PuppyDog myDog3(myDog2);
	cout << "*** after the mydog3 instantiation " << endl;
	printDog("myDog3", myDog3);


	myDog4.setBreed("jack nic");
	myDog4.setName("jack");
	myDog4.setWeightInOnces(110);
	myDog4.setAgeInYears(7);
	printDog("myDog4", myDog4);
	cout << "*** after the mydog4 " << endl;
	printDog("myDog4", myDog4);

	myDog3.operator=(myDog4);
	cout << "*** after the mudog4 copy into myDog3" << endl;
	printDog("myDog3", myDog3);

	cout << "Program is ending have a nice day" << endl;
	return 0;
}
