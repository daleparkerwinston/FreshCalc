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

@property (nonatomic) EquationStack *equationTokens;

@property (nonatomic) NSString *currentNumberString;

@property (nonatomic) BOOL addDecimal;



@end



@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeObjects];
}

- (void)initializeObjects {
    self.infixToPostfix = [[InfixToPostfix alloc] init];
    self.postfixCalculator = [[PostfixCalculator alloc] init];
    self.equationTokens = [[EquationStack alloc] init];
    
    self.currentNumberString = @"";
    self.addDecimal = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Button Presses
- (IBAction)integerPressed:(UIButton *)sender {
    NSDecimalNumber *newNumber = [[NSDecimalNumber alloc]init];
    if ([self.equationTokens isLastObjectNumber]) {
        NSString *lastNumber = [[self.equationTokens pop] stringValue];
        lastNumber = [lastNumber stringByAppendingString:sender.currentTitle];
        newNumber = [NSDecimalNumber decimalNumberWithString:lastNumber];
    } else if (self.addDecimal == YES) {
        NSString *withDecimal = [NSString stringWithFormat:@".%@", sender.currentTitle];
        newNumber = [NSDecimalNumber decimalNumberWithString:withDecimal];
    }
    else {
        newNumber = [NSDecimalNumber decimalNumberWithString:sender.currentTitle];
    }
    
    [self.equationTokens push:newNumber];
    [self printTape];
    [self printResult];
}

- (IBAction)zeroPressed:(UIButton *)sender {
    [self integerPressed:sender];
}

- (IBAction)decimalPressed:(UIButton *)sender {
    if ([self.equationTokens isLastObjectNumber]) {
        NSDecimalNumber *newNumber = [[NSDecimalNumber alloc] init];
        NSString *lastNumber = [[self.equationTokens pop] stringValue];
        if ([lastNumber containsString:sender.currentTitle] == NO) {
            lastNumber = [lastNumber stringByAppendingString:sender.currentTitle];
            newNumber = [NSDecimalNumber decimalNumberWithString:lastNumber];
        }
        [self.equationTokens push:newNumber];
        [self printTape];
        [self printResult];
    } else {
        self.addDecimal = YES;
        [self appendToTape:sender.currentTitle];
    }
}

- (IBAction)equalPressed:(UIButton *)sender {
}
- (IBAction)additionPressed:(UIButton *)sender {
    Operation *operation = [[Operation alloc] initWithType:add];
    [self.equationTokens push:operation];
    [self printTape];
}
- (IBAction)subtractPressed:(UIButton *)sender {
    Operation *operation = [[Operation alloc] initWithType:subtract];
    [self.equationTokens push:operation];
    [self printTape];
}
- (IBAction)multiplyPressed:(UIButton *)sender {
    Operation *operation = [[Operation alloc] initWithType:multiply];
    [self.equationTokens push:operation];
    [self printTape];
}
- (IBAction)dividePressed:(UIButton *)sender {
    Operation *operation = [[Operation alloc] initWithType:divide];
    [self.equationTokens push:operation];
    [self printTape];
}
- (IBAction)leftParanthesisPressed:(UIButton *)sender {
}
- (IBAction)rightParanthesisPressed:(UIButton *)sender {
}
- (IBAction)postiveNegativePressed:(UIButton *)sender {
}
- (IBAction)percentPressed:(UIButton *)sender {
}
- (IBAction)deletePressed:(UIButton *)sender {
    if ([self.equationTokens isLastObjectNumber]) {
        
    }
    self.tapeLabel.text = [self.equationTokens toString];
}

- (void)printTape {
    self.tapeLabel.text = [self.equationTokens toString];
}

- (void)appendToTape:(NSString *)withString {
    self.tapeLabel.text = [self.tapeLabel.text stringByAppendingString:withString];
}

- (void)printResult {
    self.resultLabel.text = [self.postfixCalculator calculateWithString:[self.infixToPostfix toPostfixWithString:[self.equationTokens toString]]];
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
