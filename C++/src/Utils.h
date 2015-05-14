/*
 * Utils.h
 *
 *  Created on: 26/04/2015
 *      Author: Vitor
 */

#ifndef UTILS_H_
#define UTILS_H_

#include <string>
#include <sstream>
#include <fstream>


template<typename T>
std::string to_string(const T& n) {
	std::ostringstream stm;
	stm << n;
	return stm.str();
}

void replace(std::string& source, const std::string& to_replace,
		const std::string& replace_with);

std::string le_conteudo_arquivo(const std::string& nome_arquivo);

#endif /* UTILS_H_ */
