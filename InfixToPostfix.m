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

- (id)init {
    self = [super self];
    if (self) {
        //initialize with a marker to show empty stack
        _theStack = [[NSMutableArray alloc] initWithObjects: nil];
        _postfixString = [[NSMutableString alloc] initWithString:@""];
    }
    return self;
}

- (NSString *)toPostfixWithString:(NSString *)infixString {
    [_postfixString setString:@""];
    
    [infixString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //scan string from left to right
    for (int i = 0; i < infixString.length; i++) {
        //check for a number
        unichar currentCharacter = [infixString characterAtIndex:i];
        if ((currentCharacter >='0' && currentCharacter <='9') || currentCharacter == '.') {
            //we have a number
            [_postfixString appendString:[NSString stringWithCharacters:&currentCharacter length:1]];
        }
        else {
            //must be an operation
            
            //first end the current number by placing a '@'
            //this will seperate numbers
            
            [_postfixString appendString:@"@"];
            
            //make an Operation object
            //check what the operation is first
            NSRange range = NSMakeRange(i, 1);
            NSString *currentOperationString = [infixString substringWithRange:range];
            
            Operation *operation = [[Operation alloc] init];
            if ([currentOperationString isEqualToString:@"+"]) {
                operation.type = add;
                operation.precedence = 0;
            } else if ([currentOperationString isEqualToString:@"-"]) {
                operation.type = subtract;
                operation.precedence = 0;
            } else if ([currentOperationString isEqualToString:@"x"]) {
                operation.type = multiply;
                operation.precedence = 10;
            } else if ([currentOperationString isEqualToString:@"÷"]) {
                operation.type = divide;
                operation.precedence = 10;
            }
            
            //if the stack is empty add it to the stack
            if ([_theStack count] == 0) {
                [_theStack addObject:operation];
            }
            //the stack is not empty
            else {
                //if the top object on the stack has a lower precedence than the new operation
                //add the new operation to the stack
                
                //or else the object on the stack has a greater than or equal
                //precedence then
                //we pop the top object
                while (operation.precedence <= [[_theStack lastObject] precedence]) {
                    if ([_theStack lastObject] == nil) {
                        break;
                    }
                    //pop the last object and add it to the postfixstring
                    Operation *topObject = [_theStack lastObject];
                    [_theStack removeLastObject];
                    switch (topObject.type) {
                        case add:
                            [_postfixString appendString:@"+"];
                            break;
                        case subtract:
                            [_postfixString appendString:@"-"];
                            break;
                        case multiply:
                            [_postfixString appendString:@"x"];
                            break;
                        case divide:
                            [_postfixString appendString:@"÷"];
                            break;
                        default:
                            break;
                    }
                    [_postfixString appendString:@"@"];
                }
                [_theStack addObject:operation];
            }
        }
    }
    
    while ([_theStack count] > 0) {
        Operation *topObject = [_theStack lastObject];
        [_theStack removeLastObject];
        [_postfixString appendString:@"@"];
        switch (topObject.type) {
            case add:
                [_postfixString appendString:@"+"];
                break;
            case subtract:
                [_postfixString appendString:@"-"];
                break;
            case multiply:
                [_postfixString appendString:@"x"];
                break;
            case divide:
                [_postfixString appendString:@"÷"];
                break;
                
            default:
                break;
        }
        

    }

    return _postfixString;
}

//private methods

@end
