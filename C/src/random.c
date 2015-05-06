/*
 * random.c
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#include "random.h"

int next = 42;

int random() {
	next = (next * 1103515245 + 12345) & RAND_MAX;
	return 0;
}

void srandom(int seed) {
	next = seed;
}
