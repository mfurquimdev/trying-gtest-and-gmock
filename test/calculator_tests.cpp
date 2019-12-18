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

struct CalculatorTestRow
{
	CalculatorTestRow( int input, bool expected ) : input(input), expected(expected)
	{
	}

	int input;
	bool expected;
};

::std::ostream& operator<<( ::std::ostream& os, const CalculatorTestRow& row )
{
	return os << "Input: " << row.input << " expected result: " << row.expected;
}

class CalculatorTests : public ::testing::TestWithParam< CalculatorTestRow >
{
};

TEST_P( CalculatorTests, VariousNumbersAreOdd )
{
	auto row = GetParam();

	auto result = Calculator::IsOddNumber( row.input );

	ASSERT_EQ( row.expected, result );
}

INSTANTIATE_TEST_CASE_P( NumberIsOdd, CalculatorTests,
	::testing::Values(
		CalculatorTestRow( 2, true ),
		CalculatorTestRow( 3, false ),
		CalculatorTestRow( 4, true )
	)
);
