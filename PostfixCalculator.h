//
//  PostfixCalculator.h
//  PostFixCalc
//
//  Created by Dale Winston on 7/16/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostfixCalculator : NSObject

- (id)init;

- (NSString *)calculateWithString:(NSString *)postfixString;

@end
