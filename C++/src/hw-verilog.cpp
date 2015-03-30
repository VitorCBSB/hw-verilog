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
#include "Cromossomo.h"
#include "Populacao.h"
#include "IcarusFitnessCalculator.h"

int main() {
	const double MELHOR_FITNESS = 20000000.0;
	std::mt19937 mt;
	mt.seed(time(nullptr));
	Populacao<20, 4, 1, 4, 5, 5> populacao(mt, true,
			new IcarusFitnessCalculator(4, 1,
					[&](const std::vector<std::vector<std::bitset<8>>>& individual_output)
					-> double {
						int num_acertos = 0;
						for (unsigned int i = 0; i < 15; i++) {
							num_acertos += individual_output[i][0] == 0;
						}
						num_acertos += individual_output[15][0] == 1;
						if (num_acertos == 16) {
							return MELHOR_FITNESS;
						}
						return 1.0 / (16.0 - (double) num_acertos);
					}));

	int geracao = 0;
	while (populacao.melhor_individuo().fitness() != MELHOR_FITNESS) {
		populacao.proxima_geracao();
		std::cout << ++geracao << ": " <<
				populacao.melhor_individuo().fitness() << std::endl;
		populacao.melhor_individuo().criar_arquivo_verilog("melhor.v");
	}

	return 0;
}
