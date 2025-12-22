// CPP_Array.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <climits>
#include <string>

using namespace std;

const int DARRAY_SIZE = 20;
const int IARRAY_SIZE = 10;

void clearCIN(void) {
    cin.clear();
    cin.ignore(INT_MAX, '\n');
}

int main()
{
    unsigned int anUintArray[IARRAY_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    unsigned int anUintArray1[10] = { 0 };
    unsigned int anUintArray2[100] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    double myDoubleArray[DARRAY_SIZE] = { 0.00 };
    int myDoubleArrayCount = 0;
    double tempDouble = 0.00;
    int arrayCounter = 0;

    string myNameArray[IARRAY_SIZE];
    int myNameArryayCount = 0;
    string tempName;


    for (int i = 0; i < IARRAY_SIZE; i++)
    { 
        cout << anUintArray[i] << endl;
    }

    //double
    myDoubleArrayCount = 0;
    while (tempDouble != -999.00 && (myDoubleArrayCount < DARRAY_SIZE)) {
        cout << "enter a flaoting point number for the array (-999 to exit)";
        cin >> tempDouble;
        clearCIN();
        if (tempDouble == -999.00) {
            continue;
        } 
        else { 
            myDoubleArray[myDoubleArrayCount] = tempDouble;
            myDoubleArrayCount++;
        }
    }

    cout << "Printed double array ... " << endl;
    for (int i = 0; i < myDoubleArrayCount; i++)
    {
        cout << myDoubleArray[i] << endl;
    }

    cout << "the avarage of your flaoting point numbers ";
    tempDouble = 0.00;
    for (int i = 0; i < myDoubleArrayCount; i++)
    {
        tempDouble += myDoubleArray[i];
    }
    tempDouble = tempDouble / myDoubleArrayCount;
    cout << tempDouble << endl;

    //string 
    for (myNameArryayCount = 0; myNameArryayCount < IARRAY_SIZE; myNameArryayCount++) {
        cout << "Please enter a name for the name array (-999 to exit) ";
        std::getline(cin, tempName);
        if (tempName == "-999") {
            break;
        }
        else {
            myNameArray[myNameArryayCount] = tempName;
            //myNameArryayCount++;
        }
    }
    cout << "you entered " << myNameArryayCount << " names, here they are " << endl;
    cout << "Printed string array ... " << endl;
    for (int i = 0; i < myNameArryayCount; i++)
    {
        cout << myNameArray[i] << endl;
    }



    /*for (int i = 0; i < 10; i++)
    { 
        cout << anUintArray[i] << endl;
    }*/

    std::cout << "Hello World!\n";
}

 