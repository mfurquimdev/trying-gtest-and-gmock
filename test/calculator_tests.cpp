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

TEST( Calculator, ComparingTwoIntegersLessThan )
{
	int a = 2;
	int b = 3;

	EXPECT_LT( a, b );
}

TEST( Calculator, ComparingTwoIntegersBoolean )
{
	Calculator calc;

	int a = 2;
	int b = 3;

	bool result = calc.LessThan( a, b );

	ASSERT_TRUE( result );
}

TEST( Calculator, ComparingTwoIntegersPredicate )
{
	int a = 3;
	int b = 2;

	ASSERT_PRED2( Calculator::GreaterThan, a, b );
}

TEST( Calculator, VerifyingWhetherNumberIsOdd )
{
	int a = 4;

	EXPECT_PRED1( Calculator::IsOddNumber, a );
}
