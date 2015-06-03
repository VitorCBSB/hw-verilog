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
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[10][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 1);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

double fitness1(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[10][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 0);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

double fitness2(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[10][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 0);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

double fitness3(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  1);
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
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 0);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

double fitness4(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[10][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 1);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

double fitness5(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[10][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[11][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[12][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[13][0].to_ulong() - 0);
	soma_distancias += abs((int) individual_output[14][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[15][0].to_ulong() - 1);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

double fitness6(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -  0);
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -  1);
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -  1);
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
	soma_distancias += abs((int) individual_output[0][0].to_ulong() -
			std::bitset<8>("0111111").to_ulong());
	soma_distancias += abs((int) individual_output[1][0].to_ulong() -
			std::bitset<8>("0000110").to_ulong());
	soma_distancias += abs((int) individual_output[2][0].to_ulong() -
			std::bitset<8>("1011011").to_ulong());
	soma_distancias += abs((int) individual_output[3][0].to_ulong() -
			std::bitset<8>("1001111").to_ulong());
	soma_distancias += abs((int) individual_output[4][0].to_ulong() -
			std::bitset<8>("1100110").to_ulong());
	soma_distancias += abs((int) individual_output[5][0].to_ulong() -
			std::bitset<8>("1101101").to_ulong());
	soma_distancias += abs((int) individual_output[6][0].to_ulong() -
			std::bitset<8>("1111101").to_ulong());
	soma_distancias += abs((int) individual_output[7][0].to_ulong() -
			std::bitset<8>("0000111").to_ulong());
	soma_distancias += abs((int) individual_output[8][0].to_ulong() -
			std::bitset<8>("1111111").to_ulong());
	soma_distancias += abs((int) individual_output[9][0].to_ulong() -
			std::bitset<8>("1101111").to_ulong());
	soma_distancias += abs((int) individual_output[10][0].to_ulong() -
			std::bitset<8>("1110111").to_ulong());
	soma_distancias += abs((int) individual_output[11][0].to_ulong() -
			std::bitset<8>("1111100").to_ulong());
	soma_distancias += abs((int) individual_output[12][0].to_ulong() -
			std::bitset<8>("0111001").to_ulong());
	soma_distancias += abs((int) individual_output[13][0].to_ulong() -
			std::bitset<8>("1011110").to_ulong());
	soma_distancias += abs((int) individual_output[14][0].to_ulong() -
			std::bitset<8>("1111001").to_ulong());
	soma_distancias += abs((int) individual_output[15][0].to_ulong() -
			std::bitset<8>("1110001").to_ulong());
	if (soma_distancias != 0) {
		return 0;
	}
	return 1.0 / individuo.num_portas_utilizadas() + 1.0 / individuo.num_maior_gate_path();
}

int main_loop_genetico(Populacao& populacao, int max_geracoes) {
	int geracao = 0;
	populacao.calcular_fitness();
	while (geracao < max_geracoes
			&& populacao.melhor_individuo().fitness() != MELHOR_FITNESS) {
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
			true, // NAND
			true, // XNOR
			true, // NOR
			};
	GeneticParams genetic_params(NUM_IN, NUM_OUT, funcs, LE_NUM_IN, NUM_ROWS,
			NUM_COLS, FEED_FORWARD);

	std::mt19937 mt;
	mt.seed(time(nullptr));

	std::vector<
			std::function<double(const Cromossomo&,
					const std::vector<std::vector<std::bitset<8>>>&)>>
	funcoes_fitness = {fitness0, fitness1, fitness2, fitness3, fitness4,
			fitness5, fitness6};
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
	int soma_geracoes = 0;
	for (unsigned int i = 0; i < populacoes.size(); i++) {
		int geracao_final = main_loop_genetico(populacoes[i], max_geracoes);
		if (geracao_final == -1) {
			std::cout << -1 << std::endl;
			return 0;
		}
		soma_geracoes += geracao_final;
	}
	std::cout << soma_geracoes << std::endl;

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
			new OnePlusLambdaEvoStrategy(mt, 15, genetic_params,
								new SimulationFitnessCalculator(genetic_params,
										fitness_otimizacao)));

	std::cout << populacao_otimizacao.melhor_individuo().num_portas_utilizadas()
			<< ' '
			<< populacao_otimizacao.melhor_individuo().num_maior_gate_path()
			<< std::endl;
	main_loop_genetico(populacao_otimizacao, max_geracoes);
	std::cout << populacao_otimizacao.melhor_individuo().num_portas_utilizadas()
			<< ' '
			<< populacao_otimizacao.melhor_individuo().num_maior_gate_path()
			<< std::endl;

	CriadorArquivos::cria_arquivo_logic_e(genetic_params, "logic_e.v");
	CriadorArquivos::cria_arquivo_genetico(genetic_params, "genetico.v");
	CriadorArquivos::cria_arquivo_top_icarus(genetic_params,
			populacao_otimizacao.melhor_individuo(), "otimizado.v");

	return 0;
}
