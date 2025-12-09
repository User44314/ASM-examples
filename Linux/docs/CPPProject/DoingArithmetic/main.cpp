#include <iostream>
#include <cmath>

using namespace std;

 

int main(){
	
	int theTotalSum = 0;
	int anInt1 = 100;
	int anInt2 = 200;
	int theDiffrence = 0;
	int theProduct = 0;
	int generalInt = 0;
	float theQuatient = 0;
	 
	cout << "hello world"<< endl;
	theTotalSum = 1 + 2;
	theTotalSum = 3;
	
	theTotalSum = anInt1 + anInt2;
	cout << theTotalSum << endl;
	cout << anInt1 << endl;
	cout << anInt2 << endl;
	
	theTotalSum += 1;
	theTotalSum = theTotalSum +1;
	
	theDiffrence  = theTotalSum - 32;
	cout << "the difference is " << theDiffrence << endl;
	
	theTotalSum -= 1;
	theTotalSum = theTotalSum - 1;
	
	
	theProduct = anInt1 * anInt2;
	cout << "the product is " << theProduct << endl;
	
	theProduct *= 2;
	theProduct = theProduct * 2;
	
	theQuatient = theProduct / 3.0;
	cout << "the theQuatient is " << theQuatient << endl;
	
	theProduct /= 2;
	theProduct = theProduct / 2;
	
	
	//modulas
	generalInt  = theProduct % 3;
	cout << "the generalInt is " << generalInt << endl;
	
	//decrimenting
	generalInt--;
	cout << "the decrimenting is " << generalInt << endl;
	++generalInt;
	cout << "the decrimenting is " << generalInt << endl;
	
	//incrementing
	generalInt++;
	cout << "the incrementing is " << generalInt << endl;
	--generalInt;
	cout << "the incrementing is " << generalInt << endl;
	
	
	/*
	 * Order of presedence
	 * 1)uniry operators
	 *   - + -- ++
	 * 2)paranthise
	 * 3) multivthion / devisthion  (* and /)
	 * 4) addition and subtraction
	 * 
	 */
	 
	 //int x = 0;
	 //x = (20 * (36 + 40)) / -50;
	 
	 cout << pow(34.56, 2) << endl;
	 cout << sqrt(1194,39) << endl;
	
	cout << "program is ending" << endl;
	
	return 0;
	}
