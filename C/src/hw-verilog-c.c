/*
 ============================================================================
 Name        : hw-verilog-c.c
 Author      : Vitor Coimbra de Oliveira
 Version     :
 Copyright   : MIT
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include "cromossomo.h"
#include "populacao.h"
#include "fitness_func.h"
#include "selecao.h"

int main(void) {
	genetic_params params;
	params.r = 2;
	params.c = 2;
	params.feed_forward = 1;
	params.num_in = 2;
	params.num_out = 3;
	params.num_funcs = 3;
	params.le_num_in = 2;

	populacao populacao = populacao_aleatoria(params, 5);
	avaliar_individuos(params, &populacao);
	while (melhor_individuo(&populacao).fitness != MAX_FITNESS) {
		populacao = selecao_one_plus_lambda(params, &populacao, 4);
		avaliar_individuos(params, &populacao);
	}

	return 0;
}
