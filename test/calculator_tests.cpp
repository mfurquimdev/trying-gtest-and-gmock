#include "gtest/gtest.h"
#include "gmock/gmock.h"

#include "calculator.h"

TEST( CalculatorAdd, AddTwoIntegersReturnAnInteger )
{
	Calculator calc;

	int result = calc.Add( 2, 3 );

	ASSERT_EQ( 5, result );
}
