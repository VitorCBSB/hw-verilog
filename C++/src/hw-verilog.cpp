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

int soma_distancias_decoder7(bool parcial, int bit,
		const std::vector<std::vector<std::bitset<8>>>& output_a_analisar) {
	int soma_distancias = 0;
	std::vector<std::bitset<8>> respostas = {
			std::bitset<8>("0111111"),
			std::bitset<8>("0000110"),
			std::bitset<8>("1011011"),
			std::bitset<8>("1001111"),
			std::bitset<8>("1100110"),
			std::bitset<8>("1101101"),
			std::bitset<8>("1111101"),
			std::bitset<8>("0000111"),
			std::bitset<8>("1111111"),
			std::bitset<8>("1101111"),
			std::bitset<8>("1110111"),
			std::bitset<8>("1111100"),
			std::bitset<8>("0111001"),
			std::bitset<8>("1011110"),
			std::bitset<8>("1111001"),
			std::bitset<8>("1110001")
	};
	for (unsigned int i = 0; i < respostas.size(); i++) {
		soma_distancias += abs((int) output_a_analisar[i][0].to_ulong() -
				(parcial ? respostas[i][bit] : respostas[i].to_ulong()));
	}
	return soma_distancias;
}

double fitness_otimizacao(const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	auto soma_distancias = soma_distancias_decoder7(false, 0, individual_output);
	if (soma_distancias != 0) {
		return 0;
	}
	return 1.0 / individuo.num_portas_utilizadas()
			+ 1.0 / individuo.num_maior_gate_path()
			+ 1.0 / individuo.num_transistores_total();
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

	std::vector<Populacao> populacoes;

	for (unsigned int i = 0; i < 7; i++) {
		populacoes.push_back(
				Populacao(
						new OnePlusLambdaEvoStrategy(mt, 5, genetic_params,
								new SimulationFitnessCalculator(genetic_params,
	[i](const Cromossomo& individuo,
		const std::vector<std::vector<std::bitset<8>>>& individual_output) {
			auto soma_distancias = soma_distancias_decoder7(true, i, individual_output);
			if (soma_distancias == 0) {
				return MELHOR_FITNESS;
			}
			return 1.0 / ((double) soma_distancias);
		}, false))));
	}

	// Primeira etapa
	// -- MC-CGP para achar a resposta
	int soma_geracoes = 0;
#pragma omp parallel for reduction (+: soma_geracoes)
	for (unsigned int i = 0; i < populacoes.size(); i++) {
		int geracao_final = main_loop_genetico(populacoes[i], max_geracoes);
		if (geracao_final == -1) {
			std::cout << -1 << std::endl;
			exit(0);
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
										fitness_otimizacao, true)));

	std::cout << populacao_otimizacao.melhor_individuo().num_portas_utilizadas()
			<< ' '
			<< populacao_otimizacao.melhor_individuo().num_maior_gate_path()
			<< ' '
			<< populacao_otimizacao.melhor_individuo().num_transistores_total()
			<< std::endl;
	main_loop_genetico(populacao_otimizacao, max_geracoes);
	std::cout << populacao_otimizacao.melhor_individuo().num_portas_utilizadas()
			<< ' '
			<< populacao_otimizacao.melhor_individuo().num_maior_gate_path()
			<< ' '
			<< populacao_otimizacao.melhor_individuo().num_transistores_total()
			<< std::endl;

	auto& melhor_individuo = populacao_otimizacao.melhor_individuo();
	CriadorArquivos::cria_arquivo_fenotipo_main(genetic_params,
			melhor_individuo,
			  to_string("otimizado_")
			+ to_string(melhor_individuo.num_portas_utilizadas())
			+ to_string("_")
			+ to_string(melhor_individuo.num_maior_gate_path())
			+ to_string("_")
			+ to_string(melhor_individuo.num_transistores_total())
			+ to_string(".v"));

	return 0;
}
