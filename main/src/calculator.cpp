#include "calculator.h"

int
Calculator::Add( int a, int b )
{
	return a + b;
}

bool
Calculator::LessThan( int a, int b )
{
	return a < b;
}

bool
Calculator::GreaterThan( int a, int b )
{
	return a > b;
}

bool
Calculator::IsOddNumber( int a )
{
	return a % 2 ? false : true;
}
