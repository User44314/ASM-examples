/*
 * PuppyDog.hpp
 *
 *  Created on: Dec 18, 2025
 *      Author: linuxuser
 */

#ifndef PUPPYDOG_HPP_
#define PUPPYDOG_HPP_

#include <string>
using namespace std;

class PuppyDog {
public:
	PuppyDog();
	virtual ~PuppyDog();
	int getWeightInOnces() const;
	void setWeightInOnces(int weightInOnces);

	string getBreed() const;
	void setBreed(string breed);
	string getName() const;
	void setName(string name);

	int getAgeInYears() const;
	void setAgeInYears(int ageInYears);

	//overloading the ++Puppydog (prefix)
	PuppyDog operator++();
	PuppyDog operator--();

	//overloading the Puppydog++ (postfix)
	PuppyDog operator++(int);
	PuppyDog operator--(int);

	PuppyDog operator+(int rightValue);
	PuppyDog operator+(PuppyDog &rightValue);
	PuppyDog* operator+(PuppyDog* &rightValue);
	PuppyDog operator-(int rightValue);
	PuppyDog operator*(int rightValue);
	PuppyDog operator/(int rightValue);
	PuppyDog operator/(double rightValue);
	PuppyDog operator+=(int rightValue);

	//copy constructor
	PuppyDog(const PuppyDog &rightValue);
	PuppyDog operator=(const PuppyDog &rightValue);


private:
	int WeightInOnces;
	string Name;
	string Breed;
	int* AgeInYears;
};

#endif /* PUPPYDOG_HPP_ */
