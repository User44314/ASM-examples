//============================================================================
// Name        : CPP_Class_Members.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "Building.hpp"


using namespace std;

int main() {

	Building building101;  //static
	Building building201(20000, 20);
	Building building202("research building 202");
	Building building203("Manufacturing building 203", 6);

	if (building203.isClassStatus()){
		cout << "Building203 was created successfully" << endl;
	}
	else{
		cout << "Building203 was not created successfully" << endl;
	}

	//Building* building201 = nullptr;
	//building201 = new Building();
	//delete building201;

	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!

	Building building1;
	int userIntreger = 0;
	double userDouble = 0;

	while(true){
		int userIntreger;
			cout << "Please enter the number of floors in our building ";
			cin >> userIntreger;

			if (building1.setNumberOffFloors(userIntreger)){
				cout << "Number of floors has been set correctly" << endl;
				cout << building1.getNumberOffFloors() << endl;
				break;
			}
			else {
				cout << "Number of floors has not been set" << endl;
			}
	}


	while(true){
			int userDouble;
				cout << "Please enter the square of each floors";
				cin >> userDouble;

				if (building1.setAvgFloorSqFeet(userDouble)){
					cout << "Number of floors has been set correctly" << endl;
					cout << building1.getAvgFloorSqFeet() << endl;
					break;
				}
				else {
					cout << "Average square footage has not been set try again" << endl;
				}
		}

	building1.setAvgFloorSqFeet(1000);
	cout << "total square feet for your building " << building1.getTotalSquareFeet() << endl;

	cout << "Programming is ending have a nice day" << endl;
	return 0;
}
