// CCP_CallingASM.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

using namespace std;

extern  "C" long long getFive(void);
extern  "C" long long addTwo(long long, long long);
extern  "C" long long addArray(long long[], long long);     //OR  addArray(long long*, long long);


int main()
{
    long long returnValue = 0;
    long long array1[5] = { 10, 20, 30, 40, 50 };

    std::cout << "Hello World!\n" << endl;

    returnValue = getFive();
    cout << "the value from getFive() is " << returnValue << endl; 

    returnValue = addTwo(10, 20);
    cout << "the value from addTwo() is " << returnValue << endl;

    returnValue = addArray(array1, 5);
    cout << "the value from addArray() is " << returnValue << endl;

    cout << "Programming ending" << endl;
}

