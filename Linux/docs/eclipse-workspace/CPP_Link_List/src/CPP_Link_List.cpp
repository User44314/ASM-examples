//============================================================================
// Name        : CPP_Link_List.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "LinkedList.hpp"
#include "llNode.hpp"

using namespace std;

int main() {
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!

	LinkedList myList;


	if (myList.isEmpty()){
		cout << "the list is empty" << endl;
	}
	else {
		cout << "the list is not empty " << endl;
	}


	myList.appendNode(10);
	myList.appendNode(20);
	myList.appendNode(30);
	myList.appendNode(40);
	myList.appendNode(50);


	cout << "the size of the list is " << myList.size() << endl;
	myList.printList();
	//myList.clearList();
	cout << "Program is ending have a nice day" << endl;
	return 0;
}
