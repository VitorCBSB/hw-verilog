/*
 * Cromossomo.h
 *
 *  Created on: 13/09/2014
 *      Author: vitor
 */

#ifndef CROMOSSOMO_H_
#define CROMOSSOMO_H_

#include <bitset>
#include <array>
#include <random>
#include <string>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

template<int NumIn, int NumOut, int LENumIn, int R, int C>
class Cromossomo {
private:
	static const int BITS_TERMINAIS = ceil((log(R * C + NumIn) / log(2)));
	static const int SAIDAS_LUT = pow(2, LENumIn);
	static const int BITS_LE = SAIDAS_LUT + BITS_TERMINAIS * LENumIn;
	static const int BITS_TOTAL = R * C * BITS_LE + NumOut * BITS_TERMINAIS;

	bool feed_forward = false;
	std::array<std::bitset<BITS_LE>, R * C> elementos_logicos;
	std::array<std::bitset<BITS_TERMINAIS >, NumOut> saidas;

public:
	Cromossomo(bool feed_forward = false) : feed_forward(feed_forward) {
		for (int i = 0; i < R * C; i++) {
			elementos_logicos[i] = aleatorio<BITS_LE>();
		}
		for (int i = 0; i < NumOut; i++) {
			saidas[i] = aleatorio<BITS_TERMINAIS >();
		}
	}

	Cromossomo(std::bitset<BITS_TOTAL> cromossomo_serial) {
		construir_a_partir_de_serial(cromossomo_serial);
	}

	Cromossomo<NumIn, NumOut, LENumIn, R, C> gerar_filho(
			const Cromossomo<NumIn, NumOut, LENumIn, R, C>& outro_pai) {
		auto this_serial = cromossomo_serial();
		auto outro_serial = outro_pai.cromossomo_serial();
		auto ponto_corte = rand() % (BITS_TOTAL);
		auto mascara = criar_mascara<BITS_TOTAL>(ponto_corte);
		auto neg_mascara = ~mascara;

		auto parcial_this = this_serial & mascara;
		auto parcial_outro = outro_serial & neg_mascara;

		return Cromossomo<NumIn, NumOut, LENumIn, R, C>(
				parcial_this | parcial_outro);
	}

	void mutar() {
		auto aleatorio = rand() % (BITS_TOTAL);
		auto this_serial = cromossomo_serial();

		this_serial[aleatorio] = ~this_serial[aleatorio];

		construir_a_partir_de_serial(this_serial);
	}

	int fitness() {
		return 0;
	}

private:
	std::bitset<BITS_TOTAL> cromossomo_serial() {
		int posicao_atual = 0;
		std::bitset<BITS_TOTAL> resultado;

		for (auto& elemento_logico : elementos_logicos) {
			for (int i = 0; i < BITS_LE; i++, posicao_atual++) {
				resultado[posicao_atual] = elemento_logico[i];
			}
		}

		for (auto& saida : saidas) {
			for (int i = 0; i < BITS_TERMINAIS ; i++, posicao_atual++) {
				resultado[posicao_atual] = saida[i];
			}
		}

		return resultado;
	}

	void construir_a_partir_de_serial(std::bitset<BITS_TOTAL> cromossomo_serial) {
		int posicao_atual = 0;
		for (int i = 0; i < R * C; i++) {
			elementos_logicos[i] = std::bitset<BITS_LE>();
			for (int j = 0; j < BITS_LE; j++, posicao_atual++) {
				elementos_logicos[i][j] = cromossomo_serial[posicao_atual];
			}
		}
		for (int i = 0; i < NumOut; i++) {
			saidas[i] = std::bitset<BITS_TERMINAIS >();
			for (int j = 0; j < BITS_TERMINAIS ; j++, posicao_atual++) {
				saidas[i][j] = cromossomo_serial[posicao_atual];
			}
		}
	}

	template<int tamanho>
	std::bitset<tamanho> aleatorio() {
		std::bitset<tamanho> resultado;

		for (int i = 0; i < tamanho; i++) {
			resultado[i] = rand() % 2;
		}
		return resultado;
	}

	template<int tamanho>
	std::bitset<tamanho> criar_mascara(int ponto_corte) {
		std::bitset<tamanho> resultado;
		int i;
		for (int i = 0; i < ponto_corte; i++) {
			resultado[i] = 1;
		}
		for (; i < tamanho; i++) {
			resultado[i] = 0;
		}
	}

	template<int Tamanho, int Original>
	std::bitset<Tamanho> subbits(int inicio, std::bitset<Original> original) {
		std::bitset<Tamanho> resultado;
		for (int i = 0; i < Tamanho; i++) {
			resultado[i] = original[inicio + i];
		}
		return resultado;
	}

	std::string decodificar_entrada(std::bitset<BITS_TERMINAIS > entrada) {
		auto entrada_int = entrada.to_ulong() % (NumIn + R * C);
		char entrada_str[20];
		std::string retorno;

		if (entrada_int > NumIn - 1) {
			entrada_int -= NumIn;
			retorno = "le_out[";
		} else {
			retorno = "in[";
		}
		sprintf(entrada_str, "%lu", entrada_int);
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
			fprintf(fp, "%s, ", decodificar_entrada(saidas[i]).c_str());
		}
		fprintf(fp, "%s", decodificar_entrada(saidas[i]).c_str());
		fprintf(fp, "};\n\n");

		for (i = 0; i < R; i++) {
			for (int j = 0; j < C; j++) {
				fprintf(fp, "logic_e le%d%d (\n", i, j);
				fprintf(fp, "\t.func(%d'b%s),\n", SAIDAS_LUT,
						subbits<SAIDAS_LUT, BITS_LE>(0,
								elementos_logicos[i * R + j]).to_string().c_str());
				fprintf(fp, "\t.in({");
				int k;
				for (k = 0; k < LENumIn - 1; k++) {
					fprintf(fp, "%s, ",
							decodificar_entrada(
									subbits<BITS_TERMINAIS, BITS_LE>(
											SAIDAS_LUT + k * BITS_TERMINAIS,
											elementos_logicos[i * R + j])).c_str());
				}
				fprintf(fp, "%s",
						decodificar_entrada(
								subbits<BITS_TERMINAIS, BITS_LE>(
										SAIDAS_LUT + k * BITS_TERMINAIS,
										elementos_logicos[i * R + j])).c_str());
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
