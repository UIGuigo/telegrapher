//
//  CalculatorBridge.m
//  telegrapher
//
//  Created by Danilo Caetano on 7/18/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "CalculatorBridge.h"

@implementation CalculatorBridge

RCT_EXPORT_MODULE();

/*
 RCT_EXPORT_METHOD supports all standard JSON object types, such as:
 - string (NSString)
 - number (NSInteger, float, double, CGFloat, NSNumber)
 - boolean (BOOL, NSNumber)
 - array (NSArray) of any types from this list
 - object (NSDictionary) with string keys and values of any type from this list
 - function (RCTResponseSenderBlock)
 */

RCT_EXPORT_METHOD(greet:(NSString *)name) {
  NSLog(@"Hi, %@!", name);
}

RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback) {
  NSArray *events = @[@"reset"];
  callback(@[[NSNull null], events]);
}

RCT_EXPORT_METHOD(resetResults:(RCTResponseSenderBlock)callback) {
  NSArray *events = @[@YES];
  callback(@[[NSNull null], events]);
}


@end
