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

int main() {
	const double MELHOR_FITNESS = 20000000.0;
	std::mt19937 mt;
	mt.seed(time(nullptr));
	Populacao<15, 4, 3, 4, 3, 1> populacao(mt, true,
			new IcarusFitnessCalculator(4, 3,
					[&](const std::vector<std::vector<std::bitset<8>>>& individual_output)
					-> double {
						int soma_distancias = 0;
						soma_distancias += individual_output[0][0].to_ulong();
						soma_distancias += abs((int) individual_output[1][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[2][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[3][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[4][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[5][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[6][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[7][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[8][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[9][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[10][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[11][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[12][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[13][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[14][0].to_ulong() - 0);
						soma_distancias += abs((int) individual_output[15][0].to_ulong() - 7);
						if (soma_distancias == 0) {
							return MELHOR_FITNESS;
						}
						return 1.0 / ((double) soma_distancias);
					}));

	int geracao = 0;
	while (populacao.melhor_individuo().fitness() != MELHOR_FITNESS) {
		populacao.proxima_geracao();
		std::cout << ++geracao << ": " << populacao.melhor_individuo().fitness()
				<< std::endl;
		populacao.melhor_individuo().criar_arquivo_verilog("melhor.v");
	}

	return 0;
}
