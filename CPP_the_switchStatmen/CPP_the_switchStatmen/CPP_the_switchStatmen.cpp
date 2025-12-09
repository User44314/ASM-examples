// CPP_the_switchStatmen.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

using namespace std;

void clearCIN(void) {
    cin.clear();
    cin.ignore(INT_MAX, '\n');
}

int main()
{
    char userResponce = ' ';
    int intInput = 0;
    // menuLoop:
    do {
        // while (toupper(userResponce)) {   //or while(true)

        std::cout << "Hello World!\n";
        cout << ":Main menu" << endl;
        cout << "============" << endl;
        cout << "Print <h>ello" << endl;
        cout << "print <g>oodbye" << endl;
        cout << "Input <i>nteger" << endl;
        cout << "E<xit from the program" << endl;
        cin >> userResponce;
        clearCIN();


        switch (toupper(userResponce)) {
        case 'H': {
            cout << "hello there" << endl;
            break;
        }

        case 'G': {
            cout << "googbye all " << endl;
            break;
        }

        case 'I':
        {
            cout << "please enter intger" << endl;
            cin >> intInput;
            clearCIN();
            cout << "you entered " << intInput << endl;
            break;
        }

        case 'X': {
            cout << "you chose to leave the program" << endl;
            break;
        }

        default: {
            cout << "invalid menu" << endl;
            break;
        }
        }

        cout << "you entered " << userResponce << endl;
        if (toupper(userResponce == 'x')) {
            break;
        }
        else {
            continue;
        }
        //if (userResponce == 'x' or userResponce == 'X') {
            //goto menuLoop;
       // }

    //}//while
    } while (toupper(userResponce) != 'X');
    cout << "programm is ending" << endl;
        return 0; 
}

 