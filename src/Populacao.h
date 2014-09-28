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

template <int Tamanho>
class Populacao {
private:
	std::vector<Cromossomo<4, 1, 4, 5, 5>> populacao;
	bool acabou = false;

public:
	Populacao() {
		for (int i = 0; i < Tamanho; i++) {
			populacao.push_back(Cromossomo<4, 1, 4, 5, 5>());
		}
	}

	void proxima_geracao() {
		std::vector<Cromossomo<4, 1, 4, 5, 5>> nova_populacao;
	}
};

#endif /* POPULACAO_H_ */
