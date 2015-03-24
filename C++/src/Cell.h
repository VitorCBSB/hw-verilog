/*
 * Cell.h
 *
 *  Created on: 24/03/2015
 *      Author: Vitor
 */

#ifndef CELL_H_
#define CELL_H_

#include <vector>
#include <memory>

class Cell {
public:
	Cell();
	virtual ~Cell();
};

class FunctionCell : public Cell {
public:
	int function;
	std::vector<int> inputs;

public:
	FunctionCell(int function, std::vector<int> inputs) : function(function), inputs(inputs) {
	}
};

class OutputCell : public Cell {
public:
	int output;

	OutputCell(int output) : output(output) {
	}
};

#endif /* CELL_H_ */
