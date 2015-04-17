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

int main() {
	const double MELHOR_FITNESS = 20000000.0;
	std::mt19937 mt;
	mt.seed(time(nullptr));
	Populacao populacao(
			new OnePlusLambdaEvoStrategy(mt, 4, 3, 2, 2, 3, 3, true,
					new FPGAFitnessCalculator(
							[&](const std::vector<std::vector<std::bitset<8>>>& individual_output)
							-> double {
								int soma_distancias = 0;
								soma_distancias += individual_output[0][0].to_ulong();
								soma_distancias += abs((int) individual_output[1][30000].to_ulong() - 1);
								soma_distancias += abs((int) individual_output[2][30000].to_ulong() - 1);
								soma_distancias += abs((int) individual_output[3][30000].to_ulong() - 2);
								soma_distancias += abs((int) individual_output[4][30000].to_ulong() - 1);
								soma_distancias += abs((int) individual_output[5][30000].to_ulong() - 2);
								soma_distancias += abs((int) individual_output[6][30000].to_ulong() - 2);
								soma_distancias += abs((int) individual_output[7][30000].to_ulong() - 3);
								if (soma_distancias == 0) {
									return MELHOR_FITNESS;
								}
								return 1.0 / ((double) soma_distancias);
							})));

	int geracao = 0;
	populacao.calcular_fitness();
	while (geracao < 10000 && populacao.melhor_individuo().fitness() != MELHOR_FITNESS) {
		if (geracao % 100 == 0) {
			std::cout << geracao << ": " << populacao.melhor_individuo().fitness()
						<< ", " << populacao.fitness_medio() << std::endl;
		}
		populacao.melhor_individuo().criar_arquivo_verilog("melhor.v");
		populacao.proxima_geracao();
		populacao.calcular_fitness();
		geracao++;
	}

	populacao.melhor_individuo().criar_arquivo_verilog("melhor.v");
	if (populacao.melhor_individuo().fitness() == MELHOR_FITNESS) {
		std::cout << "Solucao encontrada na geracao " << geracao << std::endl;
	}

	return 0;
}
