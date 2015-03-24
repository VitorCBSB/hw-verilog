//============================================================================
// Name        : hw-verilog.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <stdlib.h>
#include <time.h>
#include "Cromossomo.h"

int main() {
	Cromossomo<4, 1, 4, 5, 5> teste(true);

	teste.criar_arquivo_verilog("wow.v");

	printf("Arquivo criado com sucesso.\n");

	return 0;
}
