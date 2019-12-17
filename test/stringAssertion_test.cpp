#include "gtest/gtest.h"

#include <string>

TEST( CStringsComparing, AssertStringEquals )
{
	const char* str1 = "abc";
	const char* str2 = "abc";
	const char* str3 = "cde";
	const char* str4 = "cde";

	ASSERT_STREQ( str1, str2 );
	EXPECT_STREQ( str3, str4 );
}

TEST( CStringsComparing, AssertStringNotEquals )
{
	const char* str1 = "abc";
	const char* str2 = "cde";
	const char* str3 = "CDE";

	ASSERT_STRNE( str1, str2 );
	EXPECT_STRNE( str1, str3 );
}

TEST( CStringsComparing, AssertStringIgnoreCase )
{
	const char* str1 = "abc";
	const char* str2 = "cde";
	const char* str3 = "CDE";

	ASSERT_STRCASENE( str1, str2 );
	EXPECT_STRCASEEQ( str2, str3 );
}

