//
//  CalculatorViewController.m
//  FreshCalc
//
//  Created by Dale Winston on 7/27/15.
//  Copyright (c) 2015 Dale Winston. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet CalculatorLabel *tapeLabel;
@property (weak, nonatomic) IBOutlet CalculatorLabel *resultLabel;

@property (nonatomic) InfixToPostfix *infixToPostfix;
@property (nonatomic) PostfixCalculator *postfixCalculator;

@property (nonatomic) EquationStack *equationTokens;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Button Presses
- (IBAction)integerPressed:(CalculatorButton *)sender {
    
}

- (IBAction)zeroPressed:(CalculatorButton *)sender {
}

- (IBAction)decimalPressed:(CalculatorButton *)sender {
}

- (IBAction)equalPressed:(CalculatorButton *)sender {
}
- (IBAction)additionPressed:(CalculatorButton *)sender {
}
- (IBAction)subtractPressed:(CalculatorButton *)sender {
}
- (IBAction)multiplyPressed:(CalculatorButton *)sender {
}
- (IBAction)dividePressed:(CalculatorButton *)sender {
}
- (IBAction)leftParanthesisPressed:(CalculatorButton *)sender {
}
- (IBAction)rightParanthesisPressed:(CalculatorButton *)sender {
}
- (IBAction)postiveNegativePressed:(CalculatorButton *)sender {
}
- (IBAction)percentPressed:(CalculatorButton *)sender {
}
- (IBAction)deletePressed:(CalculatorButton *)sender {
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
