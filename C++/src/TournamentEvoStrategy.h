/*
 * TournamentEvoStrategy.h
 *
 *  Created on: 03/04/2015
 *      Author: vitor
 */

#ifndef TOURNAMENTEVOSTRATEGY_H_
#define TOURNAMENTEVOSTRATEGY_H_

#include "EvolutionaryStrategy.h"
#include <stdlib.h>

#define TAMANHO_TORNEIO 2
#define TAXA_MUTACAO 0.1

class TournamentEvoStrategy: public EvolutionaryStrategy {
public:
	TournamentEvoStrategy(std::mt19937& mt, int population_size, int num_in, int num_out,
			int le_num_in, int r, int c, bool feed_forward,
			FitnessCalculator* fitness_calculator) :
			EvolutionaryStrategy(mt, population_size, num_in, num_out, le_num_in, r, c,
					feed_forward, fitness_calculator) {
	}

	void calcular_fitness(std::vector<Cromossomo>& populacao) {
		fitness_calculator->fitness(populacao, num_in, le_num_in, num_out);
	}

	std::vector<Cromossomo> proxima_geracao(
			std::vector<Cromossomo>& populacao) {
		if (primeira_populacao(populacao)) {
			return instancia_primeira_populacao();
		}
		std::vector<Cromossomo> nova_populacao;
		while (nova_populacao.size() < populacao.size()) {
			auto cromossomo1 = selecao_torneio(populacao);
			auto cromossomo2 = selecao_torneio(populacao);

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

private:
	Cromossomo selecao_torneio(const std::vector<Cromossomo>& populacao) {
		std::vector<Cromossomo> torneio;

		for (int i = 0; i < TAMANHO_TORNEIO; i++) {
			auto aleatorio = rand() % populacao.size();
			torneio.push_back(populacao[aleatorio]);
		}

		double max = 0;
		int ind_max = 0;
		for (int i = 0; i < TAMANHO_TORNEIO; i++) {
			double fitness = torneio[i].fitness();
			if (fitness > max) {
				max = fitness;
				ind_max = i;
			}
		}

		return torneio[ind_max];
	}

	bool deve_mutar() {
		auto aleatorio = (double) rand() / (double) RAND_MAX;
		return aleatorio < TAXA_MUTACAO;
	}

	bool primeira_populacao(const std::vector<Cromossomo>& populacao) {
		return populacao.empty();
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

	Cromossomo& melhor_individuo(std::vector<Cromossomo>& populacao) {
		std::sort(populacao.begin(), populacao.end(),
				[](const Cromossomo& a, const Cromossomo& b) {
					return a.fitness() > b.fitness();
				});
		return populacao[0];
	}
};

#endif /* TOURNAMENTEVOSTRATEGY_H_ */
