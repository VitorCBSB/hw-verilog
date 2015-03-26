/*
 * IcarusFitnessCalculator.h
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#ifndef ICARUSFITNESSCALCULATOR_H_
#define ICARUSFITNESSCALCULATOR_H_

#include "FitnessCalculator.h"
#include <iostream>
#include <fstream>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

class IcarusFitnessCalculator: public FitnessCalculator {
public:
	IcarusFitnessCalculator(int num_inputs, int num_outputs,
			std::function<double(const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			FitnessCalculator(num_inputs, num_outputs, fitness_calculator) {
	}

	double fitness();
	std::unique_ptr<FitnessCalculator> clone() {
		return std::unique_ptr<FitnessCalculator>(new IcarusFitnessCalculator(*this));
	}

private:
	void gerar_arquivo_top();
};

#endif /* ICARUSFITNESSCALCULATOR_H_ */
