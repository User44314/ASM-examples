/*
 * PuppyDog.cpp
 *
 *  Created on: Dec 16, 2025
 *      Author: linuxuser
 */

#include "PuppyDog.hpp"

PuppyDog::PuppyDog() {
	// TODO Auto-generated constructor stub
	this->AgeInYears = new int(0);
	WeightInOnces = 0;
}

PuppyDog::~PuppyDog() {
	// TODO Auto-generated destructor stub
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
