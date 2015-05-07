/*
 * utils.c
 *
 *  Created on: 07/05/2015
 *      Author: vitor
 */

#include "utils.h"

int absolute(int value) {
	if (value < 0) {
		return value * (-1);
	}
	return value;
}
