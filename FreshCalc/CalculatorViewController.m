//
//  CalculatorViewController.m
//  FreshCalc
//
//  Created by Dale Winston on 7/27/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tapeLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (nonatomic) InfixToPostfix *infixToPostfix;
@property (nonatomic) PostfixCalculator *postfixCalculator;

@property (nonatomic) NSMutableArray *equationTokens;

@property (nonatomic) BOOL addRightParenthesis;

@end



@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeObjects];
}

- (void)initializeObjects {
    self.infixToPostfix = [[InfixToPostfix alloc] init];
    self.postfixCalculator = [[PostfixCalculator alloc] init];
    self.equationTokens = [[NSMutableArray alloc] init];
    [self clearLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Button Presses
- (IBAction)integerPressed:(UIButton *)sender {
    NSString *newNumberString = [[NSString alloc] init];
    if ([self.equationTokens isLastObjectString]) {
        newNumberString = [self.equationTokens pop];
        newNumberString = [newNumberString stringByAppendingString:sender.currentTitle];
    } else {
        newNumberString = sender.currentTitle;
    }
    
    [self updateWithNumber:newNumberString];
}

- (IBAction)zeroPressed:(UIButton *)sender {
    [self integerPressed:sender];
}

- (IBAction)decimalPressed:(UIButton *)sender {
    NSString *newNumberString = [[NSString alloc] init];
    if ([self.equationTokens isLastObjectString]) {
        newNumberString = [self.equationTokens pop];
        if ([newNumberString containsString:sender.currentTitle] == NO) {
            newNumberString = [newNumberString stringByAppendingString:sender.currentTitle];
        }
    } else {
        newNumberString = sender.currentTitle;
    }
    
    [self updateWithNumber:newNumberString];
}

- (IBAction)equalPressed:(UIButton *)sender {
}
- (IBAction)additionPressed:(UIButton *)sender {
    [self updateWithOperation:add];
}
- (IBAction)subtractPressed:(UIButton *)sender {
    [self updateWithOperation:subtract];
}
- (IBAction)multiplyPressed:(UIButton *)sender {
    [self updateWithOperation:multiply];
}
- (IBAction)dividePressed:(UIButton *)sender {
    [self updateWithOperation:divide];
}
- (IBAction)leftParanthesisPressed:(UIButton *)sender {
    self.addRightParenthesis = YES;
    [self updateWithParenthesis:leftParanthesis];
}
- (IBAction)rightParanthesisPressed:(UIButton *)sender {
    self.addRightParenthesis = NO;
    [self updateWithParenthesis:rightParanthesis];
}
- (IBAction)postiveNegativePressed:(UIButton *)sender {
}
- (IBAction)percentPressed:(UIButton *)sender {
}
- (IBAction)deletePressed:(UIButton *)sender {
    if ([self.equationTokens count] > 0) {
        if ([self.equationTokens isLastObjectString]) {
            if ([[self.equationTokens peek] length] >1) { //remove right digit from number
                NSString *newNumber = [self.equationTokens pop];
                newNumber = [newNumber substringToIndex:[newNumber length] - 1];
                [self updateWithNumber:newNumber];
                
            } else if ([self.equationTokens count] > 1) { // to show previous result without operation
                [self.equationTokens pop];
                [self printTape];
                Operation *temp = [self.equationTokens pop];
                [self printResult];
                [self.equationTokens push:temp];
            } else { //only 1 number left with one digit so clear stack and labels
                [self.equationTokens pop];
                [self clearLabels];
            }
        } else { //last object in stack was an operation, just delete the operation from stack and label, result is the same
            [self.equationTokens pop];
            [self printTape];
        }
    }
}


//Helper Methods
- (void)updateWithNumber:(NSString *) numberString {
    [self.equationTokens push:numberString];
    [self printTape];
    [self printResult];
}

- (void)updateWithOperation:(OperationType) operationType {
    if ([self.equationTokens isLastObjectString] || [[self.equationTokens peek] isParenthesis]) {
        Operation *operation = [[Operation alloc] initWithType:operationType];
        [self.equationTokens push:operation];
        [self printTape];
    }
}

- (void)updateWithParenthesis:(OperationType) operationType {
    
    Operation *operation = [[Operation alloc] initWithType:operationType];
    [self.equationTokens push:operation];
    [self printTape];
}

- (void)printTape {
    self.tapeLabel.text = [self.equationTokens toString];
}

- (void)printResult {
    if (self.addRightParenthesis == YES) {
        [self.equationTokens push:[[Operation alloc] initWithType:rightParanthesis]];
    }
    NSString *result = [self.postfixCalculator calculateWith:[self.infixToPostfix  toPostfixArray:self.equationTokens]];
    if (![result compare:@"NaN"]) {
        result = @"Error";
    }
    self.resultLabel.text = result;
    
    if (self.addRightParenthesis == YES) {
        [self.equationTokens pop];
    }
}

- (void)clearLabels {
    self.tapeLabel.text = @"";
    self.resultLabel.text = @"";
    self.addRightParenthesis = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
