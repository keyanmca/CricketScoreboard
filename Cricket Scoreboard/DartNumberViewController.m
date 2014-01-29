//
//  DartNumberViewController.m
//  Cricket Scoreboard
//
//  Created by Jon on 1/28/14.
//  Copyright (c) 2014 Jon. All rights reserved.
//

#import "DartNumberViewController.h"

@interface DartNumberViewController ()

@property (nonatomic) NSInteger playerOneNumberScore;
@property (nonatomic) NSInteger playerTwoNumberScore;
@property (nonatomic) UIButton *playerOneAddButton;
@property (nonatomic) UIButton *playerOneMinusButton;
@property (nonatomic) UILabel *dartNumberLabel;
@property (nonatomic) UIButton *playerTwoMinusButton;
@property (nonatomic) UIButton *playerTwoAddButton;

@end

@implementation DartNumberViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.playerOneNumberScore = 0;
    
    self.playerOneMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerOneMinusButton.frame = CGRectMake(0.0, 0.0, 100.0, 100.0);
    [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"➖"] forState:UIControlStateNormal];
    self.playerOneMinusButton.titleLabel.font = [UIFont systemFontOfSize:60];
    [self.playerOneMinusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.playerOneMinusButton addTarget:self action:@selector(minusPlayerOneCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerOneMinusButton];

    self.playerOneAddButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerOneAddButton.frame = CGRectMake(CGRectGetMaxX(self.playerOneMinusButton.frame)+44.0, 0.0, 100.0, 100.0);
    [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"➕"] forState:UIControlStateNormal];
    self.playerOneAddButton.titleLabel.font = [UIFont systemFontOfSize:60];
    [self.playerOneAddButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.playerOneAddButton addTarget:self action:@selector(addPlayerOneCount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerOneAddButton];

    self.dartNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneAddButton.frame)+44, 0.0, 100.0, 100.0)];
    self.dartNumberLabel.text = self.dartNumberText;
    self.dartNumberLabel.font = [UIFont systemFontOfSize:70];
    [self.dartNumberLabel setTextColor:[UIColor whiteColor]];
    self.dartNumberLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.dartNumberLabel];
    
    self.playerTwoAddButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerTwoAddButton.frame = CGRectMake(CGRectGetMaxX(self.dartNumberLabel.frame)+44.0, 0.0, 100.0, 100.0);
    [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"➕"] forState:UIControlStateNormal];
    self.playerTwoAddButton.titleLabel.font = [UIFont systemFontOfSize:60];
    [self.playerTwoAddButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.playerTwoAddButton addTarget:self action:@selector(addPlayerTwoCount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerTwoAddButton];
    
    self.playerTwoMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerTwoMinusButton.frame = CGRectMake(CGRectGetMaxX(self.playerTwoAddButton.frame)+44.0, 0.0, 100.0, 100.0);
    [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"➖"] forState:UIControlStateNormal];
    self.playerTwoMinusButton.titleLabel.font = [UIFont systemFontOfSize:60];
    [self.playerTwoMinusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.playerTwoMinusButton addTarget:self action:@selector(minusPlayerTwoCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerTwoMinusButton];
    
    
//    self.view.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
}

- (void)addPlayerOneCount
{
    if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"➕"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"/"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"X"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"☺︎"] forState:UIControlStateNormal];
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
        if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
            NSLog(@"Ha Ha");
        } else {
            self.playerOneNumberScore += self.dartNumber;
            [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%d", self.playerOneNumberScore] forState:UIControlStateNormal];
        }
    }
}

- (void)addPlayerTwoCount
{
    if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"➕"]) {
        [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    } else if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"/"]) {
        [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
    } else if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"X"]) {
        [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"☺︎"] forState:UIControlStateNormal];
    } else if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
        if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
            NSLog(@"Ha Ha");
        } else {
            self.playerTwoNumberScore += self.dartNumber;
            [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"%d", self.playerTwoNumberScore] forState:UIControlStateNormal];
        }
    }
}

- (void)minusPlayerOneCount:(UIButton *)sender
{
    
    if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
        if (self.playerOneNumberScore == self.dartNumber) {
            [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"➖"] forState:UIControlStateNormal];
            self.playerOneNumberScore = 0;
        } else if ([self.playerOneMinusButton.titleLabel.text isEqualToString:@"➖"]) {
            [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
        } else {
            self.playerOneNumberScore -= self.dartNumber;
            [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%d",self.playerOneNumberScore] forState:UIControlStateNormal];
        }
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"X"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"/"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"➕"] forState:UIControlStateNormal];
    }
}

- (void)minusPlayerTwoCount:(UIButton *)sender
{
    
    if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
        if (self.playerTwoNumberScore == self.dartNumber) {
            [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"➖"] forState:UIControlStateNormal];
            self.playerTwoNumberScore = 0;
        } else if ([self.playerTwoMinusButton.titleLabel.text isEqualToString:@"➖"]) {
            [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
        } else {
            self.playerTwoNumberScore -= self.dartNumber;
            [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"%d",self.playerTwoNumberScore] forState:UIControlStateNormal];
        }
    } else if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"X"]) {
        [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    } else if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"/"]) {
        [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"➕"] forState:UIControlStateNormal];
    }
}

- (void)setDartNumberText:(NSString *)dartNumberText {
    _dartNumberText = dartNumberText;
    self.dartNumberLabel.text = dartNumberText;
}

@end
