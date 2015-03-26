/*
 * IcarusFitnessCalculator.h
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#ifndef ICARUSFITNESSCALCULATOR_H_
#define ICARUSFITNESSCALCULATOR_H_

#include "FitnessCalculator.h"

class IcarusFitnessCalculator: public FitnessCalculator {
public:
	IcarusFitnessCalculator(int num_inputs, int num_outputs,
			std::function<double(const std::vector<std::vector<unsigned char>>&)> fitness_calculator) :
			FitnessCalculator(num_inputs, num_outputs, fitness_calculator) {
	}

	double fitness();
};

#endif /* ICARUSFITNESSCALCULATOR_H_ */
