/*
 * GeneticParams.h
 *
 *  Created on: 08/05/2015
 *      Author: Vitor
 */

#ifndef GENETICPARAMS_H_
#define GENETICPARAMS_H_

class GeneticParams {
public:
	unsigned int num_in;
	unsigned int num_out;
	unsigned int le_num_in;
	unsigned int r;
	unsigned int c;
	unsigned int num_funcs;
	bool feed_forward;

	GeneticParams(unsigned int num_in, unsigned int num_out,
			unsigned int num_funcs, unsigned int le_num_in, unsigned int r,
			unsigned int c, bool feed_forward) :
			num_in(num_in), num_out(num_out), num_funcs(num_funcs), le_num_in(
					le_num_in), r(r), c(c), feed_forward(feed_forward) {
	}
};

#endif /* GENETICPARAMS_H_ */
