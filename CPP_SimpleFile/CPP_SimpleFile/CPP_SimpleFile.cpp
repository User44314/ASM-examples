// CPP_SimpleFile.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <fstream>  //file add system
#include <string> 
#include <climits>

using namespace std;
void clearCIN(void) {
    cin.clear();
    cin.ignore(INT_MAX, '\n');
}

int main()
{
    std::cout << "Hello World!\n";
    ofstream outputFile;  //open file
    ifstream inputFile;
    string userString;
    int inputInteger = 0 ;
    bool firstline = true;

    // **** write to the file ****
    //outputFile.open("someString.txt");
    //if (outputFile.fail()) {
    //    cout << "an error occured creating your somestring.txt file" << endl;
    //}
    //else {
    //    cout << "file created succesuful"  << endl;
    //}

    //while (userString != "end") {
    //    cout << "Please enter a string to save file (-999 to ext)";
    //    std::getline(cin, userString);
    //    if (userString == "-999") {
    //        break;
    //    }
    //    else {
    //        if (firstline == true) {
    //            outputFile << userString;
    //            firstline = false;
    //        }
    //        else {
    //            outputFile << endl;
    //            outputFile << userString;
    //        }
    //    }  
    //}

    //outputFile.close();


    //**** readi fro file ****
    //inputFile.open("someString1.txt");
    //if (inputFile.fail()) {
    //    cout << "error opening the input file " << endl;
    //}
    //else {
    //    //getline(inputFile, userString);
    //    while (!inputFile.eof()) {
    //        getline(inputFile, userString);
    //        cout << userString << endl;
    //        
    //    }
    //    inputFile.close();
    //}

    firstline = true;
    outputFile.open("someNumbers.txt");
    if (outputFile.fail()) {
        cout << "error opening file " << endl;
    }
    else {
        while (inputInteger != -999) {
            cout << "Plese enter an integer (-999 to exit)" << endl;
            cin >> inputInteger;
            clearCIN();
            if (inputInteger == -999) {
                break;
            }
            else if (firstline == true)
            {
                outputFile << inputInteger;
                firstline = false;
            }
            else {
                outputFile << endl;
                outputFile << inputInteger;
            }
            //else {
           //     outputFile << inputInteger << endl;
            //}
        }
    }

    outputFile.close();




    inputFile.open("someNumbers.txt");
    if (inputFile.fail()) {
        cout << "error opening file " << endl;
    }
    else {
        //inputFile >> inputInteger;
        while (!inputFile.eof()) {
            inputFile >> inputInteger;
            cout << inputInteger << endl;
            
        }
        inputFile.close();
    }

    outputFile.close();
    cout << "Program is ending " << endl;
    return 0;
}

