/*
 * IcarusFitnessCalculator.cpp
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#include "IcarusFitnessCalculator.h"

double IcarusFitnessCalculator::fitness() {
	system("iverilog top.v genetico.v -o individuo");

	return 0;
}
