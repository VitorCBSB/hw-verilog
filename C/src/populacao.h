/*
 * populacao.h
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#ifndef POPULACAO_H_
#define POPULACAO_H_

#include "cromossomo.h"

typedef struct _populacao {
	cromossomo populacao[30];
	int tamanho;
} populacao;

#endif /* POPULACAO_H_ */
