//
//  EquationStack.h
//  FreshCalc
//
//  Created by Dale Winston on 7/28/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EquationStack : NSMutableArray

- (void)push:(id)object;

- (id)pop;

- (id)peek;

- (void)clear;

@end
