/*
 * FPGAFitnessCalculator.h
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#ifndef FPGAFITNESSCALCULATOR_H_
#define FPGAFITNESSCALCULATOR_H_

#include "FitnessCalculator.h"
#include "rs232.h"

class FPGAFitnessCalculator: public FitnessCalculator {
public:
	FPGAFitnessCalculator(
			std::function<int(std::vector<std::vector<unsigned int>>)> fitness_calculator) :
			FitnessCalculator(fitness_calculator) {
	}

	int fitness();
};

#endif /* FPGAFITNESSCALCULATOR_H_ */
