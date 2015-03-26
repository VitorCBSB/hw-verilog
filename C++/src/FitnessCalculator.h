/*
 * FitnessCalculator.h
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#ifndef FITNESSCALCULATOR_H_
#define FITNESSCALCULATOR_H_

#include <functional>
#include <vector>

class FitnessCalculator {
protected:
	int num_inputs;
	std::function<int(std::vector<std::vector<unsigned char>>)> fitness_calculator;

public:
	FitnessCalculator(int num_inputs,
			std::function<int(const std::vector<std::vector<unsigned char>>&)> fitness_calculator) :
			num_inputs(num_inputs), fitness_calculator(fitness_calculator) {
	}
	virtual ~FitnessCalculator() {
	}

	virtual int fitness() = 0;
};

#endif /* FITNESSCALCULATOR_H_ */
