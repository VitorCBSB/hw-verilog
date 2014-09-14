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

#define BITS_TERMINAIS ceil((log(R * C + NumIn) / log(2)))
#define SAIDAS_LUT 16

template<int NumIn, int NumOut, int R, int C>
class Cromossomo {
private:
	std::array<std::bitset<SAIDAS_LUT + BITS_TERMINAIS * 2>, R * C> elementos_logicos;
	std::array<std::bitset<BITS_TERMINAIS>, NumOut> saidas;

public:
	Cromossomo();
};

#endif /* CROMOSSOMO_H_ */
