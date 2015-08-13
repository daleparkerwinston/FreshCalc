//
//  NSMutableArray+StackExtensions.m
//  FreshCalc
//
//  Created by Dale Winston on 8/10/15.
//  Copyright © 2015 Dale Winston. All rights reserved.
//

#import "NSMutableArray+StackExtensions.h"

@implementation NSMutableArray (StackExtensions)

- (BOOL)isLastObjectString {
    if ([[self lastObject] isKindOfClass:[NSString class]]) {
        return YES;
    } else {
        return NO;
    }
}

- (id)pop {
    id lastObject = [self lastObject];
    [self removeLastObject];
    return lastObject;
}

- (id)peek {
    return [self lastObject];
}

- (void)push:(id)object {
    [self addObject:object];
}

- (NSString *)toString {
    NSString *equation = @"";
    for (int i = 0; i < [self count]; i++) {
        if ([[self objectAtIndex:i] isKindOfClass:[NSString class]]) {
            equation = [equation stringByAppendingString:[self objectAtIndex:i]];
        } else {
            equation = [equation stringByAppendingString:[[self objectAtIndex:i] stringValue]];
            
        }
    }
    NSLog(equation);
    return equation;
}

@end
