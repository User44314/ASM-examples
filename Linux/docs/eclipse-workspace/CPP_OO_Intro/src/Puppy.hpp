/*
 * Puppy.hpp
 *
 *  Created on: Dec 30, 2025
 *      Author: linuxuser
 */

#ifndef PUPPY_HPP_
#define PUPPY_HPP_

#include <iostream>
using namespace std;

class Puppy {
public:
	Puppy();  //constructor
	virtual ~Puppy();   //destructor
	void printMyName(void);
	char name[32];
	char breed[24];
	int ageInYears;
	float weightInPounds;
};

#endif /* PUPPY_HPP_ */
