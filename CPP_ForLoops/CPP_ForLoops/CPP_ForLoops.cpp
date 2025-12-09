// CPP_ForLoops.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <climits>

using namespace std;

void clearCIN(void) {
    cin.clear();
    cin.ignore(INT_MAX, '\n');
}//clear cin; 

int main()
{
    std::cout << "Hello World!\n" << endl;
    unsigned int i = 0; 
    double theDoubleSum = 0.00;
    double userDoubleInput = 0.00;
 

    for (i = 0; i < 10; i++) {
        cout << "Value of i is " << i << endl;
        if (i < 5)
        {
            continue;
       } 
       else {
            break;
        }
    }
    cout << endl; 


   /* for (int k = 10; k < 0; k--) {
       cout << "Value of i is " << k << endl;
    }*/

    cout << "user inout loop " << endl;
    for (unsigned int j = 0; j < 5; j++) {
        cout << "enter a double value or (-999 to exit) " << endl;
        cin >> userDoubleInput;
        clearCIN();
        if (userDoubleInput == -999.00) {
            break;
        }
        else {
            theDoubleSum += userDoubleInput;
        }
    cout << "the total you enter is " << theDoubleSum << endl;
    if (j == 0) {
        cout << " No sum or avarage is available" << endl;
    }
    else {
        cout << "the avarage is " << theDoubleSum / 5 << endl;
        }
    }
    
    return 0;
}

 