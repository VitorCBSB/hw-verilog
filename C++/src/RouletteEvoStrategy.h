/*
 * RouletteEvoStrategy.h
 *
 *  Created on: 07/04/2015
 *      Author: vitor
 */

#ifndef ROULETTEEVOSTRATEGY_H_
#define ROULETTEEVOSTRATEGY_H_

#include "EvolutionaryStrategy.h"

#define TAXA_MUTACAO_ 0.5

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
		nova_populacao.emplace_back(melhor_individuo(populacao));
		nova_populacao.emplace_back(populacao[1]);
		while (nova_populacao.size() < populacao.size()) {
			std::vector<Cromossomo> temp_populacao = populacao;
			auto index1 = seleciona_individuo(temp_populacao,
					soma_fitness(temp_populacao));
			auto cromossomo1 = temp_populacao[index1];
			temp_populacao.erase(temp_populacao.begin() + index1);
			auto index2 = seleciona_individuo(temp_populacao,
					soma_fitness(temp_populacao));
			auto cromossomo2 = temp_populacao[index2];

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
		return aleatorio < TAXA_MUTACAO_;
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
		std::sort(populacao.begin(), populacao.end(), std::greater<Cromossomo>());
		return populacao[0];
	}

	int seleciona_individuo(std::vector<Cromossomo>& populacao,
			double soma_fitness) {
		unsigned int i = 0;
		double selecao = fmod(rand(), soma_fitness);
		while (selecao > 0) {
			selecao -= populacao[i].fitness();
			i++;
		}
		if (i >= populacao.size()) {
			i = populacao.size();
		}
		return i - 1;
	}
};

#endif /* ROULETTEEVOSTRATEGY_H_ */
