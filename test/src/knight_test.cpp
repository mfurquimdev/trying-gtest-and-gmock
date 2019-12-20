#include <gtest/gtest.h>

#include "knight.h"
#include "vocabulary_mock.h"

using testing::Return;

TEST(KnightTests, TestingHisLoyalty)
{
	Knight knight;
	VocabularyMock vocabulary;

	EXPECT_CALL(vocabulary, Word()).WillOnce(Return(""));
	EXPECT_EQ("", knight.Say(vocabulary)) << "This is not a Knight, It's a Dothraki!!!";
}
