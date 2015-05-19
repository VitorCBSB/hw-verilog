/*
 * SimulationFitnessCalculator.cpp
 *
 *  Created on: 19/05/2015
 *      Author: vitor
 */

#include "SimulationFitnessCalculator.h"

void SimulationFitnessCalculator::fitness(std::vector<Cromossomo>& populacao) {
	for (auto& individuo : populacao) {
		std::vector<std::vector<std::bitset<8>>> result;
		for (unsigned int i = 0; i < (unsigned int) pow(2, genetic_params.num_in); i++) {
			result.push_back(std::vector<std::bitset<8>>());
			result[i].push_back(calcular_entrada(individuo, std::bitset<8>(i)));
		}
		individuo.set_fitness(fitness_calculator(result));
	}
}

std::bitset<8> SimulationFitnessCalculator::calcular_entrada(
		const Cromossomo& individuo, std::bitset<8> entrada) {
	std::bitset<8> resultado;
	auto matriz_resultados = matriz_resultados_inicial();

	for (unsigned int j = 0; j < genetic_params.c; j++) {
		for (unsigned int i = 0; i < genetic_params.r; i++) {
			auto& individuo_atual = individuo.elementos_logicos[i][j];
			auto funcao = escolher_funcao(
					individuo_atual.function);
			auto input0 = escolher_input(individuo_atual.inputs[0], matriz_resultados, entrada);
			auto input1 = escolher_input(individuo_atual.inputs[1], matriz_resultados, entrada);
			matriz_resultados[i][j] = funcao(input0, input1);
		}
	}

	for (unsigned int i = 0; i < genetic_params.num_out; i++) {
		resultado[i] = escolher_input(individuo.saidas[i].input, matriz_resultados, entrada);
	}

	return resultado;
}

std::vector<std::vector<bool>> SimulationFitnessCalculator::matriz_resultados_inicial() {
	std::vector<std::vector<bool>> matriz_inicial(genetic_params.r);

	for (unsigned int i = 0; i < genetic_params.r; i++) {
		matriz_inicial[i].reserve(genetic_params.c);
	}
	return matriz_inicial;
}

std::function<bool(const bool&, const bool&)> SimulationFitnessCalculator::escolher_funcao(
		int funcao) {
	std::vector<std::function<bool(const bool&, const bool&)>> funcoes = {
					std::logical_and<bool>(),
					std::logical_or<bool>(),
					std::not_equal_to<bool>(),
					[](const bool& a, const bool& b) {return !a;},
					[](const bool& a, const bool& b) {return !(a && b);},
					std::equal_to<bool>(),
					[](const bool& a, const bool& b) {return !(a || b);}
			};

	return funcoes[funcao];
}

bool SimulationFitnessCalculator::escolher_input(unsigned int input,
		const std::vector<std::vector<bool>>& matriz_resultados,
		const std::bitset<8>& entrada) {
	if (input >= genetic_params.num_in) {
		input -= genetic_params.num_in;
		return matriz_resultados[input / genetic_params.c][input % genetic_params.c];
	}
	return entrada[input];
}
