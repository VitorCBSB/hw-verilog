/*
 * EvolutionaryStrategy.h
 *
 *  Created on: 03/04/2015
 *      Author: vitor
 */

#ifndef EVOLUTIONARYSTRATEGY_H_
#define EVOLUTIONARYSTRATEGY_H_

#include <vector>
#include "Cromossomo.h"

template<unsigned int NumIn, unsigned int NumOut, unsigned int LENumIn,
		unsigned int R, unsigned int C>
class EvolutionaryStrategy {
public:
	virtual ~EvolutionaryStrategy() {
	}

	// Um vetor vazio de argumento indica a primeira população
	// a ser gerada.
	virtual std::vector<Cromossomo<NumIn, NumOut, LENumIn, R, C>> proxima_geracao(
			const std::vector<Cromossomo<NumIn, NumOut, LENumIn, R, C>>& populacao) = 0;
};

#endif /* EVOLUTIONARYSTRATEGY_H_ */
