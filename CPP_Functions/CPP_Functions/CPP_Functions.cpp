// CPP_Functions.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <cmath>
#include <climits>
#include "my1.h"
 

using namespace std;

int main()
{
    double sideA = 0;
    double sideB = 0;
    double sideC = 0;

    std::cout << "Hello World!\n";
    cout << "Plese enter the length of side a" << endl;
    cin >> sideA;
    clearCIN();
    cout << "Plese enter the length of side b" << endl;
    cin >> sideB;
    clearCIN();

    cout << sideA << ", " << sideB << endl;
    sideC = calculateHyp(sideA, sideB);
    cout << "the hypotenues " << sideC << endl;
    cout << "Program is ending" << endl;
    return 0;

}
