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
	std::function<int(std::vector<std::vector<unsigned int>>)> fitness_calculator;

public:
	FitnessCalculator(
			std::function<int(std::vector<std::vector<unsigned int>>)> fitness_calculator) :
			fitness_calculator(fitness_calculator) {
	}
	virtual ~FitnessCalculator() {
	}

	virtual int fitness() = 0;
};

#endif /* FITNESSCALCULATOR_H_ */
