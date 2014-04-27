//
//  test.cpp
//  OBME: OBfuscated MEmory
//
//  Created by Manuel Martinez-Almeida on 04/10/13.
//  Copyright 2013 Manuel Martinez-Almeida. All rights reserved.
//


#include <XCTest/XCTest.h>
#include "obme.h"




@interface TestScore : XCTestCase
{
    float _score;
}
@end

@implementation TestScore

- (void)setUp
{
    [super setUp];
    _score = OBME(0.0f);
}


- (void)addScore:(float)add
{
	_score = OBME(OBME(_score) + add);
	printf("Adding %f\n",add);
	printf("Value in memory: %f\n\n", _score);
}


- (void)testScore
{
    float score1 = 100;
    float score2 = 110;
    float score3 = 210;

    [self addScore:score1];
    [self addScore:score2];
    [self addScore:score3];

    float result = score1 + score2 + score3;
    XCTAssertEqual(result, OBME(_score), @"");
    
	printf("0+%.1f+%.1f+%.1f = %.1f\n", score1, score2, score3, result);
	printf("Print score: %f\n", OBME(_score));
}

@end
