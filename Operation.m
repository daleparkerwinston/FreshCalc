//
//  Operation.m
//  PostFixCalc
//
//  Created by Dale Winston on 7/16/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import "Operation.h"

@implementation Operation

- (id)initWithType:(OperationType)operationType precedence:(int)precedence {
    self = [super init];
    if (self) {
        self.type = operationType;
        self.precedence = precedence;
    }
    return self;
}

@end
