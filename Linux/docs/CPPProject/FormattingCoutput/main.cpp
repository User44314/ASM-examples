#include <iostream>
#include <iomanip>
#include <climits>

using namespace std;

void clearCIN(void){
	cin.clear();
	cin.ignore(INT_MAX, '\n');
	}
 
int main(){
	
	string salesPersonname1;
	string salesPersonname2;
	string salesPersonname3;
	string salesPersonname4;
	
	double salesPersonalMonthlySales1;
	double salesPersonalMonthlySales2;
	double salesPersonalMonthlySales3;
	double salesPersonalMonthlySales4;
	cout << "hello world"<< endl;
	//#1
	cout << "plese ente full name person 1" << endl;
	getline(cin, salesPersonname1);
	cout << "Now enter the total sales from the previe month for sales person 1" << endl;
	cin >> salesPersonalMonthlySales1;
	clearCIN();
	//#2
	cout << "plese ente full name person 2" << endl;
	getline(cin, salesPersonname2);
	cout << "Now enter the total sales from the previe month for sales person 2" << endl;
	cin >> salesPersonalMonthlySales2;
	clearCIN();
	//#3
	cout << "plese ente full name person 3" << endl;
	getline(cin, salesPersonname3);
	cout << "Now enter the total sales from the previe month for sales person 3" << endl;
	cin >> salesPersonalMonthlySales3;
	clearCIN();
	//#4
	cout << "plese ente full name person 4" << endl;
	getline(cin, salesPersonname4);
	cout << "Now enter the total sales from the previe month for sales person 4" << endl;
	cin >> salesPersonalMonthlySales4;
	clearCIN();
	
	cout << salesPersonname1 << ", " << salesPersonalMonthlySales1 << endl;
	cout << salesPersonname2 << ", " << salesPersonalMonthlySales2 << endl;
	cout << salesPersonname3 << ", " << salesPersonalMonthlySales3 << endl;
	cout << salesPersonname4 << ", " << salesPersonalMonthlySales4 << endl;
	//------------------------------------------------------
	cout << endl << endl << endl;
	cout << "sales representation sales forecast report" << endl;
	cout << "==========================================" << endl; 
	cout << setw(36) << left << "sales person name";
		cout << right << setw(20) << "monthly sales";
		cout << setw(20) << "average per year" ;
		cout << setw(22) << "average per decade" << endl;
	cout << setw(36) << left << "-------------------";
		cout << right << setw(20) << "--------------";
		cout << setw(20) << "---------------" ;
		cout << setw(22) << "-----------------" << endl;
	cout << setw(36) << left << salesPersonname1 << right << setw(20) << fixed << setprecision(2)  << salesPersonalMonthlySales1;
	cout << setw(20) << (salesPersonalMonthlySales1 * 12) << setw(22) << (salesPersonalMonthlySales1 * 120) << endl;
	
	cout << setw(36) << left << salesPersonname2 << right << setw(20) << fixed << setprecision(2)  << salesPersonalMonthlySales2;
	cout << setw(20) << (salesPersonalMonthlySales2 * 12) << setw(22) << (salesPersonalMonthlySales2 * 120) << endl;
	
	cout << setw(36) << left << salesPersonname3 << right << setw(20) << fixed << setprecision(2)  << salesPersonalMonthlySales3;
	cout << setw(20) << (salesPersonalMonthlySales3 * 12) << setw(22) << (salesPersonalMonthlySales3 * 120) << endl;
	
	cout << setw(36) << left << salesPersonname4 << right << setw(20) << fixed << setprecision(2)  << salesPersonalMonthlySales4;
	cout << setw(20) << (salesPersonalMonthlySales4 * 12) << setw(22) << (salesPersonalMonthlySales4 * 120) << endl;
	
 cout << endl;
		cout << "program is ending" << endl;
	
	return 0;
	}
