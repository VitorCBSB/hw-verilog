/*
 * Populacao.h
 *
 *  Created on: 13/09/2014
 *      Author: vitor
 */

#ifndef POPULACAO_H_
#define POPULACAO_H_

#include "Cromossomo.h"
#include <vector>
#include <random>

#define TAMANHO_TORNEIO 3
#define TAXA_MUTACAO 0.1

template<int Tamanho>
class Populacao {
private:
	std::mt19937& mt;
	std::vector<Cromossomo<4, 1, 4, 5, 5>> populacao;
	bool acabou = false;

public:
	Populacao(std::mt19937& mt) :
			mt(mt) {
		for (int i = 0; i < Tamanho; i++) {
			populacao.push_back(Cromossomo<4, 1, 4, 5, 5>());
		}
	}

	void proxima_geracao() {
		std::vector<Cromossomo<4, 1, 4, 5, 5>> nova_populacao;
		for (int i = 0; i < Tamanho; i++) {
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
	Cromossomo<4, 1, 4, 5, 5> selecao_torneio() {
		std::random_device rd;
		std::vector<Cromossomo<4, 1, 4, 5, 5>> torneio;

		for (int i = 0; i < TAMANHO_TORNEIO; i++) {
			auto aleatorio = rd() % Tamanho;
			torneio.push_back(populacao[aleatorio]);
		}

		int max = 0;
		int ind_max = 0;
		for (int i = 0; i < TAMANHO_TORNEIO; i++) {
			int fitness = torneio[i].fitness();
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
