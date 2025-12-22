#include "MyFunctionsr.h"

void clearCIN(void) {
	cin.clear();
	cin.ignore(INT_MAX, '\n');
}

double calculateHyp(const double a =5, const double b = 2) {
	double c;
	c = sqrt((a * a) + (b * b));
	return c;
}