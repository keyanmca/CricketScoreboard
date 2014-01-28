//
//  DartNumberViewController.m
//  Cricket Scoreboard
//
//  Created by Jon on 1/28/14.
//  Copyright (c) 2014 Jon. All rights reserved.
//

#import "DartNumberViewController.h"

@interface DartNumberViewController ()

@property (nonatomic) NSInteger dartNumberScore;
@property (nonatomic) UIButton *playerOneAddButton;
@property (nonatomic) UIButton *playerOneMinusButton;
@property (nonatomic) UILabel *dartNumberLabel;

@end

@implementation DartNumberViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.dartNumberScore = 0;
    
    self.playerOneMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerOneMinusButton.frame = CGRectMake(0.0, 0.0, 100.0, 100.0);
    [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"➖"] forState:UIControlStateNormal];
    self.playerOneMinusButton.titleLabel.font = [UIFont systemFontOfSize:60];
    [self.playerOneMinusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.playerOneMinusButton addTarget:self action:@selector(minusPlayerOneCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerOneMinusButton];

    self.playerOneAddButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerOneAddButton.frame = CGRectMake(CGRectGetMaxX(self.playerOneMinusButton.frame), 0.0, 100.0, 100.0);
    [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"➕"] forState:UIControlStateNormal];
    self.playerOneAddButton.titleLabel.font = [UIFont systemFontOfSize:60];
    [self.playerOneAddButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.playerOneAddButton addTarget:self action:@selector(addPlayerOneCount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerOneAddButton];

    self.dartNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneAddButton.frame), 0.0, 100.0, 100.0)];
    self.dartNumberLabel.text = self.dartNumberText;
    self.dartNumberLabel.font = [UIFont systemFontOfSize:70];
    [self.dartNumberLabel setTextColor:[UIColor whiteColor]];
    self.dartNumberLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.dartNumberLabel];
    
    self.view.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
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
        self.dartNumberScore += self.dartNumber;
        [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%d", self.dartNumberScore] forState:UIControlStateNormal];
    }
}

- (void)minusPlayerOneCount:(UIButton *)sender
{
    
    if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
        if (self.dartNumberScore == self.dartNumber) {
            [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"➖"] forState:UIControlStateNormal];
            self.dartNumberScore = 0;
        } else if ([self.playerOneMinusButton.titleLabel.text isEqualToString:@"➖"]) {
            [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
        } else {
            self.dartNumberScore -= self.dartNumber;
            [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%d",self.dartNumberScore] forState:UIControlStateNormal];
        }
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"X"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"/"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"➕"] forState:UIControlStateNormal];
    }
}

- (void)setDartNumberText:(NSString *)dartNumberText {
    _dartNumberText = dartNumberText;
    self.dartNumberLabel.text = dartNumberText;
}

@end
