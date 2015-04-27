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

template<typename T> std::string to_string(const T& n) {
	std::ostringstream stm;
	stm << n;
	return stm.str();
}


#endif /* UTILS_H_ */
