/*
 * Building.cpp
 *
 *  Created on: Jan 5, 2026
 *      Author: linuxuser
 */

#include "Building.hpp"

Building::Building() {
	// TODO Auto-generated constructor stub
	this->initAll();
}


Building::Building(double avgSF, int totalFloors) {
	this->initAll();
	//this->avgFloorSqFeet = avgSF;
	 if (this->setAvgFloorSqFeet(avgSF)){
		 if (this->setNumberOffFloors(totalFloors)){   //this->numberOffFloors = totalFloors;
			 this->classStatus = true;
		 }
		 else{
			 this->classStatus = false;
		 }
	 }
	 else{
		 this->classStatus = false;
	 }
}

const string& Building::getBuildName() const {
	return buildName;
}

bool Building::setBuildName(const string &buildName) {
	if (buildName.length() == 0){
		return false;
	}
	else{
		this->buildName = buildName;
	}
	return true;
}

Building::Building(string theName) {
	this->initAll();
	this->buildName = theName;
}

Building::Building(string theName, int numFloors) {
	this->initAll();
	if(!this->setBuildName(theName)){
		this->classStatus = false;
	}
	if (!this->setNumberOffFloors(numFloors)){
		this->classStatus = false;
	}

	//this->buildName = theName;
	//this->numberOffFloors = numFloors;
}


void Building::initAll(void){
	this->avgFloorSqFeet = 0;
	this->numberOffFloors = 0;
	this->tempDouble = 0;
	this->totalSquareFootage = 0;
	this->buildName = "Unknown";
	this->classStatus = true;
}

Building::~Building() {
	// TODO Auto-generated destructor stub
	this->numberOffFloors = 0;
	this->avgFloorSqFeet = 0;
	this->buildName = "Unknown";
}

int Building::getNumberOffFloors() const {
	return numberOffFloors;
}

bool Building::setNumberOffFloors(int numberOffFloors) {
	if(numberOffFloors < 0 || numberOffFloors > 200){
		return false;
	}
	else {
		this->numberOffFloors = numberOffFloors;
	}
	return true;
}

int Building::getTotalSquareFootage() const {
	return totalSquareFootage;
}

bool Building::setTotalSquareFootage(int totalSquareFootage) {
	if(totalSquareFootage < 0){
			return false;
		}
		else {
			this->totalSquareFootage = totalSquareFootage;
		}
		return true;
}

double Building::getAvgFloorSqFeet() const {
	return avgFloorSqFeet;
}

bool Building::setAvgFloorSqFeet(double avgFloorSqFeet) {
	if (avgFloorSqFeet < 0 || avgFloorSqFeet > 20000){
		return false;
	}
	else{
		this->avgFloorSqFeet = avgFloorSqFeet;
	}
	return true;
}

double Building::getTotalSquareFeet(void){
	return (this->avgFloorSqFeet * this->numberOffFloors);
}
