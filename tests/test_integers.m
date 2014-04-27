//
//  test.cpp
//  OBME: OBfuscated MEmory
//
//  Created by Manuel Martinez-Almeida on 04/10/13.
//  Copyright 2013 Manuel Martinez-Almeida. All rights reserved.
//


#import <XCTest/XCTest.h>
#include "obme.h"


@interface TestIntegers : XCTestCase
@end

@implementation TestIntegers

- (void)testIntegers
{
	long long i = -500;
	for(; i < 1000; ++i) {
		long long obf = OBME(i);
        long long obf2 = OBME(obf);
        XCTAssertEqual(i, obf2, @"");
		printf("%lld: %lld \n", obf2, obf);
	}
}

@end


