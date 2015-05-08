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
#include "GeneticParams.h"

class EvolutionaryStrategy {
protected:
	std::mt19937& mt;
	int population_size;
	GeneticParams genetic_params;
	std::unique_ptr<FitnessCalculator> fitness_calculator;

public:
	EvolutionaryStrategy(std::mt19937& mt, int population_size, GeneticParams genetic_params,
			FitnessCalculator* fitness_calculator) :
			mt(mt), population_size(population_size), genetic_params(genetic_params),
					 fitness_calculator(fitness_calculator) {
	}
	virtual ~EvolutionaryStrategy() {
	}

	// Um vetor vazio de argumento indica a primeira população
	// a ser gerada.
	virtual std::vector<Cromossomo> proxima_geracao(
			std::vector<Cromossomo>& populacao) = 0;
	virtual void calcular_fitness(std::vector<Cromossomo>& populacao) = 0;
	virtual Cromossomo& melhor_individuo(std::vector<Cromossomo>& populacao) = 0;
};

#endif /* EVOLUTIONARYSTRATEGY_H_ */
