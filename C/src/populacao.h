/*
 * populacao.h
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#ifndef POPULACAO_H_
#define POPULACAO_H_

#include "cromossomo.h"
#include "genetic_params.h"

typedef struct _populacao {
	cromossomo individuos[30];
	int tamanho;
} populacao;

populacao populacao_aleatoria(genetic_params params, int tamanho);
cromossomo melhor_individuo(populacao populacao);

#endif /* POPULACAO_H_ */
