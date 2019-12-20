#pragma once

#include "vocabulary.h"

#include "gmock/gmock.h"

class VocabularyMock : public Vocabulary
{
public:
	MOCK_METHOD0(Word, std::string());
};

