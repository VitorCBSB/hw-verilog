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
	virtual ~Cell() {
	}
};

class FunctionCell: public Cell {
public:
	unsigned int function;
	std::vector<unsigned int> inputs;

public:
	FunctionCell() :
			function(0) {
	}
	FunctionCell(unsigned int function, std::vector<unsigned int> inputs) :
			Cell(), function(function), inputs(inputs) {
	}
};

class OutputCell: public Cell {
public:
	unsigned int input;

	OutputCell() :
			input(0) {
	}
	OutputCell(unsigned int input) :
			Cell(), input(input) {
	}
};

#endif /* CELL_H_ */
