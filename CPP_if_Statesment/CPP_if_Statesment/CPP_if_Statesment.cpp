// CPP_if_Statesment.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <cmath>
#include <climits>

using namespace std;

static void clearCIN(void) {
    cin.clear();
    cin.ignore(INT_MAX, '\n');
}

int main()
{
    float hyp = 0;
    float a = 0;
    float b = 0;
    float c = 0;
    char answer;

    std::cout << "Hello World!\n";

    enterA:
    cout << "Please enter the value for sale A ";
    cin >> a;
    clearCIN();
    enterB:
    cout << "Please enter the value for sale B ";
    cin >> b;
    clearCIN();
    //if ( a >= 0 and b > 0)  {   // (a == 0 or a < 0) or a == 0 || a < 0)
    //    hyp = sqrt(pow(a, 2) + pow(b, 2));
    //    cout << "the length fo the hypotenuse is " << hyp << endl;
    //    
    //}
    //else {
    //    cout << "either a or b are less than equal to zero" << endl;
    //}

 if (a >= 0) {
     if (b >= 0) {
         hyp = sqrt(pow(a, 2) + pow(b, 2));
         cout << "the length fo the hypotenuse is " << hyp << endl;
     }
     else {
        cout << "a cannot be zero try again " << endl;
        goto enterB;
     }   
 }
 else {
     cout << "a cannot be less than zero please  try again" << endl;
     goto enterA;
 }
 /*else {
     cout << "good value to recived for A" << endl;
 }*/

   /* enterA:
    cout << "Please enter the value for sale A ";
    cin >> a;
    clearCIN();
    if (a == 0) {
        cout << "a cannot be zero try again " << endl;
        goto enterA;
    }
        
    else if (a < 0) {
        cout << "a cannot be less than zero please  try again" << endl;
        goto enterA;
    }
    else {
        cout << "good value to recived for A" << endl;
    }*/
        


    /*enterB:
    cout << "Please enter the value for sale B ";
    cin >> b;
    clearCIN();
    if (b == 0) {
        cout << "b cannot be zero try again " << endl;
        goto enterB;
    }
    
    else if (b < 0) {
        cout << "b cannot be less than zero please  try again" << endl;
        goto enterB;
    }
    else {
        cout << "good value to recived for B" << endl;
    }*/

    /*hyp = sqrt(pow(a, 2) + pow(b, 2));
    cout << "the length fo the hypotenuse is " << hyp << endl;*/

    cout << "would you like to do this again (y/n) " << endl;
    cin.get(answer);
    if (answer == 'Y') {  // or answer != 'Y'
        goto enterA;
    }
    else {
    cout << "Programm ending have a nice day " << endl;
    }

    return 0;
}

 