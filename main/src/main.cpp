#include <iostream>

#include "calculator.h"
#include "vocabulary.h"
#include "knight.h"

int main()
{
	Knight knight;
	Vocabulary vocabulary;

	std::cout << "Knight says: " << knight.Say(vocabulary) << std::endl;

	return 0;
}
