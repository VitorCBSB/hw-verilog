/*
 * IcarusFitnessCalculator.h
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#ifndef ICARUSFITNESSCALCULATOR_H_
#define ICARUSFITNESSCALCULATOR_H_

#include "FitnessCalculator.h"
#include "Utils.h"
#include "CriadorArquivos.h"
#include <iostream>
#include <fstream>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

class IcarusFitnessCalculator: public FitnessCalculator {
public:
	IcarusFitnessCalculator(GeneticParams genetic_params,
			std::function<double(const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			FitnessCalculator(genetic_params, fitness_calculator) {
		CriadorArquivos::cria_arquivo_logic_e(genetic_params, "logic_e.v");
		CriadorArquivos::cria_arquivo_genetico(genetic_params, "genetico.v");
	}

	void fitness(std::vector<Cromossomo>& populacao);
	std::unique_ptr<FitnessCalculator> clone() {
		return std::unique_ptr<FitnessCalculator>(new IcarusFitnessCalculator(*this));
	}

private:
	std::vector<std::vector<std::bitset<8>>> parse_output(FILE* simulador);

	void compilar(const Cromossomo& individuo, int index);
	std::vector<std::vector<std::bitset<8>>> simular(int index);
};

#endif /* ICARUSFITNESSCALCULATOR_H_ */
