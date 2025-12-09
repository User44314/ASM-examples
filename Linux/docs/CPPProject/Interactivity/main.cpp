#include <iostream>
#include <cmath>
#include <iomanip>
#include <climits>

using namespace std;

void clearCIN(void)
{
	//clear the CIN buffer
	// only do it for numeric CIN input
	cin.clear();
	cin.ignore(INT_MAX, '\n');
	}

int main(){
	
	string userName;
	int userAge;
	float userWeightInPounds;
	char userMiddleInitial;
	
	cout << "hello world"<< endl;
	cout << "plese enter your name " << endl;
	//cin >> userName;
	getline(cin, userName);
	cout << "Plese enter your middle inital ";
	cin.get(userMiddleInitial);
	cout << "your middle inital is " << userMiddleInitial << endl;
	cout << "hello there " << userName << endl;
	
	cout << "plese enter your age ";
	cin >> userAge;
	clearCIN();
	cout << "you have been alive for " << (userAge * 12) << "month" << endl;
	
	
	
	cout << "plese enter your wegight in pouds ";
	cin >> userWeightInPounds;
	clearCIN();
	cout << "your weight is " << fixed << setprecision(2) << userWeightInPounds << endl;
	
	
	
	cout << "program is ending" << endl;
	
	return 0;
	}
