/*
 * FPGAFitnessCalculator.cpp
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#include "FPGAFitnessCalculator.h"

void FPGAFitnessCalculator::fitness(std::vector<Cromossomo>& populacao) {
	int bauds = 115200;
	int comport_num = 6;
	char mode[10] = "8N1";
	if (RS232_OpenComport(comport_num, bauds, mode)) {
		fprintf(stderr, "Nao consegui abrir COM port %d\n", comport_num + 1);
		exit(1);
	}

	for (unsigned int i = 0; i < populacao.size(); i++) {
		enviar_individuo(comport_num, populacao[i]);
		populacao[i].set_fitness(
				fitness_calculator(receive_data(comport_num)));
	}

	RS232_CloseComport(comport_num);
}

void FPGAFitnessCalculator::enviar_individuo(int comport_num,
		const Cromossomo& individuo) {
	RS232_SendByte(comport_num, (unsigned char) SET_CIRCUIT);

	auto descricao_les = individuo.descricao_les();
	auto descricao_outs = individuo.descricao_outs();

	RS232_SendBuf(comport_num, &descricao_les[0], descricao_les.size());
	RS232_SendBuf(comport_num, &descricao_outs[0], descricao_outs.size());
}

void FPGAFitnessCalculator::compilar() {
	auto system_call = std::string(
			"quartus_map Verilog/circ_gen/circ_gen > NUL");
	if (system(system_call.c_str()) != 0) {
		std::cerr << "Erro na chamada quartus_map.\n";
		exit(1);
	}
	system_call = std::string("quartus_fit Verilog/circ_gen/circ_gen > NUL");
	if (system(system_call.c_str()) != 0) {
		std::cerr << "Erro na chamada quartus_fit.\n";
		exit(1);
	}
	system_call = std::string("quartus_asm Verilog/circ_gen/circ_gen > NUL");
	if (system(system_call.c_str()) != 0) {
		std::cerr << "Erro na chamada quartus_asm.\n";
		exit(1);
	}
}

void FPGAFitnessCalculator::carregar() {
	auto project_path = std::string("Verilog/circ_gen/");
	auto system_call = std::string("quartus_pgm -c USB-Blaster -m jtag -o p;")
			+ project_path + "circ_gen.sof > NUL";
	if (system(system_call.c_str()) != 0) {
		std::cerr << "Erro na chamada quartus_pgm.\n";
		exit(1);
	}
}

std::vector<std::vector<std::bitset<8>>> FPGAFitnessCalculator::receive_data(
		int comport_num) {
	unsigned char buffer[4096];
	std::vector<std::vector<std::bitset<8>>> results;

	for (int i = 0; i < (int) pow(2, genetic_params.num_in); i++) {
		unsigned int total = 0;
		RS232_SendByte(comport_num, (unsigned char) SET_VALUE);
		RS232_SendByte(comport_num, (unsigned char) i);
		results.emplace_back(std::vector<std::bitset<8>>());

		Timer timeout_timer;
		timeout_timer.start(1000);
		while (total < num_samples) {
			timeout_timer.update();
			if (timeout_timer.isDone()) {
				std::cout << "TIMEOUT Detectado com " << total << " amostras coletadas." << std::endl;
				std::cout << "Replicando a ultima amostra." << std::endl;
				for (unsigned int j = total; j < num_samples; j++) {
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

	return results;
}

