/*
 * FitnessCalculator.h
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#ifndef FITNESSCALCULATOR_H_
#define FITNESSCALCULATOR_H_

#include "Cromossomo.h"
#include "GeneticParams.h"
#include "Utils.h"
#include <functional>
#include <string>
#include <vector>
#include <bitset>
#include <memory>
#include <iostream>
#include <fstream>
#include <math.h>

class FitnessCalculator {
protected:
	GeneticParams genetic_params;
	std::function<double(const Cromossomo&,
			const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator;

public:
	FitnessCalculator(GeneticParams genetic_params,
			std::function<double(const Cromossomo&,
					const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			 genetic_params(genetic_params), fitness_calculator(
					fitness_calculator) {
	}
	virtual ~FitnessCalculator() {
	}

	virtual void fitness(std::vector<Cromossomo>& populacao) = 0;
	virtual std::unique_ptr<FitnessCalculator> clone() = 0;
};

#endif /* FITNESSCALCULATOR_H_ */
