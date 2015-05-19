/*
 * FitnessCalculator.h
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#ifndef FITNESSCALCULATOR_H_
#define FITNESSCALCULATOR_H_

#include "Cromossomo.h"
#include "GeneticParams.h"
#include "Utils.h"
#include <functional>
#include <string>
#include <vector>
#include <bitset>
#include <memory>
#include <iostream>
#include <fstream>
#include <math.h>

class FitnessCalculator {
protected:
	GeneticParams genetic_params;
	std::function<double(std::vector<std::vector<std::bitset<8>>>)>fitness_calculator;

public:
	FitnessCalculator(GeneticParams genetic_params,
			std::function<double(const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			 genetic_params(genetic_params), fitness_calculator(
					fitness_calculator) {
	}
	virtual ~FitnessCalculator() {
	}

	virtual void fitness(std::vector<Cromossomo>& populacao) = 0;
	virtual std::unique_ptr<FitnessCalculator> clone() = 0;

	void cria_arquivo_genetico(const std::string& nome_arquivo);
	void cria_arquivo_logic_e(const std::string& nome_arquivo);
	void cria_arquivo_top_icarus(const Cromossomo& individuo, const std::string& nome_arquivo);

private:
	std::string gera_le_assigns(const Cromossomo& individuo);
	std::string gera_outs_assigns(const Cromossomo& individuo);
	std::string gera_le_funcs();
	std::string gera_string_saida();
	std::string gera_les();
};

#endif /* FITNESSCALCULATOR_H_ */
