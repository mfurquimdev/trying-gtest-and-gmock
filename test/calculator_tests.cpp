#include "gtest/gtest.h"
#include "gmock/gmock.h"

#include "calculator.h"

TEST( CalculatorAdd, AddTwoIntegersReturnAnInteger )
{
	Calculator calc;

	int result = calc.Add( 2, 3 );

	ASSERT_EQ( 5, result );
}

TEST( CalculatorAdd, DISABLED_AddTwoNumbersReturnWrongResult )
{
	Calculator calc;

	int result = calc.Add( 2, 2 );

	ASSERT_EQ( 6, result );
}
