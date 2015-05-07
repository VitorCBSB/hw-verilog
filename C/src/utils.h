/*
 * utils.h
 *
 *  Created on: 07/05/2015
 *      Author: vitor
 */

#ifndef UTILS_H_
#define UTILS_H_

int absolute(int value) {
	if (value < 0) {
		return value * (-1);
	}
	return value;
}

#endif /* UTILS_H_ */
