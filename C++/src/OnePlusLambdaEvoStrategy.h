/*
 * OnePlusLambdaEvoStrategy.h
 *
 *  Created on: 05/04/2015
 *      Author: vitor
 */

#ifndef ONEPLUSLAMBDAEVOSTRATEGY_H_
#define ONEPLUSLAMBDAEVOSTRATEGY_H_

#include "EvolutionaryStrategy.h"

class OnePlusLambdaEvoStrategy: public EvolutionaryStrategy {
public:
	OnePlusLambdaEvoStrategy(std::mt19937& mt, int population_size,
			GeneticParams genetic_params, FitnessCalculator* fitness_calculator) :
			EvolutionaryStrategy(mt, population_size, genetic_params,
					fitness_calculator) {
	}

	void calcular_fitness(std::vector<Cromossomo>& populacao) {
		if (populacao.size() == 1) {
			for (int i = 0; i < population_size - 1; i++) {
				Cromossomo filho(populacao[0]);
				filho.mutar();
				filho.mutar();
				filho.mutar();
				populacao.emplace_back(filho);
			}
		}
		fitness_calculator->fitness(populacao);
	}

	std::vector<Cromossomo> proxima_geracao(
			std::vector<Cromossomo>& populacao) {
		std::vector<Cromossomo> nova_populacao;
		nova_populacao.emplace_back(melhor_individuo(populacao));
		return nova_populacao;
	}

	Cromossomo& melhor_individuo(std::vector<Cromossomo>& populacao) {
		Cromossomo& melhor = populacao[0];
		for (unsigned int i = 1; i < populacao.size(); i++) {
			if (populacao[i].fitness() >= melhor.fitness()) {
				melhor = populacao[i];
			}
		}
		return melhor;
	}

	std::vector<Cromossomo> primeira_populacao() {
		std::vector<Cromossomo> nova_populacao;
		for (int i = 0; i < population_size; i++) {
			nova_populacao.emplace_back(Cromossomo(mt, genetic_params));
		}
		return nova_populacao;
	}
};

#endif /* ONEPLUSLAMBDAEVOSTRATEGY_H_ */
