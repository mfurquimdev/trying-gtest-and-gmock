#include "gtest/gtest.h"
#include "gmock/gmock.h"

int main( int argc, char** argv )
{
	::testing::InitGoogleMock( &argc, argv );

	return RUN_ALL_TESTS();
}

TEST(ThisIsTheSuite, ThisIsTheTest)
{
	ASSERT_EQ( 4, 2+2 );
}
