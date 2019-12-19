#pragma once

#include "vocabulary.h"

class VocabularyMock : public Vocabulary
{
public:
	std::string Word() override {
		return "Lo!";
	}
};

