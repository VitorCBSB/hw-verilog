//============================================================================
// Name        : hw-verilog.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <random>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <functional>
#include "Cromossomo.h"
#include "Populacao.h"
#include "IcarusFitnessCalculator.h"
#include "FPGAFitnessCalculator.h"
#include "SimulationFitnessCalculator.h"
#include "TournamentEvoStrategy.h"
#include "OnePlusLambdaEvoStrategy.h"
#include "RouletteEvoStrategy.h"
#include "GeneticParams.h"

const double MELHOR_FITNESS = 20000000.0;
const unsigned int NUM_SAMPLES = 100;
const unsigned int NUM_IN = 4;
const unsigned int NUM_OUT = 1;
const unsigned int NUM_ROWS = 1;
const unsigned int NUM_COLS = 10;
const unsigned int LE_NUM_IN = 2;
const bool FEED_FORWARD = true;

double fitness0(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[10][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 0);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

double fitness1(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[10][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 1);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

double fitness2(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[10][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 1);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

double fitness_otimizacao(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  2);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  3);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  2);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  3);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  4);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  2);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  3);
	soma_distancias += abs((int) individual_output[10][0].to_ulong() - 4);
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 5);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 3);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 4);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 5);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 6);
	if (soma_distancias != 0) {
		return 0;
	}
	return 1.0;
}

int main_loop_genetico(Populacao& populacao, int max_geracoes) {
	int geracao = 0;
	populacao.calcular_fitness();
	while (geracao < max_geracoes
			&& populacao.melhor_individuo().fitness() != MELHOR_FITNESS) {
		std::cout << geracao << ": " << populacao.melhor_individuo().fitness() << std::endl;
		populacao.proxima_geracao();
		populacao.calcular_fitness();
		geracao++;
	}
	if (populacao.melhor_individuo().fitness() == MELHOR_FITNESS) {
		return geracao;
	}
	return -1;
}

int main(int argc, char* argv[]) {
	if (argc != 2) {
		std::cout << "Uso: " << argv[0] << " max_geracoes" << std::endl;
		exit(0);
	}
	int max_geracoes;
	sscanf(argv[1], "%d", &max_geracoes);

	std::vector<bool> funcs = {
			true, // AND
			true, // OR
			true, // XOR
			true, // NOT
			false, // NAND
			false, // XNOR
			false, // NOR
			};
	GeneticParams genetic_params(NUM_IN, NUM_OUT, funcs, LE_NUM_IN, NUM_ROWS,
			NUM_COLS, FEED_FORWARD);

	std::mt19937 mt;
	mt.seed(time(nullptr));

	std::vector<
			std::function<double(const Cromossomo&,
					const std::vector<std::vector<std::bitset<8>>>&)>>
	funcoes_fitness = {fitness0, fitness1, fitness2};
	std::vector<Populacao> populacoes;

	for (auto& funcao_fitness : funcoes_fitness) {
		populacoes.push_back(
				Populacao(
						new OnePlusLambdaEvoStrategy(mt, 5, genetic_params,
								new SimulationFitnessCalculator(genetic_params,
										funcao_fitness))));
	}

	// Primeira etapa
	// -- MC-CGP para achar a resposta
	for (unsigned int i = 0; i < populacoes.size(); i++) {
		if (main_loop_genetico(populacoes[i], max_geracoes) == -1) {
			std::cout << -1 << std::endl;
			return 0;
		}
	}

	// Segunda etapa:
	// -- CGP para otimizacao
	genetic_params.num_out *= populacoes.size();
	genetic_params.r *= populacoes.size();

	std::vector<Cromossomo> nova_populacao;
	std::vector<Cromossomo> melhores_individuos;

	for (auto& populacao_mccgp : populacoes) {
		melhores_individuos.push_back(populacao_mccgp.melhor_individuo());
	}
	nova_populacao.push_back(Cromossomo(mt, genetic_params, melhores_individuos));

	Populacao populacao_otimizacao(nova_populacao,
			new OnePlusLambdaEvoStrategy(mt, 5, genetic_params,
								new SimulationFitnessCalculator(genetic_params,
										fitness_otimizacao)));

	std::cout << main_loop_genetico(populacao_otimizacao, max_geracoes) << std::endl;

	return 0;
}
