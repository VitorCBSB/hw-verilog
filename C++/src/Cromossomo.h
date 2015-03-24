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
#include <tuple>
#include <random>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>


template<unsigned int NumIn, unsigned int NumOut, unsigned int LENumIn, unsigned int R, unsigned int C>
class Cromossomo {
private:
	static const int SAIDAS_LUT = pow(2, LENumIn);
	static const int NUM_PINOS_DISPONIVEIS = NumIn + R * C;
	std::mt19937 mt;

	bool feed_forward = false;
	std::array<std::array<FunctionCell, C>, R> elementos_logicos;
	std::array<OutputCell, NumOut> saidas;

	unsigned int random_func() {
		return mt();
	}

public:
	Cromossomo(bool feed_forward = false) :
			feed_forward(feed_forward) {
		mt.seed(time(nullptr));
		for (unsigned int i = 0; i < R; i++) {
			for (unsigned int j = 0; j < C; j++) {
				elementos_logicos[i][j] = aleatorio(j);
			}
		}

		for (unsigned int i = 0; i < NumOut; i++) {
			saidas[i] = aleatorio_output();
		}
	}

	std::vector<Cromossomo<NumIn, NumOut, LENumIn, R, C>> gerar_filhos(
			const Cromossomo<NumIn, NumOut, LENumIn, R, C>& outro_pai) {
		auto ponto_corte = random_func() % (R * C + NumOut);
		std::array<std::array<FunctionCell, C>, R> elementos_logicos_filho;
		std::array<OutputCell, NumOut> saidas_filho;

		return std::vector<Cromossomo<NumIn, NumOut, LENumIn, R, C>>();
	}

	void mutar() {
		auto ponto_a_mutar = random_func() % (R * C + NumOut);
		if (ponto_a_mutar < R * C) {
			mutar_function_cell(ponto_a_mutar);
		} else {
			mutar_output_cell(ponto_a_mutar - (R * C));
		}
	}

	void mutar_function_cell(int ponto_a_mutar) {
		auto componente_a_mutar = random_func() % (LENumIn + 1);
		auto linha = ponto_a_mutar / R;
		auto coluna = ponto_a_mutar % C;
		if (componente_a_mutar == 0) {
			elementos_logicos[linha][coluna].function = random_func() % SAIDAS_LUT;
		} else {
			elementos_logicos[linha][coluna].inputs[componente_a_mutar - 1] =
					random_func() % (NumIn + (coluna * R));
		}
	}

	void mutar_output_cell(int ponto_a_mutar) {
		saidas[ponto_a_mutar] = OutputCell(random_func() % NUM_PINOS_DISPONIVEIS);
	}

	int fitness() {
		return 0;
	}

private:
	FunctionCell aleatorio(int coluna) {
		std::vector<unsigned int> inputs;
		unsigned int function = random_func() % ((int) pow(2, SAIDAS_LUT));
		printf("%d\n", function);
		for (int i = 0; i < LENumIn; i++) {
			if (feed_forward) {
				inputs.push_back(random_func() % (NumIn + (coluna * R)));
			} else {
				inputs.push_back(random_func() % NUM_PINOS_DISPONIVEIS);
			}
		}
		return FunctionCell(function, inputs);
	}

	OutputCell aleatorio_output() {
		return OutputCell(random_func() % NUM_PINOS_DISPONIVEIS);
	}

	std::string decodificar_entrada(int input) {
		char entrada_str[20];
		std::string retorno;

		if (input > NumIn - 1) {
			input -= NumIn;
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
		int i;

		fprintf(fp, "module genetico(in, out);\n");
		fprintf(fp, "\n");
		fprintf(fp, "\tinput [%d:0] in;\n", NumIn - 1);
		fprintf(fp, "\toutput [%d:0] out;\n", NumOut - 1);
		fprintf(fp, "\twire le_out[%d:0];\n", (R * C) - 1);
		fprintf(fp, "\n");

		fprintf(fp, "\tassign out = {");
		for (i = 0; i < NumOut - 1; i++) {
			fprintf(fp, "%s, ", decodificar_entrada(saidas[i].input).c_str());
		}
		fprintf(fp, "%s", decodificar_entrada(saidas[i].input).c_str());
		fprintf(fp, "};\n\n");

		for (i = 0; i < R; i++) {
			for (int j = 0; j < C; j++) {
				fprintf(fp, "logic_e le%d%d (\n", i, j);
				fprintf(fp, "\t.func(%d'b%s),\n", SAIDAS_LUT,
						std::bitset<SAIDAS_LUT>(
								elementos_logicos[i][j].function).to_string().c_str());
				fprintf(fp, "\t.in({");
				int k;
				for (k = 0; k < LENumIn - 1; k++) {
					fprintf(fp, "%s, ",
							decodificar_entrada(
									elementos_logicos[i][j].inputs[k]).c_str());
				}
				fprintf(fp, "%s",
						decodificar_entrada(elementos_logicos[i][j].inputs[k]).c_str());
				fprintf(fp, "}),\n");

				fprintf(fp, "\t.out(le_out[%d])\n", i * R + j);
				fprintf(fp, ");\n\n");
			}
		}

		fprintf(fp, "endmodule\n");

		fclose(fp);
	}
};

#endif /* CROMOSSOMO_H_ */
