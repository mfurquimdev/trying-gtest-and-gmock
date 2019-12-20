#include "gtest/gtest.h"

#include <string>

class CStringComparissonFixture : public ::testing::Test
{
public:
	const char* str1;
	const char* str2;
	const char* str3;
	const char* str4;

	virtual void SetUp()
	{
		str1 = static_cast< const char* > ("abc");
		str2 = static_cast< const char* > ("abc");
		str3 = static_cast< const char* > ("cde");
		str4 = static_cast< const char* > ("CDE");
	}

	virtual void TearDown()
	{
	}
};

TEST_F( CStringComparissonFixture, AssertStringEquals )
{
	ASSERT_STREQ( str1, str2 );
	EXPECT_STREQ( str1, str2 );
}

TEST_F( CStringComparissonFixture, AssertStringNotEquals )
{
	ASSERT_STRNE( str1, str3 );
	EXPECT_STRNE( str2, str4 );
}

TEST_F( CStringComparissonFixture, AssertStringIgnoreCase )
{
	ASSERT_STRCASENE( str1, str3 );
	EXPECT_STRCASEEQ( str3, str4 );
}

