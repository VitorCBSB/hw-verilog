/*
 * cromossomo.h
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#ifndef CROMOSSOMO_H_
#define CROMOSSOMO_H_

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
typedef struct _cromossomo {
	char le_defs[300];
	char outs[10];
} cromossomo;


#endif /* CROMOSSOMO_H_ */
