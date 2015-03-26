/*
 * IcarusFitnessCalculator.cpp
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#include "IcarusFitnessCalculator.h"

double IcarusFitnessCalculator::fitness() {
	std::vector<std::vector<std::bitset<8>>> results;

	gerar_arquivo_top();
	system("iverilog top.v genetico.v -o individuo");
	FILE* simulador = popen("vvp individuo", "r");
	if (simulador == nullptr) {
		std::cerr << "Nao consegui executar o simulador vvp.\n";
		std::exit(1);
	}

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

	pclose(simulador);

	return fitness_calculator(results);
}

void IcarusFitnessCalculator::gerar_arquivo_top() {
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
	top << "out);\n";
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
