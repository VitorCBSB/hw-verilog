/*
 * selecao.c
 *
 *  Created on: 07/05/2015
 *      Author: vitor
 */

#include "selecao.h"

populacao selecao_one_plus_lambda(genetic_params params,
		populacao* antiga_populacao) {
	populacao nova_populacao;

	// Caso nao seja a primeira populacao
	if (antiga_populacao->tamanho == 1) {
		int i;
		for (i = 1; i < 5; i++) {
			antiga_populacao->individuos[i] = mutacao(params,
					&(antiga_populacao->individuos[0]));
		}
		antiga_populacao->tamanho = 5;
	}
	nova_populacao.tamanho = 1;
	nova_populacao.individuos[0] = melhor_individuo(antiga_populacao);

	return nova_populacao;
}
