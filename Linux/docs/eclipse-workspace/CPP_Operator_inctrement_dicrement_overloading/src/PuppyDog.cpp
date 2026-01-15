/*
 * PuppyDog.cpp
 *
 *  Created on: Jan 9, 2026
 *      Author: linuxuser
 */

#include "PuppyDog.hpp"

PuppyDog::PuppyDog() {
	// TODO Auto-generated constructor stub
	WeightInOunces = 0;
}

PuppyDog::~PuppyDog() {
	// TODO Auto-generated destructor stub
}

int PuppyDog::getWeightInOunces() const {
	return WeightInOunces;
}

void PuppyDog::setWeightInOunces(int weightInOunces) {
	WeightInOunces = weightInOunces;
}

PuppyDog PuppyDog::operator++(){
	this->WeightInOunces = this->WeightInOunces +1;
	return *this;
}

PuppyDog PuppyDog::operator--(){
	this->WeightInOunces = this->WeightInOunces -1;
	return *this;
}
PuppyDog PuppyDog::operator++(int){
	this->WeightInOunces = this->WeightInOunces +1;
	return *this;
}
PuppyDog PuppyDog::operator--(int){
	this->WeightInOunces = this->WeightInOunces -1;
	return *this;
}

PuppyDog PuppyDog::operator+(int rightValue){
	this->WeightInOunces = this->WeightInOunces + rightValue;
	return *this;
}

PuppyDog PuppyDog::operator-(int rightValue){
	this->WeightInOunces = this->WeightInOunces - rightValue;
	return *this;
}
