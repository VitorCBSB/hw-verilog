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
	IcarusFitnessCalculator(int num_inputs,
			std::function<int(const std::vector<std::vector<unsigned char>>&)> fitness_calculator) :
			FitnessCalculator(num_inputs, fitness_calculator) {
	}

	int fitness();
};

#endif /* ICARUSFITNESSCALCULATOR_H_ */
