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

	criar_arquivo_top(individuo, top_file);
	std::cout << "Boop" << std::endl;
	exit(0);
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

void IcarusFitnessCalculator::criar_arquivo_top(const Cromossomo& individuo,
		const std::string& nome_arquivo) {
	auto arquivo_modelo = le_conteudo_arquivo("icarus_main_modelo");
	std::ofstream top(nome_arquivo);

	const int num_les = genetic_params.r * genetic_params.c;
	const int bits_pinos = ceil(log2(num_les + genetic_params.num_in));
	const int bits_func = ceil(log2(genetic_params.num_funcs()));
	const int bits_les = bits_pinos * genetic_params.le_num_in + bits_func;

	replace(arquivo_modelo, "#bits_les_1", to_string(bits_les - 1));
	replace(arquivo_modelo, "#num_les_1", to_string(num_les - 1));
	replace(arquivo_modelo, "#bits_pinos_1", to_string(bits_pinos - 1));
	replace(arquivo_modelo, "#num_outputs_1",
			to_string(genetic_params.num_out - 1));
	replace(arquivo_modelo, "#num_inputs_1",
			to_string(genetic_params.num_in - 1));
	replace(arquivo_modelo, "#num_outputs_1",
			to_string(genetic_params.num_out - 1));
	replace(arquivo_modelo, "#assign_les", gera_le_assigns(individuo));
	replace(arquivo_modelo, "#assign_outs", gera_outs_assigns(individuo));
	replace(arquivo_modelo, "#inputs_pow2",
			to_string((int) pow(genetic_params.num_in, 2)));

	top << arquivo_modelo;
}

std::string IcarusFitnessCalculator::gera_le_assigns(
		const Cromossomo& individuo) {
	std::string result;
	const std::string modelo =
			"\tdescricao_les[#index] = {#bits_func'd#func, #inputs};\n";

	const int num_les = genetic_params.r * genetic_params.c;
	const int bits_pinos = ceil(log2(num_les + genetic_params.num_in));
	const int bits_func = ceil(log2(genetic_params.num_funcs()));

	for (unsigned int j = 0; j < genetic_params.c; j++) {
		for (unsigned int i = 0; i < genetic_params.r; i++) {
			const int current = j * genetic_params.r + i;
			auto current_modelo = modelo;
			replace(current_modelo, "#bits_func", to_string(bits_func));
			replace(current_modelo, "#func",
					to_string(individuo.elementos_logicos[i][j].function));
			replace(current_modelo, "#index", to_string(current));

			std::string inputs;
			const std::string input_modelo = "#bits_pinos'd#input";
			for (unsigned int k = 0; k < genetic_params.le_num_in; k++) {
				auto current_input = input_modelo;

				replace(current_input, "#bits_pinos", to_string(bits_pinos));
				replace(current_input, "#input",
						to_string(individuo.elementos_logicos[i][j].inputs[k]));

				inputs += current_input;
				if (k != genetic_params.le_num_in - 1) {
					inputs += ", ";
				}
			}
			replace(current_modelo, "#inputs", inputs);
			result += current_modelo;
		}
	}

	return result;
}

std::string IcarusFitnessCalculator::gera_outs_assigns(
		const Cromossomo& individuo) {
	std::string result;
	const std::string modelo = "\tdescricao_outs[#index] = #bits_pinos'd#output;\n";

	const int num_les = genetic_params.r * genetic_params.c;
	const int bits_pinos = ceil(log2(num_les + genetic_params.num_in));

	for (unsigned int i = 0; i < individuo.saidas.size(); i++) {
		auto current_modelo = modelo;
		replace(current_modelo, "#index", to_string(i));
		replace(current_modelo, "#bits_pinos", to_string(bits_pinos));
		replace(current_modelo, "#output", to_string(individuo.saidas[i].input));
		result += current_modelo;
	}

	return result;
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
