#include <iostream>
using namespace std;

int main(){
	 
	int* intPtr = nullptr;
	int* intArrayPtr = nullptr;
	int arraySize = 0;
	
	cout << "hello world" << endl;
	
	 //intPtr = new int();
	intPtr = (int*)malloc(sizeof(int));
	free(intPtr);
	 
	cout << "how big of an array would you like  " << endl;
	cin>> arraySize;
	intArrayPtr = new int[arraySize];
	delete [] intArrayPtr;
	
	intArrayPtr = (int*)malloc(sizeof(int)*arraySize );
	free(intArrayPtr);
	
	cout << "the programm is ending have a nice day";
	return 0;
	}
