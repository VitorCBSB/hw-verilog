/*
 * Utils.cpp
 *
 *  Created on: 14/05/2015
 *      Author: vitor
 */

#include "Utils.h"

void replace(std::string& source, const std::string& to_replace,
		const std::string& replace_with) {
	source.replace(source.find(to_replace), to_replace.length(), replace_with);
}

std::string le_conteudo_arquivo(const std::string& nome_arquivo) {
	std::ifstream arquivo_modelo(nome_arquivo);
	std::stringstream buffer;
	buffer << arquivo_modelo.rdbuf();
	return buffer.str();
}


