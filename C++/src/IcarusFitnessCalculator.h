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
		cria_arquivo_logic_e("logic_e.v");
		cria_arquivo_genetico("genetico.v");
	}

	void fitness(std::vector<Cromossomo>& populacao, int num_inputs, int le_num_inputs, int num_outputs);
	std::unique_ptr<FitnessCalculator> clone() {
		return std::unique_ptr<FitnessCalculator>(new IcarusFitnessCalculator(*this));
	}

private:
	void criar_arquivo_top(const Cromossomo& individuo, const std::string& nome_arquivo);
	std::string gera_le_assigns(const Cromossomo& individuo);
	std::string gera_outs_assigns(const Cromossomo& individuo);
	std::vector<std::vector<std::bitset<8>>> parse_output(FILE* simulador, int num_inputs);

	void compilar(const Cromossomo& individuo, int index);
	std::vector<std::vector<std::bitset<8>>> simular(int index, int num_inputs);
};

#endif /* ICARUSFITNESSCALCULATOR_H_ */
