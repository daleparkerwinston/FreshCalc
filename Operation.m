//
//  Operation.m
//  PostFixCalc
//
//  Created by Dale Winston on 7/16/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import "Operation.h"

@interface Operation ()

@end

@implementation Operation

- (id)initWithType:(OperationType)operationType {
    self = [super init];
    if (self) {
        self.type = operationType;
        [self setValues];
    }
    return self;
}


- (void)setValues {
    switch (self.type) {
        case add:
            self.precedence = 0;
            self.isLeftAssociative = true;
            self.isParenthesis = false;
            break;
        case subtract:
            self.precedence = 0;
            self.isLeftAssociative = true;
            self.isParenthesis = false;
            break;
        case multiply:
            self.precedence = 10;
            self.isLeftAssociative = true;
            self.isParenthesis = false;
            break;
        case divide:
            self.precedence = 10;
            self.isLeftAssociative = true;
            self.isParenthesis = false;
            break;
        case leftParanthesis:
            self.precedence = -1;
            self.isLeftAssociative = false;
            self.isParenthesis = true;
            break;
        case rightParanthesis:
            self.precedence = -1;
            self.isLeftAssociative = false;
            self.isParenthesis = true;
            break;
        default:
            self.precedence = -1;
            self.isLeftAssociative = false;
            self.isParenthesis = false;
            break;
    }
}

- (NSString *)stringValue {
    switch (self.type) {
        case add:
            return @"+";
            break;
        case subtract:
            return @"-";
            break;
        case multiply:
            return @"x";
            break;
        case divide:
            return @"÷";
            break;
        case leftParanthesis:
            return @"(";
            break;
        case rightParanthesis:
            return @")";
            break;
        default:
            return @"";
            break;
    }
}

- (OperationType)getType {
    return [self type];
}

@end
