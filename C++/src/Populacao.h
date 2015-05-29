/*
 * Populacao.h
 *
 *  Created on: 13/09/2014
 *      Author: vitor
 */

#ifndef POPULACAO_H_
#define POPULACAO_H_

#include "Cromossomo.h"
#include "EvolutionaryStrategy.h"
#include <vector>
#include <random>
#include <memory>
#include <algorithm>
#include <numeric>
#include <functional>

class Populacao {
private:
	std::vector<Cromossomo> populacao;
	std::unique_ptr<EvolutionaryStrategy> evolutionary_strategy;

public:
	Populacao(EvolutionaryStrategy* evolutionary_strategy) :
			evolutionary_strategy(
					std::unique_ptr<EvolutionaryStrategy>(
							evolutionary_strategy)) {
		populacao = evolutionary_strategy->primeira_populacao();
	}

	void proxima_geracao() {
		populacao = evolutionary_strategy->proxima_geracao(populacao);
	}

	void calcular_fitness() {
		evolutionary_strategy->calcular_fitness(populacao);
	}

	double fitness_medio() {
		return std::accumulate(populacao.begin(), populacao.end(), 0.0,
				[](double a, const Cromossomo& b) {
					return a + b.fitness();
				}) / populacao.size();
	}

	Cromossomo& melhor_individuo() {
		return evolutionary_strategy->melhor_individuo(populacao);
	}
};

#endif /* POPULACAO_H_ */
