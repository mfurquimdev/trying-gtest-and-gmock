#include <gtest/gtest.h>

#include "knight.h"

TEST(SuiteTestName, TestName)
{
	Knight knight;

	ASSERT_EQ("Ni!", knight.Say());
}
