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
#include "Timer.h"
#include <thread>
#include <fstream>
#include <chrono>
#include <stdlib.h>
#include <string>

#ifdef _WIN32
#include <windows.h>
#else
#include <unistd.h>
#define Sleep(x) usleep((x)*1000)
#endif

#define NUM_SAMPLES 65535

class FPGAFitnessCalculator: public FitnessCalculator {
public:
	FPGAFitnessCalculator(
			std::function<double(const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			FitnessCalculator(fitness_calculator) {
	}

	void fitness(std::vector<Cromossomo>& populacao, int num_inputs, int le_num_inputs, int num_outputs);
	std::unique_ptr<FitnessCalculator> clone() {
		return std::unique_ptr<FitnessCalculator>(new FPGAFitnessCalculator(*this));
	}
private:
	std::vector<std::vector<std::bitset<8>>> receive_data(int num_inputs);
	void compilar(const Cromossomo& cromossomo, int num_projeto, int le_num_inputs);
	void carregar(int num_projeto);
};

#endif /* FPGAFITNESSCALCULATOR_H_ */
