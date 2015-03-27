/*
 * Populacao.h
 *
 *  Created on: 13/09/2014
 *      Author: vitor
 */

#ifndef POPULACAO_H_
#define POPULACAO_H_

#include "Cromossomo.h"
#include "FitnessCalculator.h"
#include <vector>
#include <random>
#include <memory>

#define TAMANHO_TORNEIO 3
#define TAXA_MUTACAO 0.1

template<unsigned int Tamanho, unsigned int NumIn, unsigned int NumOut,
		unsigned int LENumIn, unsigned int R, unsigned int C>
class Populacao {
private:
	std::mt19937& mt;
	std::vector<Cromossomo<NumIn, NumOut, LENumIn, R, C>> populacao;
	std::unique_ptr<FitnessCalculator> fitness_calculator;
	bool acabou = false;

public:
	Populacao(std::mt19937& mt, bool feed_forward,
			FitnessCalculator* fitness_calculator) :
			mt(mt), fitness_calculator(
					std::unique_ptr<FitnessCalculator>(fitness_calculator)) {
		for (unsigned int i = 0; i < Tamanho; i++) {
			populacao.push_back(
					Cromossomo<NumIn, NumOut, LENumIn, R, C>(mt,
							fitness_calculator->clone(), feed_forward));
		}
	}

	void proxima_geracao() {
		std::vector<Cromossomo<NumIn, NumOut, LENumIn, R, C>> nova_populacao;
		while (nova_populacao.size() < Tamanho) {
			auto cromossomo1 = selecao_torneio();
			auto cromossomo2 = selecao_torneio();

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
		populacao = nova_populacao;
	}

private:
	Cromossomo<NumIn, NumOut, LENumIn, R, C> selecao_torneio() {
		std::vector<Cromossomo<NumIn, NumOut, LENumIn, R, C>> torneio;

		for (int i = 0; i < TAMANHO_TORNEIO; i++) {
			auto aleatorio = mt() % Tamanho;
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
		auto aleatorio = (double) mt() / (double) mt.max();
		return aleatorio < TAXA_MUTACAO;
	}
};

#endif /* POPULACAO_H_ */
