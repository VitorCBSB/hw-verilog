/*
 * FPGAFitnessCalculator.cpp
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#include "FPGAFitnessCalculator.h"

int FPGAFitnessCalculator::fitness() {
	int bauds = 115200;
	int comport_num = 6;
	char mode[10] = "8N1";
	unsigned char buffer[4096];
	std::vector<std::vector<unsigned char>> results;

	if (RS232_OpenComport(comport_num, bauds, mode)) {
		fprintf(stderr, "Nao consegui abrir COM port %d\n", comport_num + 1);
		exit(1);
	}

	for (int i = 0; i < num_inputs; i++) {
		int total = 0;
		RS232_SendByte(comport_num, (unsigned char) i);
		results.push_back(std::vector<unsigned char>(NUM_SAMPLES));
		while (total < NUM_SAMPLES) {
			int n = RS232_PollComport(comport_num, buffer, 4096);
			for (int j = 0; j < n; j++, total++) {
				results[i].push_back(buffer[j]);
			}
		}

		Sleep(500);
	}

	RS232_CloseComport(comport_num);

	return fitness_calculator(results);
}
