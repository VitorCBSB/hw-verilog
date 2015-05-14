/*
 * Cromossomo.h
 *
 *  Created on: 13/09/2014
 *      Author: vitor
 */

#ifndef CROMOSSOMO_H_
#define CROMOSSOMO_H_

#include "Cell.h"
#include "GeneticParams.h"
#include <bitset>
#include <array>
#include <vector>
#include <random>
#include <string>
#include <memory>
#include <random>
#include <algorithm>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

class Cromossomo {
public:
	GeneticParams genetic_params;
	std::vector<std::vector<FunctionCell>> elementos_logicos;
	std::vector<OutputCell> saidas;

private:
	const int SAIDAS_LUT = pow(2, genetic_params.le_num_in);
	const int NUM_PINOS_DISPONIVEIS = genetic_params.num_in
			+ genetic_params.r * genetic_params.c;
	std::mt19937& mt;
	double fitness_score = 0.0;

	unsigned int random_func() {
		return mt();
	}

public:

	Cromossomo(const Cromossomo& other) :
			genetic_params(other.genetic_params), elementos_logicos(
					other.elementos_logicos), saidas(other.saidas), mt(
					other.mt), fitness_score(other.fitness_score) {
	}

	Cromossomo& operator=(const Cromossomo& other) {
		mt = other.mt;
		fitness_score = other.fitness_score;
		genetic_params = other.genetic_params;
		elementos_logicos = other.elementos_logicos;
		saidas = other.saidas;
		return *this;
	}

	bool operator<(const Cromossomo& other) const {
		return fitness() < other.fitness();
	}

	bool operator<=(const Cromossomo& other) const {
		return fitness() <= other.fitness();
	}

	bool operator>(const Cromossomo& other) const {
		return fitness() > other.fitness();
	}

	bool operator>=(const Cromossomo& other) const {
		return fitness() >= other.fitness();
	}

	Cromossomo(std::mt19937& mt, GeneticParams genetic_params,
			bool feed_forward = false) :
			genetic_params(genetic_params), mt(mt) {
		for (unsigned int i = 0; i < genetic_params.r; i++) {
			elementos_logicos.emplace_back(std::vector<FunctionCell>());
			for (unsigned int j = 0; j < genetic_params.c; j++) {
				elementos_logicos[i].emplace_back(aleatorio(j));
			}
		}

		for (unsigned int i = 0; i < genetic_params.num_out; i++) {
			saidas.emplace_back(aleatorio_output());
		}
	}

	Cromossomo(std::mt19937& mt, GeneticParams genetic_params,
			std::vector<std::vector<FunctionCell>> elementos_logicos,
			std::vector<OutputCell> saidas) :
			genetic_params(genetic_params), elementos_logicos(
					elementos_logicos), saidas(saidas), mt(mt) {
	}

	std::vector<Cromossomo> gerar_filhos(const Cromossomo& outro_pai) {
		auto ponto_corte =
				random_func()
						% (genetic_params.r * genetic_params.c
								+ genetic_params.num_out);
		std::vector<std::vector<FunctionCell>> elementos_logicos_filho1;
		std::vector<std::vector<FunctionCell>> elementos_logicos_filho2;
		std::vector<OutputCell> saidas_filho1;
		std::vector<OutputCell> saidas_filho2;

		unsigned int i;
		for (i = 0; i < ponto_corte; i++) {
			if (i < genetic_params.r * genetic_params.c) {
				if (i % genetic_params.c == 0) {
					elementos_logicos_filho1.emplace_back(
							std::vector<FunctionCell>());
					elementos_logicos_filho2.emplace_back(
							std::vector<FunctionCell>());
				}
				elementos_logicos_filho1[i / genetic_params.c].emplace_back(
						elementos_logicos[i / genetic_params.c][i
								% genetic_params.c]);
				elementos_logicos_filho2[i / genetic_params.c].emplace_back(
						outro_pai.elementos_logicos[i / genetic_params.c][i
								% genetic_params.c]);
			} else {
				int temp = i - (genetic_params.r * genetic_params.c);
				saidas_filho1.emplace_back(saidas[temp]);
				saidas_filho2.emplace_back(outro_pai.saidas[temp]);
			}
		}

		for (; i < genetic_params.r * genetic_params.c + genetic_params.num_out;
				i++) {
			if (i < genetic_params.r * genetic_params.c) {
				if (i % genetic_params.c == 0) {
					elementos_logicos_filho1.emplace_back(
							std::vector<FunctionCell>());
					elementos_logicos_filho2.emplace_back(
							std::vector<FunctionCell>());
				}
				elementos_logicos_filho1[i / genetic_params.c].emplace_back(
						outro_pai.elementos_logicos[i / genetic_params.c][i
								% genetic_params.c]);
				elementos_logicos_filho2[i / genetic_params.c].emplace_back(
						elementos_logicos[i / genetic_params.c][i
								% genetic_params.c]);
			} else {
				int temp = i - (genetic_params.r * genetic_params.c);
				saidas_filho1.emplace_back(outro_pai.saidas[temp]);
				saidas_filho2.emplace_back(saidas[temp]);
			}
		}

		std::vector<Cromossomo> resultado;
		resultado.push_back(
				Cromossomo(mt, genetic_params, elementos_logicos_filho1,
						saidas_filho1));
		resultado.push_back(
				Cromossomo(mt, genetic_params, elementos_logicos_filho2,
						saidas_filho2));

		return resultado;
	}

	void mutar() {
		auto ponto_a_mutar =
				random_func()
						% (genetic_params.r * genetic_params.c
								+ genetic_params.num_out);
		if (ponto_a_mutar < genetic_params.r * genetic_params.c) {
			mutar_function_cell(ponto_a_mutar);
		} else {
			mutar_output_cell(
					ponto_a_mutar - (genetic_params.r * genetic_params.c));
		}
	}

