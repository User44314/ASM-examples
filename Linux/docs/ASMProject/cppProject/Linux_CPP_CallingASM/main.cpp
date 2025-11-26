#include <iostream> 

extern "C" {long long int getAFive(void);}
extern "C" {long long int addTwo(long long, long long);}
extern "C" {long long int addArray(long long[], long long);}
//or
//extern "C" {long long int addArray(long long*, long long);}


using namespace std;

int main(int argc, char* argv[]){
	long long returnVAlue = 0;
	long long anArray[5] = {10,20,30,40,50};
	
	cout << "welcom to c++" << endl;
	
	returnVAlue = getAFive();
	cout << "return value from getAFive() is " << returnVAlue << endl;
	
	returnVAlue = addTwo(10, 20);
	cout << "return value from addTwo() is " << returnVAlue << endl;
	
	returnVAlue = addArray(anArray, 5);
	cout << "return value from addArray() is " << returnVAlue << endl;
	
	cout << "programmng ending have a nice day" << endl;
	return 0;
}
//main()
