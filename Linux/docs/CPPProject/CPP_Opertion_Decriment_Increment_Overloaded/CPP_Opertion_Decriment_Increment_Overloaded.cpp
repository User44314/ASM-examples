// CPP_Opertion_Decriment_Increment.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

#include "PupyyDog.hpp"

using namespace std;

int main()
{
    std::cout << "Hello World!\n";

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

    PupyyDog* puppy1 = new PupyyDog();
    puppy1->setweighInOunce(16);
	cout << "the puppy weighs " << puppy1->getweighInOunce() << endl;

    cout << "programming ending" << endl;
    return 0;
}
 
