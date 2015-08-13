//
//  NSMutableArray+StackExtensions.h
//  FreshCalc
//
//  Created by Dale Winston on 8/10/15.
//  Copyright © 2015 Dale Winston. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (StackExtensions)

- (BOOL)isLastObjectString;

- (void)push:(id)object;

- (id)pop;

- (id)peek;

- (NSString *)toString;

@end
