//
//  CalculatorModule.m
//  telegrapher
//
//  Created by Danilo Caetano on 7/18/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "CalculatorModule.h"

@implementation CalculatorModule

RCT_EXPORT_MODULE();

// NativeModules.CalculatorModule.processString
RCT_EXPORT_METHOD(processString:(NSString *)input callback:(RCTResponseSenderBlock)callback) {
  callback(@[[input stringByReplacingOccurrencesOfString:@"Goodbye" withString:@"Hello"]]);
}

// NativeModules.CalculatorModule.genericOperation
RCT_EXPORT_METHOD(genericOperation:(int)lhs operation:(NSString*)op rightOperand:(int)rhs callback:(RCTResponseSenderBlock)callback) {
  callback(@[@(lhs), op, @(rhs)]);
}

@end
