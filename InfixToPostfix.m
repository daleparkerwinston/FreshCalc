//
//  InfixToPostfix.m
//  PostFixCalc
//
//  Created by Dale Winston on 7/16/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import "InfixToPostfix.h"

@interface InfixToPostfix ()

@property NSMutableArray *theStack;
@property NSMutableString *postfixString;

@end

@implementation InfixToPostfix


- (NSMutableArray *)toPostfixArray:(NSMutableArray *)infixArray {
    NSMutableArray *outputQueue = [[NSMutableArray alloc] init];
    NSMutableArray *operatorStack = [[NSMutableArray alloc] init];
    
    for (id currentToken in infixArray) {
        //id currentToken = [infixArray objectAtIndex:i];
        
        //object is a number
        if ([currentToken isKindOfClass:[NSString class]]) {
            [outputQueue addObject:currentToken];
        }
        
        //object is an operator
        else if ([currentToken isParenthesis] == false){
            if ([[operatorStack peek] isKindOfClass:[Operation class]]) {
                if ([[operatorStack peek] isParenthesis] == false) {
                    if ([currentToken isLeftAssociative] == true && [currentToken precedence] <= [[operatorStack peek] precedence]) {
                        [outputQueue addObject:[operatorStack pop]];
                    } else if ([currentToken isLeftAssociative] == false && [currentToken precedence] < [[operatorStack peek] precedence]) {
                        [outputQueue addObject:[operatorStack pop]];
                    }
                }
            }
            [operatorStack push:currentToken];
        }
        
        //object is a parenthesis
        else if ([currentToken getType] == leftParanthesis) {
            [operatorStack push:currentToken];
        }
        
        else if ([currentToken getType] == rightParanthesis) {
            while ([[operatorStack peek] getType] != leftParanthesis) {
                [outputQueue addObject:[operatorStack pop]];
            }
            [operatorStack pop];
        }
    }
    
    while ([operatorStack count] > 0) {
        [outputQueue addObject:[operatorStack pop]];
    }
    return outputQueue;
}




//private methods

@end
