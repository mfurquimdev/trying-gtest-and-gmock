#pragma once

#include <string>

class Vocabulary
{
public:
	virtual std::string Word();

private:
	std::string m_word;
};
