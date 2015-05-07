/*
 * fitness_func.c
 *
 *  Created on: 07/05/2015
 *      Author: vitor
 */

#include "fitness_func.h"

int calcular_fitness(char* results, int num_samples) {
	int soma_distancias = 0;
	soma_distancias += results[0];
	soma_distancias += absolute(results[1 * num_samples] - 1);
	soma_distancias += absolute(results[2 * num_samples] - 1);
	soma_distancias += absolute(results[3 * num_samples] - 2);
	soma_distancias += absolute(results[4 * num_samples] - 1);
	soma_distancias += absolute(results[5 * num_samples] - 2);
	soma_distancias += absolute(results[6 * num_samples] - 2);
	soma_distancias += absolute(results[7 * num_samples] - 3);
	if (soma_distancias == 0) {
		return MAX_FITNESS;
	}

	return 1000000 - soma_distancias;
}
