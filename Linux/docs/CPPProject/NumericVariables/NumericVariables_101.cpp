#include <iostream>

using namespace std;

int main(){
	
	short int A_ShrotInt = 0;  /* -32768 - +32767 */
	unsigned short int A_UShortInt = 0;  // 0 - 65535
	//int A_Int = 0;   // -2147483648 to 2147483647
	//unsigned int A_Int = 0; // 0 - 4294967295
	//long int A_LongInt = 0; // -9223372036854775808 - 9223372036854775807
	//unsigned long int A_ULongInt = 0;  //0 to 184467440737095511615
	//long long int A_longLongInt = 0;   //-9223372036854775808 - 9223372036854775807
	//unsigned long long int A_ULLInt = 0; // 0 to 184467440737095511615
	
	int variableSize = 0;
	
	float mySinglePFloat = 0.00;  //single precition floating point
	double myDoubleFloat = 0.00;   // double precition floating point 
	long double myLongDoubleFloat = 0.00;
	cout << "Welcom to my variable" << endl;
	
	A_ShrotInt = -100;
	A_UShortInt = 200;
	
	variableSize = sizeof(short int);
	cout << "A short is of size " << variableSize << endl;
	
	variableSize = sizeof(unsigned long long);
	cout << "An unsingned long long is of size " << variableSize << endl;
	 
	cout << "a float is of size " << sizeof(mySinglePFloat) << endl;
	cout << "a float is of size " << sizeof(myDoubleFloat) << endl;
	cout << "a float is of size " << sizeof(myLongDoubleFloat) << endl;
	
	mySinglePFloat = 123.7566845983358638325765;
	myDoubleFloat =  123.7566845983358638325765;
	cout << "Value of my singleFloat " << mySinglePFloat << endl;
	cout << "Value of my myDoubleFloat " << myDoubleFloat << endl;
	
	return 0;
	}
