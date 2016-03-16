//
//  BonialTests.m
//  BonialTests
//
//  Created by Johann Werner on 2016/03/10.
//  Copyright © 2016 Bonial. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DisplayItemsString.h"

@interface BonialTests : XCTestCase

@end

@implementation BonialTests


- (void)testIfCorrectGrammarIsUsedForDifferentAmountOfItems {
    NSString *expectedResultForOneItem = @"1 item";
    NSString *expectedResultForMoreThanOneItem = @"2 items";
    NSString *expectedResultForMoreZeroItem = @"0 items";
    
    NSString *resultForOneItem = [DisplayItemsString stringForItemCount:1];
    NSString *resultForTwoItems = [DisplayItemsString stringForItemCount:2];
    NSString *resultForZeroItems = [DisplayItemsString stringForItemCount:0];
    
    XCTAssertEqualObjects(expectedResultForOneItem, resultForOneItem);
    XCTAssertEqualObjects(expectedResultForMoreThanOneItem, resultForTwoItems);
    XCTAssertEqualObjects(expectedResultForMoreZeroItem, resultForZeroItems);
}

@end
