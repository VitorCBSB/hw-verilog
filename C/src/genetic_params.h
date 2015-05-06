/*
 * genetic_params.h
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#ifndef GENETIC_PARAMS_H_
#define GENETIC_PARAMS_H_

typedef struct _genetic_params {
	int r;
	int c;
	int num_in;
	int num_out;
	int num_funcs;
	int le_num_in;
	int feed_forward; // Booleano
} genetic_params;


#endif /* GENETIC_PARAMS_H_ */
