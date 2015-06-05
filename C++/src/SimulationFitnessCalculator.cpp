/*
 * SimulationFitnessCalculator.cpp
 *
 *  Created on: 19/05/2015
 *      Author: vitor
 */

#include "SimulationFitnessCalculator.h"

void SimulationFitnessCalculator::fitness(std::vector<Cromossomo>& populacao) {
#pragma omp parallel for if (paralelismo_local)
	for (unsigned int i = 0; i < populacao.size(); i++) {
		std::vector<std::vector<std::bitset<8>>> result;
		for (unsigned int j = 0; j < (unsigned int) pow(2, genetic_params.num_in); j++) {
			result.push_back(std::vector<std::bitset<8>>());
			result[j].push_back(calcular_entrada(populacao[i], std::bitset<8>(j)));
		}
		populacao[i].set_fitness(fitness_calculator(populacao[i], result));
	}
}

std::bitset<8> SimulationFitnessCalculator::calcular_entrada(
		const Cromossomo& individuo, std::bitset<8> entrada) {
	std::bitset<8> resultado;
	auto matriz_resultados = matriz_resultados_inicial();

	for (unsigned int j = 0; j < genetic_params.c; j++) {
		for (unsigned int i = 0; i < genetic_params.r; i++) {
			const auto& individuo_atual = individuo.elementos_logicos[i][j];
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
		matriz_inicial[i].resize(genetic_params.c);
	}
	return matriz_inicial;
}

std::function<bool(const bool&, const bool&)> SimulationFitnessCalculator::escolher_funcao(
		int funcao) {
	auto funcoes = determinar_funcoes();
	return funcoes[funcao];
}

std::vector<std::function<bool(const bool&, const bool&)>>
	SimulationFitnessCalculator::determinar_funcoes() {
	const std::vector<std::function<bool(const bool&, const bool&)>> funcoes = {
					std::logical_and<bool>(),
					std::logical_or<bool>(),
					std::not_equal_to<bool>(),
					[](const bool& a, const bool& b) {return !a;},
					[](const bool& a, const bool& b) {return !(a && b);},
					std::equal_to<bool>(),
					[](const bool& a, const bool& b) {return !(a || b);}
			};
	std::vector<std::function<bool(const bool&, const bool&)>> result;

	for (unsigned int i = 0; i < funcoes.size(); i++) {
		if (genetic_params.funcs[i]) {
			result.emplace_back(funcoes[i]);
		}
	}

	return result;
}

bool SimulationFitnessCalculator::escolher_input(unsigned int input,
		const std::vector<std::vector<bool>>& matriz_resultados,
		const std::bitset<8>& entrada) {
	if (input >= genetic_params.num_in) {
		input -= genetic_params.num_in;
		return matriz_resultados[input % genetic_params.r][input / genetic_params.r];
	}
	return entrada[input];
}
