//
//  ViewController.m
//  Cricket Scoreboard
//
//  Created by Jon on 1/24/14.
//  Copyright (c) 2014 Jon. All rights reserved.
//

#import "ViewController.h"
#import "DartNumberViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UITextField *playerOneName;
@property (strong, nonatomic) UITextField *payerTwoName;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.0666 green:0.3019 blue:0.0862 alpha:1.0];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.playerOneName = [[UITextField alloc] initWithFrame:CGRectMake(50, 30, 250, 50)];
    self.playerOneName.placeholder = [NSString stringWithFormat:@"Player One Name"];
    self.playerOneName.font = [UIFont systemFontOfSize:30];
    [self.playerOneName setTextColor:[UIColor whiteColor]];
    self.playerOneName.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.playerOneName];
    
    DartNumberViewController *dartNumberViewController = [[DartNumberViewController alloc] init];
    dartNumberViewController.dartNumberText = @"45";
    dartNumberViewController.dartNumber = 45;
    dartNumberViewController.view.frame = self.view.bounds;
    [self.view addSubview:dartNumberViewController.view];
    
//    dartNumberViewController.view.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
