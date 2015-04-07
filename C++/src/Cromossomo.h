/*
 * Cromossomo.h
 *
 *  Created on: 13/09/2014
 *      Author: vitor
 */

#ifndef CROMOSSOMO_H_
#define CROMOSSOMO_H_

#include "Cell.h"
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
	unsigned int num_in;
	unsigned int num_out;
	unsigned int le_num_in;
	unsigned int r;
	unsigned int c;
	std::vector<std::vector<FunctionCell>> elementos_logicos;
	std::vector<OutputCell> saidas;

private:
	const int SAIDAS_LUT = pow(2, le_num_in);
	const int NUM_PINOS_DISPONIVEIS = num_in + r * c;
	std::mt19937& mt;
	double fitness_score = 0.0;

	bool feed_forward = false;

	unsigned int random_func() {
		return mt();
	}

public:

	Cromossomo(const Cromossomo& other) :
			num_in(other.num_in), num_out(other.num_out), le_num_in(
					other.le_num_in), r(other.r), c(other.c), elementos_logicos(
					other.elementos_logicos), saidas(other.saidas), mt(
					other.mt), fitness_score(other.fitness_score), feed_forward(
					other.feed_forward) {
	}

	Cromossomo& operator=(const Cromossomo& other) {
		mt = other.mt;
		fitness_score = other.fitness_score;
		num_in = other.num_in;
		num_out = other.num_out;
		le_num_in = other.le_num_in;
		r = other.r;
		c = other.c;
		elementos_logicos = other.elementos_logicos;
		saidas = other.saidas;
		feed_forward = other.feed_forward;
		return *this;
	}

	Cromossomo(std::mt19937& mt, unsigned int num_in, unsigned int num_out,
			unsigned int le_num_in, unsigned int r, unsigned int c,
			bool feed_forward = false) :
			num_in(num_in), num_out(num_out), le_num_in(le_num_in), r(r), c(c), mt(
					mt), feed_forward(feed_forward) {
		for (unsigned int i = 0; i < r; i++) {
			elementos_logicos.emplace_back(std::vector<FunctionCell>());
			for (unsigned int j = 0; j < c; j++) {
				elementos_logicos[i].emplace_back(aleatorio(j));
			}
		}

		for (unsigned int i = 0; i < num_out; i++) {
			saidas.emplace_back(aleatorio_output());
		}
	}

	Cromossomo(std::mt19937& mt, bool feed_forward, unsigned int num_in,
			unsigned int num_out, unsigned int le_num_in, unsigned int r,
			unsigned int c,
			std::vector<std::vector<FunctionCell>> elementos_logicos,
			std::vector<OutputCell> saidas) :
			num_in(num_in), num_out(num_out), le_num_in(le_num_in), r(r), c(c), elementos_logicos(
					elementos_logicos), saidas(saidas), mt(mt), feed_forward(
					feed_forward) {
	}

	std::vector<Cromossomo> gerar_filhos(const Cromossomo& outro_pai) {
		auto ponto_corte = random_func() % (r * c + num_out);
		std::vector<std::vector<FunctionCell>> elementos_logicos_filho1;
		std::vector<std::vector<FunctionCell>> elementos_logicos_filho2;
		std::vector<OutputCell> saidas_filho1;
		std::vector<OutputCell> saidas_filho2;

		unsigned int i;
		for (i = 0; i < ponto_corte; i++) {
			if (i < r * c) {
				if (i % c == 0) {
					elementos_logicos_filho1.emplace_back(
							std::vector<FunctionCell>());
					elementos_logicos_filho2.emplace_back(
							std::vector<FunctionCell>());
				}
				elementos_logicos_filho1[i / c].emplace_back(
						elementos_logicos[i / c][i % c]);
				elementos_logicos_filho2[i / c].emplace_back(
						outro_pai.elementos_logicos[i / c][i % c]);
			} else {
				int temp = i - (r * c);
				saidas_filho1.emplace_back(saidas[temp]);
				saidas_filho2.emplace_back(outro_pai.saidas[temp]);
			}
		}

		for (; i < r * c + num_out; i++) {
			if (i < r * c) {
				if (i % c == 0) {
					elementos_logicos_filho1.emplace_back(
							std::vector<FunctionCell>());
					elementos_logicos_filho2.emplace_back(
							std::vector<FunctionCell>());
				}
				elementos_logicos_filho1[i / c].emplace_back(
						outro_pai.elementos_logicos[i / c][i % c]);
				elementos_logicos_filho2[i / c].emplace_back(
						elementos_logicos[i / c][i % c]);
			} else {
				int temp = i - (r * c);
				saidas_filho1.emplace_back(outro_pai.saidas[temp]);
				saidas_filho2.emplace_back(saidas[temp]);
			}
		}

		std::vector<Cromossomo> resultado;
		resultado.push_back(
				Cromossomo(mt, feed_forward, num_in, num_out, le_num_in, r, c,
						elementos_logicos_filho1, saidas_filho1));
		resultado.push_back(
				Cromossomo(mt, feed_forward, num_in, num_out, le_num_in, r, c,
						elementos_logicos_filho2, saidas_filho2));

		return resultado;
	}

	void mutar() {
		auto ponto_a_mutar = random_func() % (r * c + num_out);
		if (ponto_a_mutar < r * c) {
			mutar_function_cell(ponto_a_mutar);
		} else {
			mutar_output_cell(ponto_a_mutar - (r * c));
		}
	}

	void mutar_function_cell(int ponto_a_mutar) {
		auto componente_a_mutar = random_func() % (le_num_in + 1);
		auto linha = ponto_a_mutar / c;
		auto coluna = ponto_a_mutar % c;
		if (componente_a_mutar == 0) {
			auto bit_a_mutar = random_func() % SAIDAS_LUT;
			elementos_logicos[linha][coluna].function ^= 1 << bit_a_mutar;
		} else {
			if (feed_forward) {
				elementos_logicos[linha][coluna].inputs[componente_a_mutar - 1] =
						random_func() % (num_in + (coluna * r));
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
		unsigned int function = random_func() % ((int) pow(2, SAIDAS_LUT));
		for (unsigned int i = 0; i < le_num_in; i++) {
			if (feed_forward) {
				inputs.push_back(random_func() % (num_in + (coluna * r)));
			} else {
				inputs.push_back(random_func() % NUM_PINOS_DISPONIVEIS);
			}
		}
		return FunctionCell(function, inputs);
	}

	OutputCell aleatorio_output() {
		return OutputCell(random_func() % NUM_PINOS_DISPONIVEIS);
	}

	std::string decodificar_entrada(unsigned int input) {
		char entrada_str[20];
		std::string retorno;

		if (input > num_in - 1) {
			input -= num_in;
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
	void criar_arquivo_verilog(std::string nome_arquivo) {
		FILE* fp = fopen(nome_arquivo.c_str(), "w");
		unsigned int i;

		fprintf(fp, "module genetico(in, out);\n");
		fprintf(fp, "\n");
		fprintf(fp, "\tinput [%d:0] in;\n", num_in - 1);
		fprintf(fp, "\toutput [%d:0] out;\n", num_out - 1);
		fprintf(fp, "\twire le_out[%d:0];\n", (r * c) - 1);
		fprintf(fp, "\n");

		fprintf(fp, "\tassign out = {");
		for (i = 0; i < num_out - 1; i++) {
			fprintf(fp, "%s, ", decodificar_entrada(saidas[i].input).c_str());
		}
		fprintf(fp, "%s", decodificar_entrada(saidas[i].input).c_str());
		fprintf(fp, "};\n\n");

		for (unsigned int j = 0; j < c; j++) {
			for (i = 0; i < r; i++) {
				fprintf(fp, "logic_e le%d%d (\n", i, j);
				fprintf(fp, "\t.func(%d'b%s),\n", SAIDAS_LUT,
						to_bit_string(elementos_logicos[i][j].function,
								SAIDAS_LUT).c_str());
				fprintf(fp, "\t.in({");
				unsigned int k;
				for (k = 0; k < le_num_in - 1; k++) {
					fprintf(fp, "%s, ",
							decodificar_entrada(
									elementos_logicos[i][j].inputs[k]).c_str());
				}
				fprintf(fp, "%s",
						decodificar_entrada(elementos_logicos[i][j].inputs[k]).c_str());
				fprintf(fp, "}),\n");

				fprintf(fp, "\t.out(le_out[%d])\n", j * c + i);
				fprintf(fp, ");\n\n");
			}
		}

		fprintf(fp, "endmodule\n");

		fclose(fp);
	}

	std::string to_bit_string(unsigned int value, unsigned int size) {
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
