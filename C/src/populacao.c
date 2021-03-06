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
		resultado.individuos[i] = cromossomo_aleatorio(params);
	}

	return resultado;
}

cromossomo melhor_individuo(const populacao* param_populacao) {
	int i;
	int max_idx = 0;
	int max_fitness = 0;

	for (i = 0; i < param_populacao->tamanho; i++) {
		if (param_populacao->individuos[i].fitness > max_fitness) {
			max_fitness = param_populacao->individuos[i].fitness;
			max_idx = i;
		}
	}

	return param_populacao->individuos[max_idx];
}

void avaliar_individuos(genetic_params params, populacao* populacao) {
	int i;
	for (i = 0; i < populacao->tamanho; i++) {
		fitness(params, &(populacao->individuos[i]));
	}
}
