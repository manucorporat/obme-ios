//
//  test.cpp
//  OBME: OBfuscated MEmory
//
//  Created by Manuel Martinez-Almeida on 04/10/13.
//  Copyright 2013 Manuel Martinez-Almeida. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "obme.h"


@interface TestPrimitives : XCTestCase
@end

@implementation TestPrimitives

- (void)testInt32Bits
{
    int32_t original = 10;
	int32_t value = original;

	value = OBME(value);
	printf("Obfuscated value: %d \n", value);
	value = OBME(value);
	printf("Restored value: %d \n", value);

    XCTAssertEqual(value, original, @"");
}

- (void)testInt64Bits
{
	int64_t original = 444535345454;
	int64_t value = original;

	value = OBME(value);
	printf("Obfuscated value: %lld \n", value);
	value = OBME(value);
	printf("Restored value: %lld \n", value);

    XCTAssertEqual(value, original, @"");
}

- (void)testFloat32Bits
{
	float original = 34.3253f;
    float value = original;

	value = OBME(value);
	printf("Obfuscated value: %f \n", value);
	value = OBME(value);
	printf("Restored value: %f \n", value);

    XCTAssertEqual(value, original, @"");
}

- (void)testFloat64Bits
{
	double original = 2342.785643;
	double value = original;

	value = OBME(value);
	printf("Obfuscated value: %f \n", value);
	value = OBME(value);
	printf("Restored value: %f \n", value);

    XCTAssertEqual(value, original, @"");
}

@end
