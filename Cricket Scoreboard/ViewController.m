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

@property (nonatomic) UITextField *playerOneName;
@property (nonatomic) UITextField *payerTwoName;
@property (nonatomic) DartNumberViewController *dartNumberViewController;

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
    
    self.dartNumberViewController = [[DartNumberViewController alloc] init];
    self.dartNumberViewController.dartNumberText = @"45";
    self.dartNumberViewController.dartNumber = 45;
    self.dartNumberViewController.view.frame = CGRectMake(75.0, 75.0, 300.0, 100.0);
    [self.view addSubview:self.dartNumberViewController.view];
}

@end
