/*
 * FitnessCalculator.h
 *
 *  Created on: 26/03/2015
 *      Author: Vitor
 */

#ifndef FITNESSCALCULATOR_H_
#define FITNESSCALCULATOR_H_

#include "Cromossomo.h"
#include <functional>
#include <string>
#include <vector>
#include <bitset>
#include <memory>
#include <iostream>
#include <fstream>
#include <math.h>

class FitnessCalculator {
protected:
	std::function<double(std::vector<std::vector<std::bitset<8>>>)>fitness_calculator;

public:
	FitnessCalculator(
			std::function<double(const std::vector<std::vector<std::bitset<8>>>&)> fitness_calculator) :
			 fitness_calculator(
					fitness_calculator) {
	}
	virtual ~FitnessCalculator() {
	}

	virtual void fitness(std::vector<Cromossomo>& populacao, int num_inputs, int le_num_inputs, int num_outputs) = 0;
	virtual std::unique_ptr<FitnessCalculator> clone() = 0;
	void gerar_arquivo_logic_e(const std::string& file_path, int le_num_inputs) {
		std::ofstream logic_e;
		logic_e.open(file_path);

		logic_e << "module logic_e(func, in, out);\n\n";

		logic_e << "\tinput [" << (int) pow(2, le_num_inputs) - 1 << ":0] func;\n";
		logic_e << "\tinput [" << le_num_inputs - 1 << ":0] in;\n";
		logic_e << "\toutput out;\n\n";

		logic_e << "\tassign out = func[in];\n\n";

		logic_e << "endmodule";
	}
};

#endif /* FITNESSCALCULATOR_H_ */
