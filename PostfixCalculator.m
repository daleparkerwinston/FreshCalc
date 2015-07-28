//
//  PostfixCalculator.m
//  PostFixCalc
//
//  Created by Dale Winston on 7/16/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import "PostfixCalculator.h"

@interface PostfixCalculator ()

@property NSMutableArray *theStack;

@end

@implementation PostfixCalculator

- (id)init {
    self = [super init];
    if (self) {
        _theStack = [[NSMutableArray alloc] initWithObjects: nil];
    }
    return self;
}

- (NSString *)calculateWithString:(NSString *)postfixString {
    //first step is to make an array of tokens
    
    
    NSArray *tokens = [postfixString componentsSeparatedByString:@"@"];
    
    NSDecimalNumberHandler *decimalHandler = [NSDecimalNumberHandler
                                              decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:10 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO
                                              ];

                            
    for (int i = 0; i < tokens.count; i++) {
        NSString *theToken = [tokens objectAtIndex:i];
        if ([theToken isEqualToString:@"+"]) {
            
            NSDecimalNumber *firstNumber = [[NSDecimalNumber alloc] initWithString:[_theStack lastObject]];
            [_theStack removeLastObject];
            NSDecimalNumber *secondNumber = [[NSDecimalNumber alloc] initWithString:[_theStack lastObject]];
            [_theStack removeLastObject];
            
            NSDecimalNumber *result = [firstNumber decimalNumberByAdding:secondNumber];
            [_theStack addObject:[NSString stringWithFormat:@"%@", result]];

        } else if ([theToken isEqualToString:@"-"]) {
            
            NSDecimalNumber *firstNumber = [[NSDecimalNumber alloc] initWithString:[_theStack lastObject]];
            [_theStack removeLastObject];
            NSDecimalNumber *secondNumber = [[NSDecimalNumber alloc] initWithString:[_theStack lastObject]];
            [_theStack removeLastObject];
            
            NSDecimalNumber *result = [secondNumber decimalNumberBySubtracting:firstNumber withBehavior:decimalHandler];
            [_theStack addObject:[NSString stringWithFormat:@"%@", result]];

        } else if ([theToken isEqualToString:@"x"]) {
            
            NSDecimalNumber *firstNumber = [[NSDecimalNumber alloc] initWithString:[_theStack lastObject]];
            [_theStack removeLastObject];
            NSDecimalNumber *secondNumber = [[NSDecimalNumber alloc] initWithString:[_theStack lastObject]];
            [_theStack removeLastObject];
            
            NSDecimalNumber *result = [firstNumber decimalNumberByMultiplyingBy:secondNumber withBehavior:decimalHandler];
            [_theStack addObject:[NSString stringWithFormat:@"%@", result]];
            
        } else if ([theToken isEqualToString:@"÷"]) {
            
            NSDecimalNumber *firstNumber = [[NSDecimalNumber alloc] initWithString:[_theStack lastObject]];
            [_theStack removeLastObject];
            NSDecimalNumber *secondNumber = [[NSDecimalNumber alloc] initWithString:[_theStack lastObject]];
            [_theStack removeLastObject];
            
            NSDecimalNumber *result = [secondNumber decimalNumberByDividingBy:firstNumber withBehavior:decimalHandler];
            
            if ([result isEqualToNumber:[NSDecimalNumber notANumber]]) {
                return @"∞";
            } else {
                [_theStack addObject:[NSString stringWithFormat:@"%@", result]];
            }
        }
        
        //The token is a number so push to the stack
        else {
            [_theStack addObject:theToken];
        }
    }
    
    //second step is to read through array
    
    //if token is a number, add to stack
    
    //if token is an operation, pop last two numbers
    //calculate then push the result
    
    //return the only value left after all tokens have been read
    
    return [_theStack lastObject];
}

@end
