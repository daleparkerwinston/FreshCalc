//
//  Operation.h
//  PostFixCalc
//
//  Created by Dale Winston on 7/16/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperationType.h"

@interface Operation : NSObject

@property OperationType type;
@property int precedence;
@property BOOL isLeftAssociative;
@property BOOL isParenthesis;
@property BOOL addMultiplyOperator;

- (id)initWithType:(OperationType)operationType;

- (void)setValues;

- (NSString *)stringValue;

- (OperationType)getType;

@end