/*
 * selection.h
 *
 *  Created on: 07/05/2015
 *      Author: vitor
 */

#ifndef SELECAO_H_
#define SELECAO_H_

#include "genetic_params.h"
#include "populacao.h"

// TODO One plus lambda
populacao selecao_one_plus_lambda(genetic_params params,
		populacao* antiga_populacao, int lambda);

// TODO Tournament

#endif /* SELECAO_H_ */