	void mutar_function_cell(int ponto_a_mutar) {
		auto componente_a_mutar = random_func()
				% (genetic_params.le_num_in + 1);
		auto linha = ponto_a_mutar / genetic_params.c;
		auto coluna = ponto_a_mutar % genetic_params.c;
		if (componente_a_mutar == 0) {
			elementos_logicos[linha][coluna].function = random_func()
					% genetic_params.num_funcs();
		} else {
			if (genetic_params.feed_forward) {
				elementos_logicos[linha][coluna].inputs[componente_a_mutar - 1] =
						random_func()
								% (genetic_params.num_in
										+ (coluna * genetic_params.r));
			} else {
				elementos_logicos[linha][coluna].inputs[componente_a_mutar - 1] =
						random_func() % NUM_PINOS_DISPONIVEIS;
			}
		}
	}

	void mutar_output_cell(int ponto_a_mutar) {
		saidas[ponto_a_mutar] = OutputCell(
				random_func() % NUM_PINOS_DISPONIVEIS);
	}

	double fitness() const {
		return fitness_score;
	}

	void set_fitness(double fitness_score) {
		this->fitness_score = fitness_score;
	}

private:
	FunctionCell aleatorio(int coluna) {
		std::vector<unsigned int> inputs;
		unsigned int function = random_func() % (genetic_params.num_funcs());
		for (unsigned int i = 0; i < genetic_params.le_num_in; i++) {
			if (genetic_params.feed_forward) {
				inputs.push_back(
						random_func()
								% (genetic_params.num_in
										+ (coluna * genetic_params.r)));
			} else {
				inputs.push_back(random_func() % NUM_PINOS_DISPONIVEIS);
			}
		}
		return FunctionCell(function, inputs);
	}

	OutputCell aleatorio_output() {
		return OutputCell(random_func() % NUM_PINOS_DISPONIVEIS);
	}

	std::string decodificar_entrada(unsigned int input) const {
		char entrada_str[20];
		std::string retorno;

		if (input > genetic_params.num_in - 1) {
			input -= genetic_params.num_in;
			retorno = "le_out[";
		} else {
			retorno = "in[";
		}
		sprintf(entrada_str, "%d", input);
		retorno += entrada_str;
		retorno += "]";
		return retorno;
	}

public:
	std::vector<unsigned char> descricao_les() {
		std::vector<unsigned char> result;

		for (unsigned int j = 0; j < genetic_params.c; j++) {
			for (unsigned int i = 0; i < genetic_params.r; i++) {
				result.push_back(elementos_logicos[i][j].function);
				for (unsigned int k = 0; k < genetic_params.le_num_in; k++) {
					result.push_back(elementos_logicos[i][j].inputs[k]);
				}
			}
		}

		return result;
	}

	std::vector<unsigned char> descricao_outs() {
		std::vector<unsigned char> result;

		for (const auto& output : saidas) {
			result.push_back(output.input);
		}

		return result;
	}

	void criar_arquivo_verilog(std::string nome_arquivo,
			std::string nome_modulo) const {
		FILE* fp = fopen(nome_arquivo.c_str(), "w");
		unsigned int i;

		fprintf(fp, "module %s(in, out);\n", nome_modulo.c_str());
		fprintf(fp, "\n");
		fprintf(fp, "\tinput [%d:0] in;\n", genetic_params.num_in - 1);
		fprintf(fp, "\toutput [%d:0] out;\n", genetic_params.num_out - 1);
		fprintf(fp, "\twire le_out[%d:0];\n",
				(genetic_params.r * genetic_params.c) - 1);
		fprintf(fp, "\n");

		fprintf(fp, "\tassign out = {");
		for (i = 0; i < genetic_params.num_out - 1; i++) {
			fprintf(fp, "%s, ", decodificar_entrada(saidas[i].input).c_str());
		}
		fprintf(fp, "%s", decodificar_entrada(saidas[i].input).c_str());
		fprintf(fp, "};\n\n");

		for (unsigned int j = 0; j < genetic_params.c; j++) {
			for (i = 0; i < genetic_params.r; i++) {
				fprintf(fp, "logic_e le%d%d (\n", i, j);
				fprintf(fp, "\t.func(%d'b%s),\n", SAIDAS_LUT,
						to_bit_string(elementos_logicos[i][j].function,
								SAIDAS_LUT).c_str());
				fprintf(fp, "\t.in({");
				unsigned int k;
				for (k = 0; k < genetic_params.le_num_in - 1; k++) {
					fprintf(fp, "%s, ",
							decodificar_entrada(
									elementos_logicos[i][j].inputs[k]).c_str());
				}
				fprintf(fp, "%s",
						decodificar_entrada(elementos_logicos[i][j].inputs[k]).c_str());
				fprintf(fp, "}),\n");

				fprintf(fp, "\t.out(le_out[%d])\n", j * genetic_params.r + i);
				fprintf(fp, ");\n\n");
			}
		}

		fprintf(fp, "endmodule\n");

		fclose(fp);
	}

	std::string to_bit_string(unsigned int value, unsigned int size) const {
		std::string rest;
		std::string result;
		while (value != 0) {
			char m = '0' + (value % 2);
			value /= 2;
			result.push_back(m);
			size--;
		}
		for (unsigned int i = 0; i < size; i++) {
			rest += '0';
		}
		std::reverse(result.begin(), result.end());
		return std::string(rest + result);
	}
};

#endif /* CROMOSSOMO_H_ */
