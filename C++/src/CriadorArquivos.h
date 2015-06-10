/*
 * CriadorArquivos.h
 *
 *  Created on: 21/05/2015
 *      Author: Vitor
 */

#ifndef CRIADORARQUIVOS_H_
#define CRIADORARQUIVOS_H_

#include "Cromossomo.h"
#include "GeneticParams.h"
#include "Utils.h"
#include <vector>
#include <string>
#include <fstream>

class CriadorArquivos {
public:
	static void cria_arquivo_genetico(GeneticParams genetic_params,
			const std::string& nome_arquivo);
	static void cria_arquivo_logic_e(GeneticParams genetic_params,
			const std::string& nome_arquivo);
	static void cria_arquivo_top_icarus(GeneticParams genetic_params,
			const Cromossomo& individuo, const std::string& nome_arquivo);
	static void cria_arquivo_data_receiver(GeneticParams genetic_params);
	static void cria_arquivo_sender(GeneticParams genetic_params,
			int num_samples);
	static void cria_arquivo_main_fpga(GeneticParams genetic_params);
	static void cria_arquivo_fenotipo_main(GeneticParams genetic_params,
			const Cromossomo& individuo, const std::string& nome_arquivo);

private:
	static std::string gera_le_assigns(GeneticParams genetic_params,
			const Cromossomo& individuo);
	static std::string gera_outs_assigns(GeneticParams genetic_params,
			const Cromossomo& individuo);
	static std::string gera_le_funcs(GeneticParams genetic_params);
	static std::string gera_string_saida(GeneticParams genetic_params);
	static std::string gera_les(GeneticParams genetic_params);
	static std::string gera_le_input_assignments(GeneticParams genetic_params);
	static std::string gera_fenotipo(const Cromossomo& individuo);

};

#endif /* CRIADORARQUIVOS_H_ */
