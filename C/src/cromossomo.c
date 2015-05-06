/*
 * cromossomo.c
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#include "cromossomo.h"

cromossomo cromossomo_aleatorio(genetic_params params) {
	cromossomo resultado;
	const int num_pinos = params.num_in + params.r * params.c;
	const int num_tamanho_le = params.le_num_in + 1; // em bytes

	// Define cada LE.
	int i;
	for (i = 0; i < params.r; i++) {
		int j;
		for (j = 0; j < params.c; j++) {
			const int current = i * params.c + j;
			resultado.le_defs[num_tamanho_le * current] = _random_()
					% params.num_funcs;
			int k;
			for (k = 1; k <= params.le_num_in; k++) {
				const int num_pinos_ff = params.num_in + j * params.r;
				if (params.feed_forward) {
					resultado.le_defs[num_tamanho_le * current + k] =
							_random_() % num_pinos_ff;
				} else {
					resultado.le_defs[num_tamanho_le * current + k] =
							_random_() % num_pinos;
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

