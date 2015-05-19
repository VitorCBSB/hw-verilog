/*
 * SimulationFitnessCalculator.cpp
 *
 *  Created on: 19/05/2015
 *      Author: vitor
 */

#include "SimulationFitnessCalculator.h"

void SimulationFitnessCalculator::fitness(std::vector<Cromossomo>& populacao) {
	std::vector<std::vector<std::bitset<8>>> result;

}

std::bitset<8> SimulationFitnessCalculator::calcular_entrada(
		const Cromossomo& individuo, std::bitset<8> entrada) {
	std::bitset<8> resultado;
	auto matriz_resultados = matriz_resultados_inicial();

	for (int j = 0; j < genetic_params.c; j++) {
		for (int i = 0; i < genetic_params.r; i++) {
		}
	}

	return resultado;
}

std::vector<std::vector<bool>> SimulationFitnessCalculator::matriz_resultados_inicial() {
	std::vector<std::vector<bool>> matriz_inicial(genetic_params.r);

	for (int i = 0; i < genetic_params.r; i++) {
		matriz_inicial[i].reserve(genetic_params.c);
	}

	return matriz_inicial;
}
