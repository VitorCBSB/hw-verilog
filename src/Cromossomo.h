/*
 * Cromossomo.h
 *
 *  Created on: 13/09/2014
 *      Author: vitor
 */

#ifndef CROMOSSOMO_H_
#define CROMOSSOMO_H_

#include <bitset>
#include <array>
#include <math.h>

template<int NumIn, int NumOut, int R, int C>
class Cromossomo {
private:
	std::array<std::bitset<16 + ceil((log(R * C + NumIn) / log(2))) * 2>, R * C> elementos_logicos;
	std::array<std::bitset<ceil((log(R * C + NumIn) / log(2)))>, NumOut> saidas;

public:
	Cromossomo();
};

#endif /* CROMOSSOMO_H_ */
