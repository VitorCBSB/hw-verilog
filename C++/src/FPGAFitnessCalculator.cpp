/*
 * FPGAFitnessCalculator.cpp
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#include "FPGAFitnessCalculator.h"

void FPGAFitnessCalculator::fitness(std::vector<Cromossomo>& populacao,
		int num_inputs, int le_num_inputs, int num_outputs) {
#pragma omp parallel for
	for (unsigned int i = 0; i < populacao.size(); i++) {
		compilar(populacao[i], i, le_num_inputs);
	}

	for (unsigned int i = 0; i < populacao.size(); i++) {
		carregar(i);
		populacao[i].set_fitness(fitness_calculator(receive_data(num_inputs)));
	}
}

void FPGAFitnessCalculator::compilar(const Cromossomo& cromossomo,
		int num_projeto, int le_num_inputs) {
	char project_name[100];
	sprintf(project_name, "circ_gen%d", num_projeto);
	auto project_path = std::string("Verilog/") + std::string(project_name)
			+ "/";
	gerar_arquivo_logic_e(project_path + "logic_e.v", le_num_inputs);
	cromossomo.criar_arquivo_verilog(project_path + "genetico.v");
	auto system_call = std::string("quartus_sh --flow compile ") + project_path
			+ "circ_gen > NUL";
	if (system(system_call.c_str()) != 0) {
		std::cerr << "Erro na chamada quartus_sh.\n";
		exit(1);
	}
}

void FPGAFitnessCalculator::carregar(int num_projeto) {
	char project_name[100];
	sprintf(project_name, "circ_gen%d", num_projeto);
	auto project_path = std::string("Verilog/") + std::string(project_name)
			+ "/";
	auto system_call = std::string("quartus_pgm -c USB-Blaster -m jtag -o p;")
			+ project_path + "circ_gen.sof > NUL";
	if (system(system_call.c_str()) != 0) {
		std::cerr << "Erro na chamada quartus_pgm.\n";
		exit(1);
	}
}

std::vector<std::vector<std::bitset<8>>> FPGAFitnessCalculator::receive_data(
		int num_inputs) {
	int bauds = 115200;
	int comport_num = 6;
	char mode[10] = "8N1";
	unsigned char buffer[4096];
	std::vector<std::vector<std::bitset<8>>> results;

	if (RS232_OpenComport(comport_num, bauds, mode)) {
		fprintf(stderr, "Nao consegui abrir COM port %d\n", comport_num + 1);
		exit(1);
	}

	for (int i = 0; i < (int) pow(2, num_inputs); i++) {
		int total = 0;
		RS232_SendByte(comport_num, (unsigned char) i);
		results.emplace_back(std::vector<std::bitset<8>>());

		Timer timeout_timer;
		timeout_timer.start(1000);
		while (total < NUM_SAMPLES) {
			timeout_timer.update();
			if (timeout_timer.isDone()) {
				std::cout << "TIMEOUT Detectado com " << total << " amostras coletadas." << std::endl;
				std::cout << "Replicando a ultima amostra." << std::endl;
				for (int j = total; j < NUM_SAMPLES; j++) {
					results[i].emplace_back(results[i][total - 1]);
				}
				break;
			}
			int n = RS232_PollComport(comport_num, buffer, 4096);
			if (n != 0) { // Se dados foram recebidos
				timeout_timer.start(1000);
			}
			for (int j = 0; j < n; j++, total++) {
				results[i].emplace_back(std::bitset<8>(buffer[j]));
			}
		}

		Sleep(100);
	}

	RS232_CloseComport(comport_num);
	return results;
}
