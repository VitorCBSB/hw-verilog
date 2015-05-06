/*
 * random.c
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#include "random.h"

int next = 42;

int _random_() {
	next = (next * 1103515245 + 12345) & RAND_MAX;
	return next;
}

void _srandom_(int seed) {
	next = seed;
}
