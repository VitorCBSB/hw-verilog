/*
 * populacao.c
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#include "populacao.h"

populacao populacao_aleatoria(genetic_params params, int tamanho) {
	populacao resultado;
	int i;

	resultado.tamanho = tamanho;
	for (i = 0; i < tamanho; i++) {
		populacao[i] = cromossomo_aleatorio(params);
	}

	return resultado;
}
