//
//  OperationType.h
//  PostFixCalc
//
//  Created by Dale Winston on 7/16/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#ifndef PostFixCalc_OperationType_h
#define PostFixCalc_OperationType_h

typedef enum {
    add,
    subtract,
    multiply,
    divide,
    leftParanthesis,
    rightParanthesis,
    positiveNegative,
    percent
} OperationType;

#endif
