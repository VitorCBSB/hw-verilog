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
#include <math.h>

#define BITS_TERMINAIS (int) ceil((log(R * C + NumIn) / log(2)))
#define SAIDAS_LUT 16

template<int NumIn, int NumOut, int R, int C>
class Cromossomo {
public:
	std::array<std::bitset<SAIDAS_LUT + BITS_TERMINAIS * 2>, R * C> elementos_logicos;
	std::array<std::bitset<BITS_TERMINAIS>, NumOut> saidas;

public:
	Cromossomo() {
		for (int i = 0; i < R * C; i++) {
			elementos_logicos[i] = aleatorio<SAIDAS_LUT + BITS_TERMINAIS * 2>();
		}
		for (int i = 0; i < NumOut; i++) {
			saidas[i] = aleatorio<BITS_TERMINAIS>();
		}
	}

	void gerar_filho(
			const Cromossomo<NumIn, NumOut, R, C>& outro_pai) {

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
};

#endif /* CROMOSSOMO_H_ */
