//
//  DartNumberViewController.m
//  Cricket Scoreboard
//
//  Created by Jon on 1/28/14.
//  Copyright (c) 2014 Jon. All rights reserved.
//

#import "DartNumberViewController.h"
#import "ViewController.h"

@interface DartNumberViewController ()
@property (nonatomic) NSInteger dartNumberScore;
@property (nonatomic) UIButton *playerOneAddButton;
@property (nonatomic) UIButton *playerOneMinusButton;
@property (nonatomic) UILabel *dartNumberLabel;

@end

@implementation DartNumberViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.dartNumberScore = 0;
    self.dartNumber = 20;
    
    self.dartNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(333, 75, 100, 100)];
    self.dartNumberLabel.text = @"20";
    self.dartNumberLabel.font = [UIFont systemFontOfSize:70];
    [self.dartNumberLabel setTextColor:[UIColor whiteColor]];
    self.dartNumberLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.dartNumberLabel];
    
    self.playerOneAddButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerOneAddButton.frame = CGRectMake(200, 63, 100, 125);
    [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"➕"] forState:UIControlStateNormal];
    self.playerOneAddButton.titleLabel.font = [UIFont systemFontOfSize:60];
    [self.playerOneAddButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.playerOneAddButton];
    
    self.playerOneMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerOneMinusButton.frame = CGRectMake(50, 63, 100, 125);
    [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"➖"] forState:UIControlStateNormal];
    self.playerOneMinusButton.titleLabel.font = [UIFont systemFontOfSize:60];
    [self.playerOneMinusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.playerOneMinusButton];
    
    [self.playerOneAddButton addTarget:self action:@selector(addPlayerOneCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.playerOneMinusButton addTarget:self action:@selector(minusPlayerOneCount:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) addPlayerOneCount:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"➕"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    } else if ([sender.titleLabel.text isEqualToString:@"/"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
    } else if ([sender.titleLabel.text isEqualToString:@"X"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"☺︎"] forState:UIControlStateNormal];
    } else if ([sender.titleLabel.text isEqualToString:@"☺︎"]) {
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
