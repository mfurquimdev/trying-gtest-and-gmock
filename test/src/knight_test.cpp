#include <gtest/gtest.h>

#include "knight.h"
#include "vocabulary_mock.h"

TEST(KnightTests, TestingHisLoyalty)
{
	Knight knight;
	VocabularyMock vocabulary;

	EXPECT_EQ("Lo!", knight.Say(vocabulary)) << "This is not a Knight, It's a Dothraki!!!";
}
