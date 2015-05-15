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
#include <algorithm>

#define TAMANHO_TORNEIO 2
#define TAXA_MUTACAO 0.1

class TournamentEvoStrategy: public EvolutionaryStrategy {
public:
	TournamentEvoStrategy(std::mt19937& mt, int population_size,
			GeneticParams genetic_params, FitnessCalculator* fitness_calculator) :
			EvolutionaryStrategy(mt, population_size, genetic_params,
					fitness_calculator) {
	}

	void calcular_fitness(std::vector<Cromossomo>& populacao) {
		fitness_calculator->fitness(populacao);
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
				filhos[0].mutar();
				filhos[0].mutar();
			}
			if (deve_mutar()) {
				filhos[1].mutar();
				filhos[1].mutar();
				filhos[1].mutar();
			}
			nova_populacao.insert(nova_populacao.end(), filhos.begin(),
					filhos.end());
		}
		return nova_populacao;
	}

private:
	Cromossomo selecao_torneio(const std::vector<Cromossomo>& populacao) {
		auto temp_populacao = populacao;
		std::vector<Cromossomo> torneio;
		for (int i = 0; i < TAMANHO_TORNEIO; i++) {
			auto aleatorio = rand() % temp_populacao.size();
			torneio.push_back(temp_populacao[aleatorio]);
			temp_populacao.erase(temp_populacao.begin() + aleatorio);
		}

		return *std::max_element(torneio.begin(), torneio.end());
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
					Cromossomo(mt, genetic_params));
		}
		return nova_populacao;
	}

	Cromossomo& melhor_individuo(std::vector<Cromossomo>& populacao) {
		return *std::max_element(populacao.begin(), populacao.end());
	}
};

#endif /* TOURNAMENTEVOSTRATEGY_H_ */
