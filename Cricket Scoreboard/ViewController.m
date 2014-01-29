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
@property (nonatomic) DartNumberViewController *dartTwentyViewController;
@property (nonatomic) DartNumberViewController *dartNinteenViewController;
@property (nonatomic) DartNumberViewController *dartEighteenViewController;
@property (nonatomic) DartNumberViewController *dartSeventeenViewController;
@property (nonatomic) DartNumberViewController *dartSixteenViewController;
@property (nonatomic) DartNumberViewController *dartFifteenViewController;
@property (nonatomic) DartNumberViewController *dartBullsEyeViewController;


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
    
    self.dartTwentyViewController = [[DartNumberViewController alloc] init];
    self.dartTwentyViewController.dartNumberText = @"20";
    self.dartTwentyViewController.dartNumber = 20;
    self.dartTwentyViewController.view.frame = CGRectMake(46.0, 75.0, 676.0, 100.0);
    [self.view addSubview:self.dartTwentyViewController.view];
    
    self.dartNinteenViewController = [[DartNumberViewController alloc] init];
    self.dartNinteenViewController.dartNumberText = @"19";
    self.dartNinteenViewController.dartNumber = 19;
    self.dartNinteenViewController.view.frame = CGRectMake(46.0, 200.0, 676.0, 100.0);
    [self.view addSubview:self.dartNinteenViewController.view];
    
    self.dartEighteenViewController = [[DartNumberViewController alloc] init];
    self.dartEighteenViewController.dartNumberText = @"18";
    self.dartEighteenViewController.dartNumber = 18;
    self.dartEighteenViewController.view.frame = CGRectMake(46.0, 325.0, 676.0, 100.0);
    [self.view addSubview:self.dartEighteenViewController.view];
    
    self.dartSeventeenViewController = [[DartNumberViewController alloc] init];
    self.dartSeventeenViewController.dartNumberText = @"17";
    self.dartSeventeenViewController.dartNumber = 17;
    self.dartSeventeenViewController.view.frame = CGRectMake(46.0, 450.0, 676.0, 100.0);
    [self.view addSubview:self.dartSeventeenViewController.view];
    
    self.dartSixteenViewController = [[DartNumberViewController alloc] init];
    self.dartSixteenViewController.dartNumberText = @"16";
    self.dartSixteenViewController.dartNumber = 16;
    self.dartSixteenViewController.view.frame = CGRectMake(46.0, 575.0, 676.0, 100.0);
    [self.view addSubview:self.dartSixteenViewController.view];
    
    self.dartFifteenViewController = [[DartNumberViewController alloc] init];
    self.dartFifteenViewController.dartNumberText = @"15";
    self.dartFifteenViewController.dartNumber = 15;
    self.dartFifteenViewController.view.frame = CGRectMake(46.0, 700.0, 676.0, 100.0);
    [self.view addSubview:self.dartFifteenViewController.view];
    
    self.dartBullsEyeViewController = [[DartNumberViewController alloc] init];
    self.dartBullsEyeViewController.dartNumberText = @"B";
    self.dartBullsEyeViewController.dartNumber = 25;
    self.dartBullsEyeViewController.view.frame = CGRectMake(46.0, 825.0, 676.0, 100.0);
    [self.view addSubview:self.dartBullsEyeViewController.view];
}

@end
