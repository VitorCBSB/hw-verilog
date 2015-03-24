//============================================================================
// Name        : hw-verilog.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <random>
#include <stdlib.h>
#include <time.h>
#include "Cromossomo.h"

int main() {
	std::mt19937 mt;
	mt.seed(time(nullptr));
	Cromossomo<4, 1, 4, 5, 5> teste(mt, true);

	teste.criar_arquivo_verilog("wow.v");

	printf("Arquivo criado com sucesso.\n");

	return 0;
}
