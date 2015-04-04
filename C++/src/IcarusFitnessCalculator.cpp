/*
 * IcarusFitnessCalculator.cpp
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#include "IcarusFitnessCalculator.h"

void IcarusFitnessCalculator::fitness(std::vector<Cromossomo>& populacao,
		int num_inputs, int le_num_inputs, int num_outputs) {
	gerar_arquivo_logic_e(le_num_inputs);
	gerar_arquivo_top(num_inputs, num_outputs);

	for (unsigned int i = 0; i < populacao.size(); i++) {
		char individuo_file[100];
		sprintf(individuo_file, "individuo%d", i);
		populacao[i].criar_arquivo_verilog(individuo_file);
		std::string system_call = std::string(
				"iverilog top.v genetico.v logic_e.v -o ") + individuo_file;
		if (system(system_call.c_str()) != 0) {
			std::cerr << "Erro na chamada iverilog.\n";
			exit(1);
		}
	}

	for (unsigned int i = 0; i < populacao.size(); i++) {
		char individuo_file[100];
		sprintf(individuo_file, "individuo%d", i);
		std::string program_call = std::string("vvp ") + individuo_file;
		FILE* simulador = popen(program_call.c_str(), "r");
		if (simulador == nullptr) {
			std::cerr << "Nao consegui executar o simulador vvp.\n";
			std::exit(1);
		}
		auto parsed_output = parse_output(simulador, num_inputs);
		pclose(simulador);
		populacao[i].set_fitness(fitness_calculator(parsed_output));
	}
}

void IcarusFitnessCalculator::gerar_arquivo_top(int num_inputs,
		int num_outputs) {
	std::ofstream top;
	top.open("top.v");

	top << "module top();\n\n";
	top << "\tinteger i;\n";
	top << "\treg [" << num_inputs - 1 << ":0] in;\n";
	top << "\twire [" << num_outputs - 1 << ":0] out;\n\n";
	top << "initial begin\n";
	top << "\t$monitor(\"";
	for (int i = 0; i < num_inputs; i++) {
		top << "%b";
	}
	top << " ";
	for (int i = 0; i < num_outputs; i++) {
		top << "%b";
	}
	top << "\", ";
	for (int i = num_inputs - 1; i >= 0; i--) {
		top << "in[" << i << "], ";
	}
	for (int i = num_outputs - 1; i >= 1; i--) {
		top << "out[" << i << "], ";
	}
	top << "out[0]);\n";
	top << "\tfor (i = 0; i < " << (int) pow(2, num_inputs)
			<< "; i = i + 1) begin\n";
	top << "\t\t#5 in = i;\n";
	top << "\tend\n";
	top << "end\n\n";
	top << "genetico genetico(\n";
	top << "\t.in(in),\n";
	top << "\t.out(out)\n";
	top << ");\n\n";
	top << "endmodule";
}

std::vector<std::vector<std::bitset<8>>>IcarusFitnessCalculator::parse_output(FILE* simulador, int num_inputs) {
	std::vector<std::vector<std::bitset<8>>> results;
	char entrada[100];
	char saida[100];

	// Ignorando os x's
	fscanf(simulador, "%s", entrada);
	fscanf(simulador, "%s", saida);

	for (int i = 0; i < (int) pow(2, num_inputs); i++) {
		fscanf(simulador, "%s", entrada);
		fscanf(simulador, "%s", saida);
		results.push_back(std::vector<std::bitset<8>>());
		results[i].push_back(std::bitset<8>(saida));
	}
	return results;
}
