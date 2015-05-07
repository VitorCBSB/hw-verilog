/*
 * random.h
 *
 *  Created on: 06/05/2015
 *      Author: vitor
 */

#ifndef RANDOM_H_
#define RANDOM_H_

#define RAND_MAX ((1U << 31) - 1)

unsigned long _random_();
void _srandom_(unsigned long seed);

#endif /* RANDOM_H_ */
