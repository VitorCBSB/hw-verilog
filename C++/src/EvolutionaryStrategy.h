/*
 * EvolutionaryStrategy.h
 *
 *  Created on: 03/04/2015
 *      Author: vitor
 */

#ifndef EVOLUTIONARYSTRATEGY_H_
#define EVOLUTIONARYSTRATEGY_H_

#include <vector>
#include <random>
#include "Cromossomo.h"
#include "FitnessCalculator.h"

class EvolutionaryStrategy {
protected:
	std::mt19937& mt;
	int population_size;
	int num_in;
	int num_out;
	int le_num_in;
	int r;
	int c;
	bool feed_forward;
	std::unique_ptr<FitnessCalculator> fitness_calculator;

public:
	EvolutionaryStrategy(std::mt19937& mt, int population_size, int num_in,
			int num_out, int le_num_in, int r, int c, bool feed_forward,
			FitnessCalculator* fitness_calculator) :
			mt(mt), population_size(population_size), num_in(num_in), num_out(
					num_out), le_num_in(le_num_in), r(r), c(c), feed_forward(
					feed_forward), fitness_calculator(fitness_calculator) {
	}
	virtual ~EvolutionaryStrategy() {
	}

	// Um vetor vazio de argumento indica a primeira população
	// a ser gerada.
	virtual std::vector<Cromossomo> proxima_geracao(
			std::vector<Cromossomo>& populacao) = 0;
	virtual void calcular_fitness(std::vector<Cromossomo>& populacao) = 0;
};

#endif /* EVOLUTIONARYSTRATEGY_H_ */
