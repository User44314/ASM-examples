/*
 * Building.hpp
 *
 *  Created on: Jan 5, 2026
 *      Author: linuxuser
 */

#ifndef BUILDING_HPP_
#define BUILDING_HPP_

#include <string>
using namespace std;

class Building {
public:
	Building();
	Building(double avgSF, int totalFloors);
	Building(string theName);
	Building(string theName, int numFloors);
	virtual ~Building();
	int getNumberOffFloors() const;
	bool setNumberOffFloors(int numberOffFloors);
	int getTotalSquareFootage() const;
	bool setTotalSquareFootage(int totalSquareFootage);
	double getAvgFloorSqFeet() const;
	bool setAvgFloorSqFeet(double avgFloorSqFeet);

	double getTotalSquareFeet(void);
	const string& getBuildName() const;
	bool setBuildName(const string &buildName);

	bool isClassStatus() const {
		return classStatus;
	}

private:
	int totalSquareFootage;
	int numberOffFloors;
	double avgFloorSqFeet;
	double tempDouble;
	string buildName;
	bool classStatus;

	void initAll(void);
	double stan2(void);
};

#endif /* BUILDING_HPP_ */
