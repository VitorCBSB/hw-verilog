/*
 * SimulationFitnessCalculator.h
 *
 *  Created on: 19/05/2015
 *      Author: vitor
 */

#ifndef SIMULATIONFITNESSCALCULATOR_H_
#define SIMULATIONFITNESSCALCULATOR_H_

#include "FitnessCalculator.h"
#include <functional>
#include <algorithm>

class SimulationFitnessCalculator: public FitnessCalculator {
public:
	SimulationFitnessCalculator(GeneticParams genetic_params,
			std::function<double(const Cromossomo&, const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator)
				: FitnessCalculator(genetic_params, fitness_calculator) {
	}

	std::unique_ptr<FitnessCalculator> clone() {
		return std::unique_ptr<FitnessCalculator>(new SimulationFitnessCalculator(*this));
	}

	void fitness(std::vector<Cromossomo>& populacao);
private:
	std::bitset<8> calcular_entrada(const Cromossomo& individuo, std::bitset<8> entrada);
	std::vector<std::vector<bool>> matriz_resultados_inicial();
	std::function<bool(const bool&, const bool&)> escolher_funcao(int funcao);
	bool escolher_input(unsigned int input,
			const std::vector<std::vector<bool>>& matriz_resultados,
			const std::bitset<8>& entrada);

};

#endif /* SIMULATIONFITNESSCALCULATOR_H_ */
