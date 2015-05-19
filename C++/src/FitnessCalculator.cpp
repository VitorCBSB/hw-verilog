/*
 * FitnessCalculator.cpp
 *
 *  Created on: 14/05/2015
 *      Author: vitor
 */

#include "FitnessCalculator.h"

void FitnessCalculator::cria_arquivo_genetico(const std::string& nome_arquivo) {
	auto arquivo_modelo = le_conteudo_arquivo("genetico_modelo");
	std::ofstream arquivo_resultado(nome_arquivo);

	const int total_pinos = genetic_params.r * genetic_params.c
			+ genetic_params.num_in;
	const int bits_pinos = ceil(log2(total_pinos));
	const int tam_le = ceil(log2(genetic_params.num_funcs()))
			+ ceil(log2(total_pinos)) * genetic_params.le_num_in;

	replace(arquivo_modelo, "#tam_le", to_string(tam_le - 1));
	replace(arquivo_modelo, "#r_x_c",
			to_string(genetic_params.r * genetic_params.c - 1));
	replace(arquivo_modelo, "#num_in", to_string(genetic_params.num_in - 1));
	replace(arquivo_modelo, "#num_out", to_string(genetic_params.num_out - 1));
	replace(arquivo_modelo, "#num_out", to_string(genetic_params.num_out - 1));
	replace(arquivo_modelo, "#r_x_c",
			to_string(genetic_params.r * genetic_params.c - 1));
	replace(arquivo_modelo, "#bits_pinos", to_string(bits_pinos - 1));
	replace(arquivo_modelo, "#num_pinos", to_string(total_pinos - 1));
	replace(arquivo_modelo, "#all_inputs_for_out", gera_string_saida());
	replace(arquivo_modelo, "#les", gera_les());

	arquivo_resultado << arquivo_modelo;
}

std::string FitnessCalculator::gera_string_saida() {
	std::string resultado;
	for (int i = genetic_params.num_out - 1; i >= 0; i--) {
		resultado += std::string("all_inputs[conf_outs[") + to_string(i) + "]]";
		if (i != 0) {
			resultado += ", ";
		}
	}
	return resultado;
}

std::string FitnessCalculator::gera_les() {
	std::string resultado;
	const std::string base = std::string("logic_e le#r#c(\n")
			+ std::string("\t.conf_func(conf_les[#n][#bits_top:#bits_next]),\n")
			+ std::string("\t.conf_ins(conf_les[#n][#bits_rest:0]),\n")
			+ std::string("\t.all_inputs(all_inputs),\n")
			+ std::string("\t.out(le_out[#n])\n") + ");\n\n";

	const int total_pinos = genetic_params.r * genetic_params.c
			+ genetic_params.num_in;
	const int bits_pinos = ceil(log2(total_pinos));
	const int bits_func = ceil(log2(genetic_params.num_funcs()));
	const int bits_top = bits_func + genetic_params.le_num_in * bits_pinos;

	for (unsigned int j = 0; j < genetic_params.c; j++) {
		for (unsigned int i = 0; i < genetic_params.r; i++) {
			const int current = j * genetic_params.r + i;
			auto current_le = base;
			replace(current_le, "#r", to_string(i));
			replace(current_le, "#c", to_string(j));
			replace(current_le, "#n", to_string(current));
			replace(current_le, "#n", to_string(current));
			replace(current_le, "#n", to_string(current));
			replace(current_le, "#bits_top", to_string(bits_top - 1));
			replace(current_le, "#bits_next", to_string(bits_top - bits_func));
			replace(current_le, "#bits_rest",
					to_string((bits_top - bits_func) - 1));
			resultado += current_le;
		}
	}

	return resultado;

}

void FitnessCalculator::cria_arquivo_logic_e(const std::string& nome_arquivo) {
	auto arquivo_modelo = le_conteudo_arquivo("logic_e_modelo");
	std::ofstream arquivo_resultado(nome_arquivo);

	const int bits_func = ceil(log2(genetic_params.num_funcs()));
	const int total_pinos = genetic_params.r * genetic_params.c
			+ genetic_params.num_in;
	const int bits_pinos = ceil(log2(total_pinos));
	const int bits_inputs = bits_pinos * genetic_params.le_num_in;
	const int num_funcs = genetic_params.num_funcs();

	replace(arquivo_modelo, "#bits_func", to_string(bits_func - 1));
	replace(arquivo_modelo, "#bits_inputs", to_string(bits_inputs - 1));
	replace(arquivo_modelo, "#total_pinos", to_string(total_pinos - 1));
	replace(arquivo_modelo, "#num_funcs_1", to_string(num_funcs - 1));
	replace(arquivo_modelo, "#funcs", gera_le_funcs());

	arquivo_resultado << arquivo_modelo;
}

std::string FitnessCalculator::gera_le_funcs() {
	std::string result;
	std::vector<std::string> funcs = { "and", "or", "xor", "not", "nand",
			"xnor", "nor" };
	std::vector<std::string> filtered_funcs;

	const std::string modelo = "\t#func func#index(all_funcs[#index], #inputs);\n";
	const int total_pinos = genetic_params.r * genetic_params.c
			+ genetic_params.num_in;
	const int bits_pinos = ceil(log2(total_pinos));

	for (unsigned int i = 0; i < funcs.size(); i++) {
		if (genetic_params.funcs[i]) {
			filtered_funcs.push_back(funcs[i]);
		}
	}

	for (unsigned int i = 0; i < filtered_funcs.size(); i++) {
		auto current_modelo = modelo;
		replace(current_modelo, "#func", filtered_funcs[i]);
		replace(current_modelo, "#index", to_string(i));
		replace(current_modelo, "#index", to_string(i));

		std::string inputs;
		for (int j = genetic_params.le_num_in; j > 0; j--) {
			const int current_max = (j * bits_pinos) - 1;
			const int current_min = current_max - (bits_pinos - 1);
			inputs += std::string("all_inputs[conf_ins[") + to_string(current_max)
								+ std::string(":") + to_string(current_min) + "]]";
			if (filtered_funcs[i] == "not") {
				break;
			}
			if (j != 1) {
				inputs += ", ";
			}
		}
		replace(current_modelo, "#inputs", inputs);
		result += current_modelo;
	}

	return result;
}

void FitnessCalculator::cria_arquivo_top_icarus(const Cromossomo& individuo,
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

std::string FitnessCalculator::gera_le_assigns(
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

std::string FitnessCalculator::gera_outs_assigns(
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
