//============================================================================
// Name        : hw-verilog.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <random>
#include <stdlib.h>
#include <time.h>
#include "Cromossomo.h"
#include "Populacao.h"
#include "IcarusFitnessCalculator.h"

int main() {
	std::mt19937 mt;
	mt.seed(time(nullptr));
	Populacao<20, 4, 1, 4, 5, 5> populacao(mt, true, new IcarusFitnessCalculator(4, 1,
			[](const std::vector<std::vector<std::bitset<8>>>&) -> double {
		return 0.0;
	}));

	return 0;
}
