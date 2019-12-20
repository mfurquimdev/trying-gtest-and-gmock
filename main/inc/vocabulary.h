#pragma once

#include <string>

class Vocabulary
{
public:
	Vocabulary();
	virtual ~Vocabulary();

	virtual std::string Word();

private:
	std::string m_word;
};
