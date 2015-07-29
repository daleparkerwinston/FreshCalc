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
        [self setPrecedence];
    }
    return self;
}


- (void)setPrecedence {
    switch (self.type) {
        case add:
            self.precedence = 0;
            break;
        case subtract:
            self.precedence = 0;
            break;
        case multiply:
            self.precedence = 10;
            break;
        case divide:
            self.precedence = 10;
            break;
        default:
            self.precedence = -1;
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
        default:
            return @"";
            break;
    }
}

@end
