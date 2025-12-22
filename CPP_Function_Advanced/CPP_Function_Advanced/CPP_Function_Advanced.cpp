// CPP_Function_Advanced.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <cmath>
#include <climits>
#include "MyFunctionsr.h"

using namespace std;
int someGlobslVariable = 0;

void initIntegerArray(int sizeOfArray, int theArray[]) {
    for (int i = 0; i < sizeOfArray; i++) {
        theArray[i] = 0;
    }
}

void ptintIntegerArray(int sizeOfArray, int theArray[]) {
    for (int i = 0; i < sizeOfArray; i++) {
        cout << theArray[i] << endl;
    }
}

int main()
{
    std::cout << "Hello World!\n";

    const int ARRAY_SIZE = 10;
    int anIntArray[ARRAY_SIZE];
    initIntegerArray(ARRAY_SIZE, anIntArray);
    ptintIntegerArray(ARRAY_SIZE, anIntArray);
 

    double sideA = 0;
    double sideB = 0;
    double sideC = 0;

    cout << "Please enter the lenght of the side a";
    cin >> sideA;
    clearCIN();

    cout << "Please enter the lenght of the side b";
    cin >> sideB;
    clearCIN();

    cout << sideA << ", " << sideB << endl;

    sideC = calculateHyp(sideA, sideB);
    cout << "the hypotenues " << sideC << endl;
    cout << "C double is " << sideC * 2 << endl;
    cout << calculateHyp( 0, 10) << endl;
    cout << "Program is ending" << endl;
    return 0;
}

 