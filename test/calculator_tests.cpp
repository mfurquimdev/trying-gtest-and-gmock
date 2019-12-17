#include "gtest/gtest.h"

#include "calculator.h"

TEST( Calculator, AddTwoIntegersReturnAnInteger )
{
	Calculator calc;

	int result = calc.Add( 2, 3 );

	ASSERT_EQ( 5, result );
}

TEST( Calculator, DISABLED_AddTwoNumbersReturnWrongResult )
{
	Calculator calc;

	int result = calc.Add( 2, 2 );

	ASSERT_EQ( 6, result );
}

TEST( Calculator, FirstIntegerIsLessThanSecondInteger )
{
	Calculator calc;

	int a = 2;
	int b = 3;

	bool result = calc.LessThan( a, b );

	EXPECT_LT( a, b );
	ASSERT_TRUE( result );
}
