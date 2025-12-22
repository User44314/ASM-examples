// CPP_RandomNumbers.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <ctime>

using namespace std;

int main()
{
    std::cout << "Hello World!\n";
    int randomInt1 = 0;
    int randomInt2 = 0;
    int randomInt3 = 0;
    double randomDouble = 0.00;

    const int MIN_RANDOM_VALUE = 100;
    const int MAX_RANDOM_VALUE = 1000;


    char randomCString[32];
   
    srand(time(0)); 
    
    randomInt1 = rand();
    for (int i = 0; i < 10; i++) {
        //randomInt1 = rand()%100;
        randomInt1 = MIN_RANDOM_VALUE + (rand() % (MAX_RANDOM_VALUE - MIN_RANDOM_VALUE));
        randomInt2 = rand() % 100;
        if (randomInt2 < 50) {
            randomInt1 *= -1;
        }
        else {
             
        }
        cout << randomInt1 << endl;
    } // for

    cout << endl;

    for (int i = 0; i < 10; i++) {
        randomInt1 = rand() % 100;
        randomInt2 = rand() % 100;
        randomDouble = randomInt1 + (randomInt2 / 100.00);
        cout << "randomDouble " << randomDouble << endl;

    }
    cout << endl;

    for (int i = 0; i < 10; i++) {
        randomInt1 = rand() % 100;
        randomInt2 = rand() % 100;
        randomDouble = randomInt1 + (randomInt2 / 100.00);
        randomInt3 = rand() % 100;
        if (randomInt3 < 50) {
            randomDouble *= -1;
        }
        else {}
        cout << "random float " << randomDouble << endl;
    }
    cout << endl;

//97 - 122
    for (int j = 0; j < 10; j++) {
        for (int i = 0; i < 31; i++) {
            randomInt1 = 97 + (rand() % (123 - 97));
            randomInt3 = rand() % 100;
            if (randomInt3 < 50) {
                randomInt1 -= 32;
            }else {}
            randomCString[i] = randomInt1;
                
        } // for
        cout << randomCString << endl;
    }
    


    cout << "Program ending " << endl;
    return 0;
}

  