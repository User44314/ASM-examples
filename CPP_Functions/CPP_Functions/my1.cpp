#include "my1.h"

void clearCIN(void) {
    cin.clear();
    cin.ignore(INT_MAX, '\n');
}

double calculateHyp(double &a, double &b) {
    double c = 0;
    c = sqrt((a * a) + (b * b));
    a = 0;
    b = 0;
    return c;
}


//& pass by reference A pointer of a varible (kind of ) is sent to the function 
// allowing the actual vaue to be accessed