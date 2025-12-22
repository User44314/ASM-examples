/*
 * llNode.hpp
 *
 *  Created on: Dec 19, 2025
 *      Author: linuxuser
 */

#ifndef LLNODE_HPP_
#define LLNODE_HPP_

class llNode {
public:
	llNode();
	virtual ~llNode();
	int getNodeData() const;
	void setNodeData(int nodeData);
	llNode* getNextNode();
	void setNextNode(llNode* nextNode) ;

private:
	int nodeData;
	llNode* nextNode;
};

#endif /* LLNODE_HPP_ */
