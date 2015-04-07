/*
 * RouletteEvoStrategy.h
 *
 *  Created on: 07/04/2015
 *      Author: vitor
 */

#ifndef ROULETTEEVOSTRATEGY_H_
#define ROULETTEEVOSTRATEGY_H_

#include "EvolutionaryStrategy.h"

#define TAXA_MUTACAO 0.1

class RouletteEvoStrategy: public EvolutionaryStrategy {
public:
	RouletteEvoStrategy(std::mt19937& mt, int population_size, int num_in,
			int num_out, int le_num_in, int r, int c, bool feed_forward,
			FitnessCalculator* fitness_calculator) :
			EvolutionaryStrategy(mt, population_size, num_in, num_out,
					le_num_in, r, c, feed_forward, fitness_calculator) {
	}

	std::vector<Cromossomo> proxima_geracao(
			std::vector<Cromossomo>& populacao) {
		if (primeira_populacao(populacao)) {
			return instancia_primeira_populacao();
		}
		std::vector<Cromossomo> nova_populacao;

		while (nova_populacao.size() < populacao.size()) {
			auto cromossomo1 = seleciona_individuo(populacao, soma_fitness(populacao));
			auto cromossomo2 = seleciona_individuo(populacao, soma_fitness(populacao));

			auto filhos = cromossomo1.gerar_filhos(cromossomo2);
			if (deve_mutar()) {
				filhos[0].mutar();
			}
			if (deve_mutar()) {
				filhos[1].mutar();
			}
			nova_populacao.insert(nova_populacao.end(), filhos.begin(),
					filhos.end());
		}
		return nova_populacao;
	}

	bool deve_mutar() {
		auto aleatorio = (double) rand() / (double) RAND_MAX;
		return aleatorio < TAXA_MUTACAO;
	}

	bool primeira_populacao(const std::vector<Cromossomo>& populacao) {
		return populacao.empty();
	}

	double soma_fitness(const std::vector<Cromossomo>& populacao) {
		double soma = 0.0;
		for (auto& cromossomo : populacao) {
			soma += cromossomo.fitness();
		}
		return soma;
	}

	std::vector<Cromossomo> instancia_primeira_populacao() {
		std::vector<Cromossomo> nova_populacao;
		for (int i = 0; i < population_size; i++) {
			nova_populacao.emplace_back(
					Cromossomo(mt, num_in, num_out, le_num_in, r, c,
							feed_forward));
		}
		return nova_populacao;
	}

	void calcular_fitness(std::vector<Cromossomo>& populacao) {
		fitness_calculator->fitness(populacao, num_in, le_num_in, num_out);
	}

	Cromossomo& melhor_individuo(std::vector<Cromossomo>& populacao) {
		std::sort(populacao.begin(), populacao.end(),
				[](Cromossomo& a, Cromossomo& b) {
			return a.fitness() > b.fitness();
		});
		return populacao[0];
	}

	Cromossomo seleciona_individuo(std::vector<Cromossomo>& populacao, double soma_fitness) {
		std::sort(populacao.begin(), populacao.end(),
				[](Cromossomo& a, Cromossomo& b) {
			return a.fitness() > b.fitness();
		});
		int i = 0;
		while (soma_fitness > 0) {
			soma_fitness -= populacao[i].fitness();
			i++;
		}
		return populacao[i - 1];
	}
};

#endif /* ROULETTEEVOSTRATEGY_H_ */
