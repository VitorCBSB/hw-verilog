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
#include "math.h"
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

class FPGAFitnessCalculator: public FitnessCalculator {
private:
	GeneticParams genetic_params;
	unsigned int num_samples;
public:
	FPGAFitnessCalculator(GeneticParams genetic_params, unsigned int num_samples,
			std::function<double(const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			FitnessCalculator(fitness_calculator), genetic_params(genetic_params), num_samples(num_samples) {
		cria_arquivo_genetico();
		cria_arquivo_logic_e();
		cria_arquivo_data_receiver();
		cria_arquivo_sender();
		cria_arquivo_main();
		compilar();
		carregar();
	}

	void fitness(std::vector<Cromossomo>& populacao, int num_inputs, int le_num_inputs, int num_outputs);
	std::unique_ptr<FitnessCalculator> clone() {
		return std::unique_ptr<FitnessCalculator>(new FPGAFitnessCalculator(*this));
	}
private:
	std::vector<std::vector<std::bitset<8>>> receive_data(int num_inputs, int comport_num);
	void compilar();
	void carregar();
	void cria_arquivo_genetico();
	void cria_arquivo_logic_e();
	void cria_arquivo_data_receiver();
	void cria_arquivo_sender();
	void cria_arquivo_main();
	std::string gera_string_saida();
	std::string gera_les();
	std::string gera_le_input_assignments();
	void enviar_individuo(int comport_num, const Cromossomo& individuo);

	enum Message {
		SET_VALUE = 0,
		SET_CIRCUIT = 1
	};
};

#endif /* FPGAFITNESSCALCULATOR_H_ */
