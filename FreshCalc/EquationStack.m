//
//  EquationStack.m
//  FreshCalc
//
//  Created by Dale Winston on 7/28/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import "EquationStack.h"

@interface EquationStack ()

@property (nonatomic) NSMutableArray *array;

@end

@implementation EquationStack

- (id)init {
    self = [super init];
    if (self) {
       self.array  = [[NSMutableArray alloc] init];
    }
    return  self;
}

- (void)push:(id)object {
    [self.array addObject:(id)object];
}

- (id)pop {
    id lastObject = [self.array lastObject];
    [self.array removeLastObject];
    return lastObject;
}

- (id)peek {
    return [self.array lastObject];
}

- (void)clear {
    [self.array removeAllObjects];
}

- (NSUInteger)count {
    return [self.array count];
}

- (BOOL)isLastObjectNumber {
    if ([[self peek] isKindOfClass:[NSDecimalNumber class]]) {
        return YES;
    } else {
        return NO;
    }
}

- (NSString *)toString {
    NSString *equation = @"";
    NSLog([NSString stringWithFormat:@"%i", [self count]]);
    for (int i = 0; i < [self count]; i++) {
        equation = [equation stringByAppendingString:[[self.array objectAtIndex:i] stringValue]];
    }
    NSLog(equation);
    return equation;
}


@end
