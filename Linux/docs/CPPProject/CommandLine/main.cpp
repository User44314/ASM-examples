#include <iostream> 

using namespace std;

int main(int argc, char* argv[]){
	cout << "welcom to C++" << endl;
	double argument1 = 0;
	double argument2 = 0;
	
	cout << "the total arguments sent to the progrma " << argc << endl;
	
	
	//check to see if the correct number of arguments are use
	for (int i =0; i < argc; i++){
		cout << argv[i] << endl;
	}
	
	if (argc > 3 || argc < 3)
	{
		cout << "error invalid use of the command" << endl;
		cout << "format of the command is main number-one number two" << endl;
	}
	else
	{
		argument1 = atof(argv[1]);
		argument2 = atof(argv[2]);
		argument1 += argument2;
		cout << "the sum of the arguments is "  << argument1 << endl;
	}	
	cout << "programming ending have a nice day" << endl;
	return 0;
}
