/*
 ============================================================================
 Name        : genetic_circuit.c
 Author      : Eu
 Version     :
 Copyright   : MIT
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include "rs232.h"

#define NUM_SAMPLES 65535
#define NUM_INPUTS 16

int main(void) {
	int bauds = 115200;
	int comport_num = 6;
	char mode[10] = "8N1";
	unsigned char buffer[4096];
	unsigned char results[NUM_INPUTS][NUM_SAMPLES];
	int i = 0;
	int j = 0;

	if (RS232_OpenComport(comport_num, bauds, mode)) {
		fprintf(stderr, "Nao consegui abrir COM port %d\n", comport_num + 1);
		exit(1);
	}

	FILE* output;
	if (!(output = fopen("resultado.txt", "w"))) {
		fprintf(stderr, "Nao consegui abrir o arquivo resultado.txt\n");
		exit(1);
	}

	for (i = 0; i < NUM_INPUTS; i++) {
		int total = 0;
		RS232_SendByte(comport_num, (unsigned char) i);
		while (total < NUM_SAMPLES) {
			int n = RS232_PollComport(comport_num, buffer, 4096);
			for (j = 0; j < n; j++, total++) {
				results[i][total] = buffer[j];
			}
		}

		fprintf(output, "Entrada: %d\n", i);
		fprintf(output, "Saida: ");
		for (j = 0; j < NUM_SAMPLES; j++) {
			fprintf(output, "%d ", results[i][j]);
		}
		fprintf(output, "\n");
		Sleep(1000);
	}

	fclose(output);
	RS232_CloseComport(comport_num);

	return EXIT_SUCCESS;
}
