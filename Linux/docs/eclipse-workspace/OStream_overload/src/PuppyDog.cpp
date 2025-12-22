/*
 * PuppyDog.cpp
 *
 *  Created on: Dec 19, 2025
 *      Author: linuxuser
 */

#include "PuppyDog.hpp"
#include <iostream>
using namespace std;

PuppyDog::PuppyDog() {
	// TODO Auto-generated constructor stub
	this->AgeInYears = new int(0);
	//cout << "creating a new puppydog" << endl;
	WeightInOnces = 0;
}

PuppyDog::~PuppyDog() {
	// TODO Auto-generated destructor stub
	//cout << "Delete a new puppydog" << endl;
	delete AgeInYears;

}

int PuppyDog::getWeightInOnces() const {
	return WeightInOnces;
}

void PuppyDog::setWeightInOnces(int weightInOnces) {
	WeightInOnces = weightInOnces;
}

PuppyDog PuppyDog::operator++(){
	this->WeightInOnces = this->WeightInOnces + 1;
	//this->WeightInOnces++;
	return *this;
}
PuppyDog PuppyDog::operator--(){
	this->WeightInOnces = this->WeightInOnces - 1;
	return *this;
}

PuppyDog PuppyDog::operator++(int){
	this->WeightInOnces = this->WeightInOnces + 1;
	return *this;
}
PuppyDog PuppyDog::operator--(int){
	this->WeightInOnces = this->WeightInOnces - 1;
	return *this;
}

PuppyDog PuppyDog::operator+(int rightValue){
	this->WeightInOnces = this->WeightInOnces + rightValue;
	return *this;
}
PuppyDog PuppyDog::operator-(int rightValue){
	this->WeightInOnces = this->WeightInOnces - rightValue;
	return *this;
}

PuppyDog PuppyDog::operator*(int rightValue){
	this->WeightInOnces = this->WeightInOnces * rightValue;
	return *this;
}
PuppyDog PuppyDog::operator/(int rightValue){
	this->WeightInOnces = this->WeightInOnces / rightValue;
	return *this;
}

PuppyDog PuppyDog::operator/(double rightValue){
	double tempDouble = this->WeightInOnces;
	tempDouble = tempDouble / rightValue;
	this->WeightInOnces = tempDouble;
	return *this;
}

PuppyDog PuppyDog::operator+(PuppyDog &rightValue){
	this->WeightInOnces = this->WeightInOnces + rightValue.WeightInOnces;
	return *this;
}

PuppyDog* PuppyDog::operator+(PuppyDog* &rightValue){
	this->WeightInOnces = this->WeightInOnces + rightValue->WeightInOnces;
	return this;
}

PuppyDog PuppyDog::operator+=(int rightValue){
	this->WeightInOnces = this->WeightInOnces + rightValue;
	return *this;
}

int PuppyDog::getAgeInYears() const {
	return *AgeInYears;
}

void PuppyDog::setAgeInYears(int ageInYears) {
	*AgeInYears = ageInYears;
}

void PuppyDog::setBreed(string breed){
	Breed = breed;
}
void PuppyDog::setName(string name){
	Name = name;
}

string PuppyDog::getBreed() const{
	return Breed;
}

string PuppyDog::getName() const{
	return Name;
}

PuppyDog::PuppyDog(const PuppyDog &rightValue){
	this->setBreed(rightValue.getBreed());
	this->setName(rightValue.getName());
	this->setWeightInOnces(rightValue.getWeightInOnces());
	this->AgeInYears = new int(rightValue.getAgeInYears());

}


PuppyDog PuppyDog::operator=(const PuppyDog &rightValue){
	this->setBreed(rightValue.getBreed());
	this->setName(rightValue.getName());
	this->setWeightInOnces(rightValue.getWeightInOnces());
	//this->AgeInYears = rightValue.AgeInYears;
	(*this->AgeInYears) = (*rightValue.AgeInYears);

	return *this;
}


ostream &operator<<(ostream &output, const PuppyDog &theDog){
	output << "Name " << theDog.getName() << ", ";
	output << "Breed " << theDog.getBreed() << ", ";
	output << "AgeInYears " << theDog.getAgeInYears() << ", ";
	output << "WeightInOnces " << theDog.getWeightInOnces();
	return output;
}

istream &operator>>(istream &input, PuppyDog &theDog){
	string inputString;
	getline(input, inputString);
	theDog.setName(inputString);


	return input;
}
