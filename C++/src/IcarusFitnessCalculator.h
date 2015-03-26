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
	IcarusFitnessCalculator(
			std::function<int(std::vector<std::vector<unsigned int>>)> fitness_calculator)
			: FitnessCalculator(fitness_calculator) {
			}

	int fitness();
};



#endif /* ICARUSFITNESSCALCULATOR_H_ */
