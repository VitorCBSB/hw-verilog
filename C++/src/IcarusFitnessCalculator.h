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
	IcarusFitnessCalculator(
			std::function<double(const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			FitnessCalculator(fitness_calculator) {
	}

	void fitness(std::vector<Cromossomo>& populacao, int num_inputs, int le_num_inputs, int num_outputs);
	std::unique_ptr<FitnessCalculator> clone() {
		return std::unique_ptr<FitnessCalculator>(new IcarusFitnessCalculator(*this));
	}

private:
	void gerar_arquivo_top(int num_inputs, int num_outputs);
	std::vector<std::vector<std::bitset<8>>> parse_output(FILE* simulador, int num_inputs);
};

#endif /* ICARUSFITNESSCALCULATOR_H_ */
