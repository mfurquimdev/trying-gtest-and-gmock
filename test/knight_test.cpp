#include <gtest/gtest.h>

#include "knight.h"

TEST(FixtureName, TestName)
{
	Knight knight;

	EXPECT_EQ("Ni!", knight.Say()) << "This is not a Knight, It's a Dothraki!!!";
}
