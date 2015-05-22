/*
 * IcarusFitnessCalculator.cpp
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#include "IcarusFitnessCalculator.h"

void IcarusFitnessCalculator::fitness(std::vector<Cromossomo>& populacao) {

#pragma omp parallel for
	for (unsigned int i = 0; i < populacao.size(); i++) {
		compilar(populacao[i], i);

		auto parsed_output = simular(i);
		populacao[i].set_fitness(fitness_calculator(parsed_output));
	}
}

void IcarusFitnessCalculator::compilar(const Cromossomo& individuo, int index) {
	auto top_file = std::string("top") + to_string(index) + ".v";
	auto individuo_file = std::string("individuo") + to_string(index);
	std::string system_call = std::string("iverilog genetico.v ") + top_file
			+ std::string(" logic_e.v -o ") + individuo_file;

	CriadorArquivos::cria_arquivo_top_icarus(genetic_params, individuo, top_file);
	if (system(system_call.c_str()) != 0) {
		std::cerr << "Erro na chamada iverilog.\n";
		exit(1);
	}
}

std::vector<std::vector<std::bitset<8>>>
	IcarusFitnessCalculator::simular(int index) {
	auto individuo_file = std::string("individuo") + to_string(index);
	std::string program_call = std::string("vvp ") + individuo_file;
	FILE* simulador = popen(program_call.c_str(), "r");
	if (simulador == nullptr) {
		std::cerr << "Nao consegui executar o simulador vvp.\n";
		std::exit(1);
	}
	auto parsed_output = parse_output(simulador);
	pclose(simulador);
	return parsed_output;
}

std::vector<std::vector<std::bitset<8>>>
	IcarusFitnessCalculator::parse_output(FILE* simulador) {
	std::vector<std::vector<std::bitset<8>>> results;
	char entrada[100];
	char saida[100];

	// Ignorando os x's
	fscanf(simulador, "%s", entrada);
	fscanf(simulador, "%s", saida);

	for (int i = 0; i < (int) pow(2, genetic_params.num_in); i++) {
		fscanf(simulador, "%s", entrada);
		fscanf(simulador, "%s", saida);
		results.push_back(std::vector<std::bitset<8>>());
		results[i].push_back(std::bitset<8>(saida));
	}
	return results;
}
