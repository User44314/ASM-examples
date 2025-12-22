/*
 * llNode.cpp
 *
 *  Created on: Dec 19, 2025
 *      Author: linuxuser
 */

#include "llNode.hpp"

llNode::llNode() {
	// TODO Auto-generated constructor stub

}

llNode::~llNode() {
	// TODO Auto-generated destructor stub
}

int llNode::getNodeData() const {
	return nodeData;
}

void llNode::setNodeData(int nodeData) {
	this->nodeData = nodeData;
}

llNode* llNode::getNextNode() {
	return nextNode;
}

void llNode::setNextNode(llNode *nextNode) {
	this->nextNode = nextNode;
}
