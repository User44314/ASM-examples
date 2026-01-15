/*
 ============================================================================
 Name        : C_Link_list.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct llNode llNode;
typedef struct dllNode dllNode;


struct llNode{
	int theData;   //data
	llNode* nextNode;   //next
};

struct dllNode{
	llNode* prevNode;  //prev
	int theData; // data
	llNode* nextNode;  // next
};

bool isEmpty(llNode* );

bool appendNode(llNode*, int);
//void clearList(llNode*);
void printList(llNode*);
int size(llNode*);

bool deleteNodeAt(llNode**, int);
bool insertNodeAt(llNode**, int theData, int theNode); // .. data, position

int main(void) {
	puts("!!!Hello World!!!"); /* prints !!!Hello World!!! */

	llNode* theHead = NULL;
	llNode* aNode = NULL;

	if (isEmpty(theHead)){
		puts("the Link list is empty ");  //*
	}
	else {
		puts("the linked list is not empty ");
	}

	aNode = malloc(sizeof(aNode));
	theHead = aNode;

	if (isEmpty(theHead)){
		puts("the Link list is empty ");
	}
	else {
		puts("the linked list is not empty ");  //*
	}

	if(insertNodeAt(&theHead, 99, 0)){
		puts("Insert node 99 position 0 ");
	}
	else{
		puts(" node 99 not inserted");
	}
	printList(theHead);
	printf("the size of the list is %d\n", size(theHead));

	if(insertNodeAt(&theHead, 5, 0)){
		puts("Insert node 5 position 0 ");
	}
	else{
		puts(" node 5 not inserted");
	}
	printList(theHead);
	printf("the size of the list is %d\n", size(theHead));

	//test inserting between two nodes
	if(insertNodeAt(&theHead, 35, 2)){
		puts("Insert node 35 position 0 ");
	}
	else{
		puts(" node 35 not inserted");
	}
	printList(theHead);
	printf("the size of the list is %d\n", size(theHead));

	//test inserting in the end
		if(insertNodeAt(&theHead, 88, 3)){
			puts("Insert node 88 position 0 ");
		}
		else{
			puts(" node 88 not inserted");
		}
		printList(theHead);
		printf("the size of the list is %d\n", size(theHead));

	appendNode(theHead, 10);
	appendNode(theHead, 20);
	appendNode(theHead, 30);
	appendNode(theHead, 40);
	appendNode(theHead, 50);
	appendNode(theHead, 60);

	printList(theHead);
	printf("the size of the list is %d\n", size(theHead));

	//clearList(theHead);
	//test that 'n' is insert
	if(insertNodeAt(&theHead, 10, -10)){
		puts("Node with value 10 inserted in position -10 ");
	}
	else{
		puts("Node with value 10 not inserted in position -10");
	}

	//test that 'n' is negative
	if(deleteNodeAt(&theHead, -10)){
		puts("Node -10 deleted ");
	}
	else{
		puts("Node -10 not deleted");
	}



	//test that 'n' is larger than the number of nodes
	if(deleteNodeAt(&theHead, 7)){
		puts("Node 6 deleted ");
	}
	else{
		puts("Node 6 not deleted");
	}

	//test first Node is deleted
	if (deleteNodeAt(&theHead, 0)){
		puts("Node 0 deleted");
	}
	else {
		puts("Node 0 not deleted");
	}
	printList(theHead);
	printf("the size of the list is %d\n", size(theHead));

	//test empty list
		if(deleteNodeAt(&theHead, 1)){
			puts("Empty Node 1 deleted ");
		}
		else{
			puts("Empty Node 1 not deleted");
		}


	//test middle node is deleted
	if (deleteNodeAt(&theHead, 1)){
		puts("Node 1 deleted");
	}
	else {
		puts("Node 1 not deleted");
	}
	printList(theHead);
	printf("the size of the list is %d\n", size(theHead));

	//test last node is deleted
	if (deleteNodeAt(&theHead, 2)){
		puts("Node 2 deleted");
	}
	else {
		puts("Node 2 not deleted");
	}
	printList(theHead);
	printf("the size of the list is %d\n", size(theHead));
	//free(aNode);

	puts("Program is ending ");
	return EXIT_SUCCESS;
}

