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
	if (RS232_OpenComport(comport_num, bauds, mode)) {
		fprintf(stderr, "Nao consegui abrir COM port %d\n", comport_num + 1);
		exit(1);
	}

	for (unsigned int i = 0; i < populacao.size(); i++) {
		enviar_individuo(comport_num, populacao[i]);
		populacao[i].set_fitness(
				fitness_calculator(receive_data(num_inputs, comport_num)));
	}

	RS232_CloseComport(comport_num);
}

void FPGAFitnessCalculator::enviar_individuo(int comport_num,
		const Cromossomo& individuo) {
	RS232_SendByte(comport_num, (unsigned char) SET_CIRCUIT);
	for (unsigned int j = 0; j < genetic_params.c; j++) {
		for (unsigned int i = 0; i < genetic_params.r; i++) {
			RS232_SendByte(comport_num,
					(unsigned char) individuo.elementos_logicos[i][j].function);
			for (unsigned int k = 0; k < genetic_params.le_num_in; k++) {
				RS232_SendByte(comport_num,
						(unsigned char) individuo.elementos_logicos[i][j].inputs[k]);
			}
		}
	}
	for (unsigned int i = 0; i < genetic_params.num_out; i++) {
		RS232_SendByte(comport_num, (unsigned char) individuo.saidas[i].input);
	}
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
		int num_inputs, int comport_num) {
	unsigned char buffer[4096];
	std::vector<std::vector<std::bitset<8>>> results;

	for (int i = 0; i < (int) pow(2, num_inputs); i++) {
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

void FPGAFitnessCalculator::cria_arquivo_data_receiver() {
	auto arquivo_modelo = le_conteudo_arquivo("data_receiver_modelo");
	std::ofstream arquivo_resultado("Verilog/circ_gen/data_receiver.v");
	const int tam_circuito = (genetic_params.r * genetic_params.c)
			* (genetic_params.le_num_in + 1) + genetic_params.num_out;
	replace(arquivo_modelo, "#tam_circuito", to_string(tam_circuito));
	arquivo_resultado << arquivo_modelo;
}

void FPGAFitnessCalculator::cria_arquivo_main() {
	auto arquivo_modelo = le_conteudo_arquivo("main_modelo");
	std::ofstream arquivo_resultado("Verilog/circ_gen/main.v");

	const int bits_func = ceil(log2(genetic_params.num_funcs()));
	const int num_les = genetic_params.r * genetic_params.c;
	const int bits_pinos = ceil(log2(num_les + genetic_params.num_in));
	const int bits_le = bits_func + bits_pinos * genetic_params.le_num_in;
	const int num_campos_le = genetic_params.le_num_in + 1;
	const int bits_bottom_le_func = bits_le - bits_func;
	const int num_outs = genetic_params.num_out;
	const int num_total_componentes_les = num_les * num_campos_le;

	replace(arquivo_modelo, "#bits_le_1", to_string(bits_le - 1));
	replace(arquivo_modelo, "#num_les_1", to_string(num_les - 1));
	replace(arquivo_modelo, "#bits_pinos_1", to_string(bits_pinos - 1));
	replace(arquivo_modelo, "#num_outs_1", to_string(num_outs - 1));
	replace(arquivo_modelo, "#num_les", to_string(num_les));
	replace(arquivo_modelo, "#bits_le_1", to_string(bits_le - 1));
	replace(arquivo_modelo, "#bits_bottom_le_func",
			to_string(bits_bottom_le_func));
	replace(arquivo_modelo, "#num_campos_le", to_string(num_campos_le));
	replace(arquivo_modelo, "#bits_func_1", to_string(bits_func - 1));
	replace(arquivo_modelo, "#circuit_le_input_assignments",
			gera_le_input_assignments());
	replace(arquivo_modelo, "#num_outs", to_string(num_outs));
	replace(arquivo_modelo, "#num_total_componentes_les",
			to_string(num_total_componentes_les));
	replace(arquivo_modelo, "#bits_pinos_1", to_string(bits_pinos - 1));

	arquivo_resultado << arquivo_modelo;
}

std::string FPGAFitnessCalculator::gera_le_input_assignments() {
	std::string resultado;
	const std::string modelo =
			std::string(
					"\t\t\tcurrent_circuit_les[i][#current_bits_max:#current_bits_min] <= ")
					+ "received_data[(i * #num_campos_le) + #current_offset][#bits_pinos_1:0];\n";

	const int num_les = genetic_params.r * genetic_params.c;
	const int bits_pinos = ceil(log2(num_les + genetic_params.num_in));
	const int num_campos_le = genetic_params.le_num_in + 1;

	for (int i = genetic_params.le_num_in; i > 0; i--) {
		std::string current_modelo = modelo;
		const int current_offset = (2 + genetic_params.le_num_in) - i;
		const int current_bits_max = (i * bits_pinos) - 1;
		const int current_bits_min = current_bits_max - (bits_pinos - 1);

		replace(current_modelo, "#current_bits_max",
				to_string(current_bits_max));
		replace(current_modelo, "#current_bits_min",
				to_string(current_bits_min));
		replace(current_modelo, "#num_campos_le", to_string(num_campos_le));
		replace(current_modelo, "#current_offset", to_string(current_offset));
		replace(current_modelo, "#bits_pinos_1", to_string(bits_pinos - 1));

		resultado += current_modelo;
	}

	return resultado;
}

void FPGAFitnessCalculator::cria_arquivo_sender() {
	auto arquivo_modelo = le_conteudo_arquivo("sender_modelo");
	std::ofstream arquivo_resultado("Verilog/circ_gen/sender.v");

	replace(arquivo_modelo, "#num_samples", to_string(num_samples));

	arquivo_resultado << arquivo_modelo;
}
