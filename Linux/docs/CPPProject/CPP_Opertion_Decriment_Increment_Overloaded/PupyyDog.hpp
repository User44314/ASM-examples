


#ifndef PUPPYDOG_HPP_
#define PUPPYDOG_HPP_

class PupyyDog
{
public:
	PupyyDog();
	virtual ~PupyyDog();
	int getweighInOunce() const;
	void setweighInOunce(int weighInOunce);
private:
	int weighInOunce;
};

#endif 
