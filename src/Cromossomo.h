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
#define BITS_TOTAL R * C * (SAIDAS_LUT + BITS_TERMINAIS * 2) + NumOut * BITS_TERMINAIS

template<int NumIn, int NumOut, int R, int C>
class Cromossomo {
public:
	std::array<std::bitset<SAIDAS_LUT + BITS_TERMINAIS * 2>, R * C> elementos_logicos;
	std::array<std::bitset<BITS_TERMINAIS >, NumOut> saidas;

public:
	Cromossomo() {
		for (int i = 0; i < R * C; i++) {
			elementos_logicos[i] = aleatorio<SAIDAS_LUT + BITS_TERMINAIS * 2>();
		}
		for (int i = 0; i < NumOut; i++) {
			saidas[i] = aleatorio<BITS_TERMINAIS >();
		}
	}

	std::bitset<BITS_TOTAL> cromossomo_serial() {
		int posicao_atual = 0;
		std::bitset<BITS_TOTAL> resultado;

		for (auto& elemento_logico : elementos_logicos) {
			for (int i = 0; i < SAIDAS_LUT + BITS_TERMINAIS * 2;
					i++, posicao_atual++) {
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

	void gerar_filho(const Cromossomo<NumIn, NumOut, R, C>& outro_pai) {
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

	template<int N1, int N2>
	std::bitset<N1 + N2> concatenar(const std::bitset<N1>& bitset1,
			const std::bitset<N2>& bitset2) {
		std::string s1 = bitset1.to_string();
		std::string s2 = bitset2.to_string();
		return std::bitset<N1 + N2>(s1 + s2);
	}
};

#endif /* CROMOSSOMO_H_ */
