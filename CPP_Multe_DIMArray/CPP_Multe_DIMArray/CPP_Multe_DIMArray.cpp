// CPP_Multe_DIMArray.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <iomanip>

using namespace std;

void printArray(int theArray[][20], unsigned numRows, unsigned numCols)
{
    for (unsigned int i = 0; i < numRows; i++) {   //row for loop
        for (unsigned int j = 0; j < numCols; j++)  //col for loop
        {
            cout << setw(8) << theArray[i][j];
        }
        cout << endl;
    }
}



int main()
{
    std::cout << "Hello World!\n";

    const unsigned int MAXROWS = 30;
    const unsigned int MAXCOLS = 20;
    const unsigned int MAXSHEETS = 3;

    int anintArray[MAXROWS][MAXCOLS];
                     //30    //20
    //                  30 *20 = 600 cells; 600 *4 = 2400 bytes
    double adoubleArray[MAXSHEETS][MAXROWS][MAXCOLS];

    cout << "our array before initialization" << endl;
    printArray(anintArray, 30, 20);
    cout << endl;

    for (unsigned int i = 0; i < MAXROWS; i++) {   //row for loop
        for (unsigned int j = 0;  j < MAXCOLS; j++)  //col for loop
        {
            anintArray[i][j] = 0;
        }
    }

    for (unsigned int i = 0; i < MAXROWS; i++) {   //row for loop
        for (unsigned int j = 0; j < MAXCOLS; j++)  //col for loop
        {
            cout << setw(8) << anintArray[i][j];
        }
        cout << endl;
    }

    cout << endl;

    printArray(anintArray, 3, 5);

    cout << "Program ending" << endl;
    return 0; 
}
