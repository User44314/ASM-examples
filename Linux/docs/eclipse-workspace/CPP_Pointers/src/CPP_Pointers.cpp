//============================================================================
// Name        : CPP_Pointers.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <string>

using namespace std;

struct Zomby{
	int daysDead;
	string name;
};

int main() {

	int anInt = 999;
	int* anIntPtr;  //bad idea to initialization int* anIntPtr = nullptr;

	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!

	cout << anInt << endl;
	cout << &anInt << endl;

	cout << "the pointer stuff" << endl;
	cout << anIntPtr << endl;
	anIntPtr = &anInt;
	cout << anIntPtr << endl;
	//let's dereference anItPtr
	cout << *anIntPtr << endl;

	//--------------------------------------------
	cout << "********************************************" << endl;
	//1)creating pointers with different data
	double myIQ = 135.22;
	double* mydoublePtr = &myIQ;
	cout << myIQ << endl;
	cout << mydoublePtr << endl;
	cout << *mydoublePtr << endl;

	double  mywifeIQ = 143.99;
	mydoublePtr = &mywifeIQ;
	cout << *mydoublePtr << endl;

	char middleInitial = 'J';
	char* charPtr;
	charPtr = &middleInitial;
	cout << *charPtr << endl;
	cout << charPtr << endl;


	Zomby zombyX;
	zombyX.name = "scary";
	Zomby* aZombyPtr = &zombyX;
	(*aZombyPtr).daysDead = 93;
	cout << (*aZombyPtr).name << ", " << (*aZombyPtr).daysDead << endl;

	//2)mixing pointers with different data types
	//mydoublePtr = &anInt; //cannot convert ‘int*’ to ‘double*’ in assignment

	//3)arrays - are really is pointers
	int myIntArray[5] = {0,1,2,3,4};
	for (int i =0; i < 5; i++){
		cout << myIntArray[i] << endl;
	}
	cout << myIntArray << endl;  // show us the address

	anIntPtr = myIntArray;
	cout << myIntArray[0] << ", " << myIntArray[1] << endl;
	for(int x : myIntArray)
		cout << x << endl;

	cout << "Program is ending have a nice day" << endl;
	return 0;
}
