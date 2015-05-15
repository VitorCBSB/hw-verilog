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
#include "Cromossomo.h"
#include "Populacao.h"
#include "IcarusFitnessCalculator.h"
#include "FPGAFitnessCalculator.h"
#include "TournamentEvoStrategy.h"
#include "OnePlusLambdaEvoStrategy.h"
#include "RouletteEvoStrategy.h"
#include "GeneticParams.h"

const double MELHOR_FITNESS = 20000000.0;
const unsigned int NUM_SAMPLES = 100;
const unsigned int NUM_IN = 3;
const unsigned int NUM_OUT = 2;
const unsigned int NUM_ROWS = 3;
const unsigned int NUM_COLS = 3;
const unsigned int LE_NUM_IN = 2;
const bool FEED_FORWARD = true;

double fitness(const std::vector<std::vector<std::bitset<8>>>& individual_output) {
	int soma_distancias = 0;
	soma_distancias += individual_output[0][0].to_ulong();
	soma_distancias += abs((int) individual_output[1][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[2][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[3][0].to_ulong() - 2);
	soma_distancias += abs((int) individual_output[4][0].to_ulong() - 1);
	soma_distancias += abs((int) individual_output[5][0].to_ulong() - 2);
	soma_distancias += abs((int) individual_output[6][0].to_ulong() - 2);
	soma_distancias += abs((int) individual_output[7][0].to_ulong() - 3);
	if (soma_distancias == 0) {
		return MELHOR_FITNESS;
	}
	return 1.0 / ((double) soma_distancias);
}

int main(int argc, char* argv[]) {
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

	auto fitness_calculator = new IcarusFitnessCalculator(genetic_params, fitness);

	Populacao populacao(
			new OnePlusLambdaEvoStrategy(mt, 5, genetic_params,
					fitness_calculator));

	int geracao = 0;
	populacao.calcular_fitness();
	while (geracao < 10000
			&& populacao.melhor_individuo().fitness() != MELHOR_FITNESS) {
		std::cout << geracao << ": " << populacao.melhor_individuo().fitness()
				<< ", " << populacao.fitness_medio() << std::endl;
		fitness_calculator->criar_arquivo_top(populacao.melhor_individuo(), "melhor.v");
		populacao.proxima_geracao();
		populacao.calcular_fitness();
		geracao++;
	}

	fitness_calculator->criar_arquivo_top(populacao.melhor_individuo(), "melhor.v");
	if (populacao.melhor_individuo().fitness() == MELHOR_FITNESS) {
		std::cout << "Solucao encontrada na geracao " << geracao << std::endl;
	}

	return 0;
}
