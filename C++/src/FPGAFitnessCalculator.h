/*
 * FPGAFitnessCalculator.h
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#ifndef FPGAFITNESSCALCULATOR_H_
#define FPGAFITNESSCALCULATOR_H_

#include "FitnessCalculator.h"
#include "rs232.h"
#include <thread>
#include <chrono>

#ifdef _WIN32
#include <windows.h>
#else
#include <unistd.h>
#define Sleep(x) usleep((x)*1000)
#endif

#define NUM_SAMPLES 65535

class FPGAFitnessCalculator: public FitnessCalculator {
public:
	FPGAFitnessCalculator(int num_inputs,
			std::function<int(const std::vector<std::vector<unsigned char>>&)> fitness_calculator) :
			FitnessCalculator(num_inputs, fitness_calculator) {
	}

	int fitness();
};

#endif /* FPGAFITNESSCALCULATOR_H_ */
