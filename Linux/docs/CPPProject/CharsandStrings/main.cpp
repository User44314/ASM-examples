#include <iostream> 

using namespace std;

int main(){
	
	char middleIniale = 'A';
	string fullName = "ooo oooooo";
	cout << "hello world" << endl;
	
	cout << middleIniale << endl;
	
	middleIniale = 'J';
	cout << middleIniale << endl;
	
	cout << fullName << endl;
	fullName = "hhh hhhhh";
	
	cout << fullName << endl;
	
	cout << sizeof(middleIniale) << endl;
	cout << sizeof(fullName) << endl;
	cout << fullName.size() << endl;  //real size
	cout << "programming ending have a nice day" << endl;
	return 0;
}
