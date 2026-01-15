/*
 * PuppyDog.hpp
 *
 *  Created on: Jan 9, 2026
 *      Author: linuxuser
 */

#ifndef PUPPYDOG_HPP_
#define PUPPYDOG_HPP_

class PuppyDog {
public:
	PuppyDog();
	virtual ~PuppyDog();
	int getWeightInOunces() const;
	void setWeightInOunces(int weightInOunces);

	//overloading (Prefix)
	PuppyDog operator++();
	PuppyDog operator--();
	//overloading (postprefix)
	PuppyDog operator++(int);
	PuppyDog operator--(int);

	PuppyDog operator+(int rightValue);
	PuppyDog operator-(int rightValue);

private:
	int WeightInOunces;
};

#endif /* PUPPYDOG_HPP_ */
