//
//  ViewController.m
//  TXFPSCalculatorDemo
//
//  Created by tingxins on 04/11/2016.
//  Copyright © 2016 tingxins. All rights reserved.
//

#import "ViewController.h"
#import "TXFPSCalculator.h"

@interface ViewController ()

@property (strong, nonatomic) TXFPSCalculator *calculator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.calculator = [[TXFPSCalculator calculator] start];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
