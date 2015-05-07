/*
 * cromossomo.h
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#ifndef CROMOSSOMO_H_
#define CROMOSSOMO_H_

#include "random.h"
#include "genetic_params.h"

/*
 * Cada byte da le_defs e responsavel por um
 * campo distinto do elemento logico, dentre eles:
 *
 * 	- Funcao
 * 	- Entradas
 *
 * Para cada elemento. Ou seja, se o le tem
 * 2 entradas, os bytes ocupados serao 3.
 *
 * 	1 para funcao + 2 para entradas
 */
typedef struct _logic_elem {
	char function;
	char inputs[4];
} logic_element;

typedef struct _cromossomo {
	logic_element logic_elements[25];
	char outs[10];
	int fitness;
} cromossomo;

cromossomo cromossomo_aleatorio(genetic_params params);
cromossomo mutacao(genetic_params params, const cromossomo* a_mutar);
void fitness(genetic_params params, cromossomo* individuo);

#endif /* CROMOSSOMO_H_ */
