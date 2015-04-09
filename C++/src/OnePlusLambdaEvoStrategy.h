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
	OnePlusLambdaEvoStrategy(std::mt19937& mt, int population_size, int num_in,
			int num_out, int le_num_in, int r, int c, bool feed_forward,
			FitnessCalculator* fitness_calculator) :
			EvolutionaryStrategy(mt, population_size, num_in, num_out,
					le_num_in, r, c, feed_forward, fitness_calculator) {
	}

	void calcular_fitness(std::vector<Cromossomo>& populacao) {
		if (populacao.size() == 1) {
			for (int i = 0; i < population_size - 1; i++) {
				Cromossomo filho(populacao[0]);
				filho.mutar();
				populacao.emplace_back(filho);
			}
		}
		fitness_calculator->fitness(populacao, num_in, le_num_in, num_out);
	}

	std::vector<Cromossomo> proxima_geracao(
			std::vector<Cromossomo>& populacao) {
		if (primeira_populacao(populacao)) {
			return instancia_primeira_populacao();
		}
		std::vector<Cromossomo> nova_populacao;
		nova_populacao.emplace_back(melhor_individuo(populacao));
		return nova_populacao;
	}

	Cromossomo& melhor_individuo(std::vector<Cromossomo>& populacao) {
		Cromossomo& melhor = populacao[0];
		for (unsigned int i = 0; i < populacao.size(); i++) {
			if (populacao[i].fitness() >= melhor.fitness()) {
				melhor = populacao[i];
			}
		}
		return melhor;
	}

	bool primeira_populacao(const std::vector<Cromossomo>& populacao) {
		return populacao.empty();
	}

	std::vector<Cromossomo> instancia_primeira_populacao() {
		std::vector<Cromossomo> nova_populacao;
		for (int i = 0; i < population_size; i++) {
			nova_populacao.emplace_back(
					Cromossomo(mt, num_in, num_out, le_num_in, r, c, feed_forward));
		}
		return nova_populacao;
	}
};

#endif /* ONEPLUSLAMBDAEVOSTRATEGY_H_ */
