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

class Populacao {
private:
	std::vector<Cromossomo> populacao;
	std::unique_ptr<EvolutionaryStrategy> evolutionary_strategy;

public:
	Populacao(EvolutionaryStrategy* evolutionary_strategy) :
			evolutionary_strategy(
					std::unique_ptr<EvolutionaryStrategy>(
							evolutionary_strategy)) {
		auto temp_populacao = std::vector<Cromossomo>();
		populacao = evolutionary_strategy->proxima_geracao(temp_populacao);
	}

	void proxima_geracao() {
		populacao = evolutionary_strategy->proxima_geracao(populacao);
	}

	Cromossomo& melhor_individuo() {
		std::sort(populacao.begin(), populacao.end(),
				[](Cromossomo& a, Cromossomo& b) {
					return a.fitness() > b.fitness();
				});
		return populacao[0];
	}
};

#endif /* POPULACAO_H_ */
