//
//  PostfixCalculator.h
//  PostFixCalc
//
//  Created by Dale Winston on 7/16/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operation.h"
#import "NSMutableArray+StackExtensions.h"

@interface PostfixCalculator : NSObject

- (NSString *)calculateWith:(NSMutableArray *)tokens;

@end
