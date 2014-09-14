/*
 * Populacao.h
 *
 *  Created on: 13/09/2014
 *      Author: vitor
 */

#ifndef POPULACAO_H_
#define POPULACAO_H_

#include "Cromossomo.h"
#include <vector>

class Populacao {
private:
	std::vector<Cromossomo<4, 1, 5, 5>> populacao;
public:
	Populacao();
};

#endif /* POPULACAO_H_ */
