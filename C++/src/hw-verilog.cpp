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
#include "SimulationFitnessCalculator.h"
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

	Populacao populacao(
			new OnePlusLambdaEvoStrategy(mt, 5, genetic_params,
					new SimulationFitnessCalculator(genetic_params, fitness)));

	int geracao = 0;
	populacao.calcular_fitness();
	while (geracao < 10000
			&& populacao.melhor_individuo().fitness() != MELHOR_FITNESS) {
		std::cout << geracao << ": " << populacao.melhor_individuo().fitness()
				<< ", " << populacao.fitness_medio() << std::endl;
		populacao.proxima_geracao();
		populacao.calcular_fitness();
		geracao++;
	}

	CriadorArquivos::cria_arquivo_top_icarus(genetic_params, populacao.melhor_individuo(), "melhor.v");
	if (populacao.melhor_individuo().fitness() == MELHOR_FITNESS) {
		std::cout << "Solucao encontrada na geracao " << geracao << std::endl;
	}

	return 0;
}
