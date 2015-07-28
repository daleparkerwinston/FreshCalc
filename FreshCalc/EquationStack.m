//
//  EquationStack.m
//  FreshCalc
//
//  Created by Dale Winston on 7/28/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import "EquationStack.h"

@implementation EquationStack

- (id)init {
    self = [super init];
    if (self) {
        self = [[EquationStack alloc] init];
    }
    return  self;
}

- (void)push:(id)object {
    [self addObject:(id)object];
}

- (id)pop {
    id lastObject = [self lastObject];
    [self removeLastObject];
    return lastObject;
}

- (id)peek {
    return [self lastObject];
}

- (void)clear {
    [self removeAllObjects];
}


@end
