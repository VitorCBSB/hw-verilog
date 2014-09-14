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

#define BITS_TERMINAIS (int) ceil((log(R * C + NumIn) / log(2)))
#define SAIDAS_LUT 16
#define BITS_TOTAL R * C * (BITS_LE) + NumOut * BITS_TERMINAIS
#define BITS_LE SAIDAS_LUT + BITS_TERMINAIS * LENumIn

template<int NumIn, int NumOut, int LENumIn, int R, int C>
class Cromossomo {
public:
	std::array<std::bitset<BITS_LE>, R * C> elementos_logicos;
	std::array<std::bitset<BITS_TERMINAIS >, NumOut> saidas;

public:
	Cromossomo() {
		for (int i = 0; i < R * C; i++) {
			elementos_logicos[i] = aleatorio<BITS_LE>();
		}
		for (int i = 0; i < NumOut; i++) {
			saidas[i] = aleatorio<BITS_TERMINAIS >();
		}
	}

	Cromossomo(std::bitset<BITS_TOTAL> cromossomo_serial) {
		int posicao_atual = 0;
		for (auto& elemento_logico : elementos_logicos) {
			for (int i = 0; i < BITS_LE; i++, posicao_atual++) {
				elemento_logico[i] = cromossomo_serial[posicao_atual];
			}
		}
		for (auto& saida : saidas) {
			for (int i = 0; i < BITS_TERMINAIS ; i++, posicao_atual++) {
				saida[i] = cromossomo_serial[posicao_atual];
			}
		}
	}

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

	Cromossomo<NumIn, NumOut, LENumIn, R, C> gerar_filho(
			const Cromossomo<NumIn, NumOut, LENumIn, R, C>& outro_pai) {
		std::random_device rd;
		auto this_serial = cromossomo_serial();
		auto outro_serial = outro_pai.cromossomo_serial();
		auto ponto_corte = rd() % (BITS_TOTAL);
		auto mascara = criar_mascara<BITS_TOTAL>(ponto_corte);
		auto neg_mascara = ~mascara;

		auto parcial_this = this_serial & mascara;
		auto parcial_outro = outro_serial & neg_mascara;

		return Cromossomo<NumIn, NumOut, LENumIn, R, C>(
				parcial_this | parcial_outro);
	}

	int fitness() {
		return 0;
	}

private:
	template<int tamanho>
	std::bitset<tamanho> aleatorio() {
		std::random_device rd;
		std::bitset<tamanho> resultado;

		for (int i = 0; i < tamanho; i++) {
			resultado[i] = rd() % 2;
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
};

#endif /* CROMOSSOMO_H_ */
