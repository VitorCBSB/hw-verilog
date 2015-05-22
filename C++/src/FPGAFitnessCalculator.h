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
#include "GeneticParams.h"
#include "Timer.h"
#include "Utils.h"
#include "CriadorArquivos.h"
#include <math.h>
#include <fstream>
#include <chrono>
#include <stdlib.h>
#include <string>
#include <vector>

#ifdef _WIN32
#include <windows.h>
#else
#include <unistd.h>
#define Sleep(x) usleep((x)*1000)
#endif

class FPGAFitnessCalculator: public FitnessCalculator {
private:
	unsigned int num_samples;
public:
	FPGAFitnessCalculator(GeneticParams genetic_params,
			unsigned int num_samples,
			std::function<double(const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			FitnessCalculator(genetic_params, fitness_calculator), num_samples(num_samples) {
		CriadorArquivos::cria_arquivo_genetico(genetic_params, "Verilog/circ_gen/genetico.v");
		CriadorArquivos::cria_arquivo_logic_e(genetic_params, "Verilog/circ_gen/logic_e.v");
		CriadorArquivos::cria_arquivo_data_receiver(genetic_params);
		CriadorArquivos::cria_arquivo_sender(genetic_params, num_samples);
		CriadorArquivos::cria_arquivo_main(genetic_params);
		compilar();
		carregar();
	}

	void fitness(std::vector<Cromossomo>& populacao);
	std::unique_ptr<FitnessCalculator> clone() {
		return std::unique_ptr<FitnessCalculator>(new FPGAFitnessCalculator(*this));
	}
private:
	std::vector<std::vector<std::bitset<8>>> receive_data(int comport_num);
	void compilar();
	void carregar();
	void enviar_individuo(int comport_num, const Cromossomo& individuo);

	enum Message {
		SET_VALUE = 0,
		SET_CIRCUIT = 1
	};
};

#endif /* FPGAFITNESSCALCULATOR_H_ */
