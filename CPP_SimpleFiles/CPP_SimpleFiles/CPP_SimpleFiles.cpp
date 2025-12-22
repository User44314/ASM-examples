// CPP_SimpleFiles.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <string>
#include <fstream>
#include <climits>
#include <sstream>

using namespace std;

void clearCIN(void) {
    cin.clear();
    cin.ignore(INT_MAX, '\n');
}


int main()
{
    ofstream outputFile;
    ifstream inputFile;
    char userEnter = ' ';
    bool firstLine = true;
    string userName;
    int ageInmonth = 0;
    double yearlySalary = 0;
    string customeRecorder;
    string tempString;

    outputFile.open("custerms.tsv");
    if (outputFile.fail()) {
        cout << "error the output file could not be opened " << endl;
    }
    else {
        while (userName != "-999" ) {
            cout << "enter a custerms name (-999 to exit)" << endl;
            std::getline(cin, userName);
            if (userName == "-999") {
                break;
            }
            else { 
                cout << "now enter their age in month ";
                cin >> ageInmonth;
                clearCIN();
                cout << "lastely enter ther year salary ";
                cin >> yearlySalary;
                clearCIN();
                if (!firstLine) {
                    outputFile << endl;
                }
                else {}
                outputFile << userName << '\t' << ageInmonth << '\t' << yearlySalary << endl;
                firstLine = false; 
            }
        }
        outputFile.close();
    }


    inputFile.open("custerms.tsv");
    if (inputFile.fail()) {
        cout << "error the input file could not be opened" << endl;
    }
    else {
        while (!inputFile.eof()) {
            std::getline(inputFile, customeRecorder);
            stringstream strStream(customeRecorder);
            //std::getline(strStream, userName, ',');
            std::getline(strStream, userName, '\t');
            //getline(strStream, tempString, ',');
            std::getline(strStream, tempString, '\t');
            ageInmonth = stoi(tempString);
            //getline(strStream, tempString, ',');
            std::getline(strStream, tempString, '\t');
            yearlySalary = stof(tempString);


            // inputFile >> userName;
            //inputFile >> ageInmonth;
            //inputFile >> yearlySalary;
            cout << userName << " " << ageInmonth << " " << yearlySalary << endl;
            cout << "press enter to continue " << endl;
            cin.get(userEnter);
        }
        inputFile.close();
    }

    cout << "programm ending have a nice day " << endl;
    return 0;
}

 