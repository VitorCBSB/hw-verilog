/*
 * cromossomo.c
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#include "cromossomo.h"

cromossomo cromossomo_aleatorio(genetic_params params) {
	cromossomo resultado;
	resultado.fitness = 0;
	const int num_pinos = params.num_in + params.r * params.c;

	// Define cada LE.
	int i, j;
	for (i = 0; i < params.r; i++) {
		for (j = 0; j < params.c; j++) {
			const int current = i * params.c + j;
			resultado.logic_elements[current].function = _random_()
					% params.num_funcs;
			int k;
			for (k = 0; k <= params.le_num_in; k++) {
				const int num_pinos_ff = params.num_in + j * params.r;
				if (params.feed_forward) {
					resultado.logic_elements[current].inputs[k] = _random_()
							% num_pinos_ff;
				} else {
					resultado.logic_elements[current].inputs[k] = _random_()
							% num_pinos;
				}
			}
		}
	}

	// Define os outputs
	for (i = 0; i < params.num_out; i++) {
		resultado.outs[i] = _random_() % num_pinos;
	}

	return resultado;
}

void fitness(genetic_params params, cromossomo* individuo) {
	// Carrega o individuo no circuito
	// Amostra a saida
	// Faz a analise
	// Grava no individuo
}

// Cubra os olhos antes de entrar aqui.
cromossomo mutacao(genetic_params params, const cromossomo* a_mutar) {
	cromossomo resultado = *a_mutar;
	const int total_campos = params.r * params.c + params.num_out;
	const int total_pinos = params.r * params.c + params.num_in;

	int i, j;
	int campo_selecionado = _random_() % total_campos;
	int contador = 0;

	resultado.fitness = 0;
	for (i = 0; i < params.r; i++) {
		for (j = 0; j < params.c; j++) {
			const int current = i * params.c + j;
			if (contador == campo_selecionado) {
				int qual_campo = _random_() % (params.le_num_in + 1);
				if (qual_campo == 0) {
					resultado.logic_elements[current].function = _random_()
							% params.num_funcs;
				} else {
					qual_campo--;
					if (params.feed_forward) {
						const int num_pinos_ff = params.num_in + j * params.r;
						resultado.logic_elements[current].inputs[qual_campo] =
								_random_() % num_pinos_ff;
					} else {
						resultado.logic_elements[current].inputs[qual_campo] =
								_random_() % total_pinos;
					}
					return resultado;
				}
			}
			contador++;
		}
	}

	for (i = 0; i < params.num_out; i++) {
		if (contador == campo_selecionado) {
			resultado.outs[i] = _random_() % total_pinos;
			return resultado;
		}
		contador++;
	}

	// Nao deve chegar aqui.
	return resultado;
}
