//
//  PostfixCalculator.m
//  PostFixCalc
//
//  Created by Dale Winston on 7/16/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import "PostfixCalculator.h"

@implementation PostfixCalculator

- (NSString *)calculateWith:(NSMutableArray *)tokens {
    
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    
    NSDecimalNumberHandler *decimalHandler = [NSDecimalNumberHandler
                                              decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:10 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO
                                              ];
    
    for (id token in tokens) {
        
        if ([token isKindOfClass:[NSString class]]) {
            [stack push:token];
        } else {
            NSDecimalNumber *num1 = [[NSDecimalNumber alloc] initWithString:[stack pop]];
            NSDecimalNumber *num2 = [[NSDecimalNumber alloc] initWithString:[stack pop]];

            switch ([token getType]) {
                case add:
                    [stack push:[NSString stringWithFormat:@"%@", [num2 decimalNumberByAdding:num1 withBehavior:decimalHandler]]];
                    break;
                case subtract:
                    [stack push:[NSString stringWithFormat:@"%@", [num2 decimalNumberBySubtracting:num1 withBehavior:decimalHandler]]];
                    break;
                case multiply:
                    [stack push:[NSString stringWithFormat:@"%@", [num2 decimalNumberByMultiplyingBy:num1 withBehavior:decimalHandler]]];
                    break;
                case divide:
                    [stack push:[NSString stringWithFormat:@"%@", [num2 decimalNumberByDividingBy:num1 withBehavior:decimalHandler]]];
                    break;
                default:
                    break;
            }
        }
    }
    
    return  [stack pop];
}

@end
