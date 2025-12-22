/*
 * LinkedList.hpp
 *
 *  Created on: Dec 19, 2025
 *      Author: linuxuser
 */

#ifndef LINKEDLIST_HPP_
#define LINKEDLIST_HPP_

#include "llNode.hpp"

class LinkedList {
public:
	LinkedList();
	virtual ~LinkedList();

	bool isEmpty(void);
	bool appendNode(int);
	void printList(void);
	int size(void);
	void clearList(void);


private:
	llNode* theHead;
};

#endif /* LINKEDLIST_HPP_ */