bool isEmpty(llNode* theHead){
	if (theHead == NULL){
		return true;
	}
	else {
		return false;
	}
}

bool appendNode(llNode* theHead, int theData){
	llNode* currentNode = theHead;
	if (theHead != NULL){
//
		while(true){
			if (currentNode->nextNode == NULL){
				break;
			}
			else{
				currentNode = currentNode->nextNode;
			}
		}
		llNode* newNode = (llNode*)malloc(sizeof(llNode));
		newNode->theData = theData;
		newNode->nextNode = NULL;
		currentNode->nextNode = newNode;
	}
	else{
		llNode* newNode = (llNode*)malloc(sizeof(llNode));
		newNode->theData = theData;
		newNode->nextNode = NULL;
		theHead = newNode;
	}

	return true;
}



void printList(llNode* theHead){
	llNode* currentNode = theHead;
	if (theHead != NULL){
		while(currentNode != NULL){
			printf("Value of the node data is %d\n", currentNode->theData);
			currentNode = currentNode->nextNode;
		}
	}
	else{
		puts("the list is empty");
	}
}


int size(llNode* theHead){

	llNode* currentNode = theHead;
	int nodeCount = 0;

	if (theHead != NULL){
		while(currentNode != NULL){
			nodeCount++;
			currentNode = currentNode->nextNode;
		}
	}
	else{}
	return nodeCount;
}


/*
void clearlist(llNode** theHead){
	llNode* currentNode = *theHead;
	llNode* tempNode = NULL;

	if (*theHead != NULL){
		while(currentNode != NULL){
			tempNode = currentNode->nextNode;
			currentNode->theData = 0;
			currentNode->nextNode = NULL;
			free(currentNode);
			currentNode = tempNode;
		}
	}
	else{}
}
*/

bool insertNodeAt(llNode** theHead, int theData, int theNode){
	llNode* currentNode = *theHead;
	llNode* tempNode = NULL;
	llNode* prevNode = NULL;
	int nodeCtr = 0;
	bool returnValue = false;

	if(theNode < 0){
		returnValue = false;
	}
	else if (*theHead != NULL){
		if(theNode == 0){
			llNode* newNode = (llNode*)malloc(sizeof(llNode));
			newNode->theData = theData;
			newNode->nextNode = currentNode;

			*theHead = newNode;
			returnValue = true;
		}else{
			prevNode = currentNode;
			while(currentNode != NULL){
				if(nodeCtr == theNode){
					tempNode = currentNode->nextNode;
					llNode* newNode = (llNode*)malloc(sizeof(llNode));
					newNode->theData = theData;
					newNode->nextNode = prevNode->nextNode;

					//currentNode->theData = 0;
					//currentNode->nextNode = NULL;
					//free(currentNode);
					prevNode->nextNode = tempNode;
					prevNode->nextNode = newNode;
					returnValue =true;
					break;
			}else{
				nodeCtr++;
				prevNode = currentNode;
				currentNode = currentNode->nextNode;
			}
			}
		}
		if ((nodeCtr-1) < theNode){
			returnValue = false;
		}
			else{}
		}
		else{
			returnValue = false;}
	return returnValue;
}


bool deleteNodeAt(llNode** theHead, int theNode) {
	llNode* currentNode = *theHead;
	llNode* tempNode = NULL;
	llNode* prevNode = NULL;
	int nodeCtr = 0;

	if(theNode < 0){
		return false;
	}
	else{}
	if (*theHead != NULL){
		if(theNode == 0){
			tempNode = currentNode->nextNode;
			currentNode->theData = 0;
			currentNode->nextNode = NULL;
			free(currentNode);
			*theHead = tempNode;
		}else{
			prevNode = currentNode;
			while(currentNode != NULL){
				if(nodeCtr == theNode){
					tempNode = currentNode->nextNode;
					currentNode->theData = 0;
					currentNode->nextNode = NULL;
					free(currentNode);
					prevNode->nextNode = tempNode;
					break;
			}else{
				nodeCtr++;
				prevNode = currentNode;
				currentNode = currentNode->nextNode;
			}
			}
		}
		if ((nodeCtr-1) < theNode){
			return false;
		}
			else{}
		}
		else{return false;}
	return true;
}
