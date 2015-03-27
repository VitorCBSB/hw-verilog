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
#include <bitset>
#include <memory>

class FitnessCalculator {
protected:
	int num_inputs;
	int num_outputs;
	std::function<double(std::vector<std::vector<std::bitset<8>>>)>fitness_calculator;

public:
	FitnessCalculator(int num_inputs, int num_outputs,
			std::function<double(const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			num_inputs(num_inputs), num_outputs(num_outputs), fitness_calculator(
					fitness_calculator) {
	}
	virtual ~FitnessCalculator() {
	}

	virtual double fitness() = 0;
	virtual std::unique_ptr<FitnessCalculator> clone() = 0;
};

#endif /* FITNESSCALCULATOR_H_ */