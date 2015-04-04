/*
 * FPGAFitnessCalculator.cpp
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#include "FPGAFitnessCalculator.h"

void FPGAFitnessCalculator::fitness(std::vector<Cromossomo>& populacao,
		int num_inputs, int le_num_inputs, int num_outputs) {
	int bauds = 115200;
	int comport_num = 6;
	char mode[10] = "8N1";
	unsigned char buffer[4096];
	std::vector<std::vector<std::bitset<8>>> results;

	if (RS232_OpenComport(comport_num, bauds, mode)) {
		fprintf(stderr, "Nao consegui abrir COM port %d\n", comport_num + 1);
		exit(1);
	}

	for (int i = 0; i < num_inputs; i++) {
		int total = 0;
		RS232_SendByte(comport_num, (unsigned char) i);
		results.push_back(std::vector<std::bitset<8>>(NUM_SAMPLES));
		while (total < NUM_SAMPLES) {
			int n = RS232_PollComport(comport_num, buffer, 4096);
			for (int j = 0; j < n; j++, total++) {
				results[i].push_back(std::bitset<8>(buffer[j]));
			}
		}

		Sleep(500);
	}

	RS232_CloseComport(comport_num);
}
