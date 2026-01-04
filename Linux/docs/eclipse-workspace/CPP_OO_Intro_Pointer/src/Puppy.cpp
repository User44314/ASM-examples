/*
 * Puppy.cpp
 *
 *  Created on: Dec 30, 2025
 *      Author: linuxuser
 */


#include "Puppy.hpp"

Puppy::Puppy() {
	// TODO Auto-generated constructor stub
	cout << "you are creating a puppy" << endl;
}

Puppy::~Puppy() {
	// TODO Auto-generated destructor stub
	cout << "You are deleting " << this->name << endl;
}


void Puppy::printMyName(void){
	cout << this->name << endl;
}

