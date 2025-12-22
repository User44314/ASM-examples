/*
 * LinkedList.cpp
 *
 *  Created on: Dec 19, 2025
 *      Author: linuxuser
 */

#include "LinkedList.hpp"
#include <iostream>
#include <stdio.h>

using namespace std;

LinkedList::LinkedList() {
	// TODO Auto-generated constructor stub
	this->theHead = nullptr;
}

LinkedList::~LinkedList() {
	// TODO Auto-generated destructor stub
}

bool LinkedList::isEmpty(void){
	if (this->theHead == nullptr){
		return true;
	}
	else{
		return false;
	}
}


bool LinkedList::appendNode(int theData){
	llNode* currentNode = this->theHead;

	if (this->theHead != nullptr){
		while (true) {
			if (currentNode->getNextNode() == nullptr){
				break;
			}
			else{
				currentNode = currentNode->getNextNode();
			}
		}
		llNode* newNode = new llNode;
		newNode->setNodeData(theData);
		llNode* temp_ptr = nullptr;
		newNode->setNextNode(temp_ptr);
		currentNode->setNextNode(newNode);

	}
	else{
		llNode* newNode = (llNode*)malloc (sizeof(llNode));
		newNode->setNodeData(theData);
		llNode* temp_ptr = nullptr;
		newNode->setNextNode(temp_ptr);
		this->theHead = newNode;
	}
	return true;
}

void LinkedList::printList(void){
	llNode* currentNode = this->theHead;

	if(theHead != nullptr){
		while(currentNode != nullptr){
			printf("value of the node data %d\n", currentNode->getNodeData());
				currentNode = currentNode->getNextNode();
		}
	}
	else {
		puts("the list is empty ");
	}
}

int LinkedList::size(){
	llNode* currentNode = this->theHead;
	int nodeCount = 0;
	if (theHead != nullptr){
		while(currentNode != nullptr){
			nodeCount++;
			currentNode = currentNode->getNextNode();
		}
	}
	else{}
	return nodeCount;
}


void LinkedList::clearList (){
	llNode* currentNode = this->theHead;
	llNode* tempNode = nullptr;

	if (this->theHead != nullptr){
		while (currentNode != nullptr){
			tempNode = currentNode->getNextNode();
			currentNode->setNodeData(0);
			llNode* temp_ptr = nullptr;
			currentNode->setNextNode(temp_ptr);
			delete currentNode;
			currentNode = tempNode;
		}
	}
	else{}
}
