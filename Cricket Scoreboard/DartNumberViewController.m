//
//  DartNumberViewController.m
//  Cricket Scoreboard
//
//  Created by Jon on 1/28/14.
//  Copyright (c) 2014 Jon. All rights reserved.
//

//typedef enum {
//    closedStatusNone,
//    closedStatusSlash,
//    closedStatusEx,
//    closedStatusComplete
//} ClosedStatus;

#import "DartNumberViewController.h"
#import "ViewController.h"

@interface DartNumberViewController ()

@property (nonatomic) NSInteger playerOneNumberScore;
@property (nonatomic) NSInteger playerTwoNumberScore;
@property (nonatomic) UIButton *playerOneAddButton;
@property (nonatomic) UIButton *playerOneMinusButton;
@property (nonatomic) UILabel *dartNumberLabel;
@property (nonatomic) UIButton *playerTwoMinusButton;
@property (nonatomic) UIButton *playerTwoAddButton;
//@property (nonatomic) ClosedStatus playerOneClosedStatus;
//@property (nonatomic) ClosedStatus playerTwoClosedStatus;
@property (nonatomic) NSNumber *playerOneClosedStatus;
@property (nonatomic) NSNumber *playerTwoClosedStatus;

@end

@implementation DartNumberViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.playerOneNumberScore = 0;
    
    
    
    self.playerOneMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerOneMinusButton.frame = CGRectMake(0.0, 0.0, 165.0, 104.0);
    [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
    self.playerOneMinusButton.titleLabel.font = [UIFont systemFontOfSize:50];
    [self.playerOneMinusButton setTitleColor:[UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.playerOneMinusButton addTarget:self action:@selector(minusPlayerOneCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerOneMinusButton];
    
    UILabel *playerOneBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneMinusButton.frame), 0.0, 1.0, 104.0)];
    playerOneBorder.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
    [self.view addSubview:playerOneBorder];
    
//    self.playerOneMinusButton.backgroundColor = [UIColor redColor];

    self.playerOneAddButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerOneAddButton.frame = CGRectMake(CGRectGetMaxX(self.playerOneMinusButton.frame), 0.0, 164.0, 104.0);
    [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"+"] forState:UIControlStateNormal];
    self.playerOneAddButton.titleLabel.font = [UIFont systemFontOfSize:50];
    [self.playerOneAddButton setTitleColor:[UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.playerOneAddButton addTarget:self action:@selector(addPlayerOneCount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerOneAddButton];
    
    UILabel *leftSideBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneAddButton.frame), 0.0, 1.0, 104.0)];
    leftSideBorder.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
    [self.view addSubview:leftSideBorder];
    
//    self.playerOneAddButton.backgroundColor = [UIColor redColor];

    self.dartNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftSideBorder.frame), 0.0, 106.0, 104.0)];
    self.dartNumberLabel.text = self.dartNumberText;
    self.dartNumberLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:149.0/255.0 blue:0.0/255.0 alpha:1.0];
    self.dartNumberLabel.font = [UIFont systemFontOfSize:50];
    [self.dartNumberLabel setTextColor:[UIColor whiteColor]];
    self.dartNumberLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.dartNumberLabel];
    
    UILabel *rightSideBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.dartNumberLabel.frame), 0.0, 1.0, 104.0)];
    rightSideBorder.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
    [self.view addSubview:rightSideBorder];

    self.playerTwoAddButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerTwoAddButton.frame = CGRectMake(CGRectGetMaxX(rightSideBorder.frame), 0.0, 164.0, 104.0);
    [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"+"] forState:UIControlStateNormal];
    self.playerTwoAddButton.titleLabel.font = [UIFont systemFontOfSize:50];
    [self.playerTwoAddButton setTitleColor:[UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.playerTwoAddButton addTarget:self action:@selector(addPlayerTwoCount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerTwoAddButton];
    
    UILabel *playerTwoBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerTwoAddButton.frame), 0.0, 1.0, 104.0)];
    playerTwoBorder.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
    [self.view addSubview:playerTwoBorder];
    
//    self.playerTwoAddButton.backgroundColor = [UIColor redColor];
    
    self.playerTwoMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerTwoMinusButton.frame = CGRectMake(CGRectGetMaxX(self.playerTwoAddButton.frame), 0.0, 165.0, 104.0);
    [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
    self.playerTwoMinusButton.titleLabel.font = [UIFont systemFontOfSize:50];
    [self.playerTwoMinusButton setTitleColor:[UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.playerTwoMinusButton addTarget:self action:@selector(minusPlayerTwoCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerTwoMinusButton];
    
    UILabel *bottomBorder = [[UILabel alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(self.dartNumberLabel.frame), 768.0, 1.0)];
    bottomBorder.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
    [self.view addSubview:bottomBorder];
    
    
//    self.view.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
}

- (void)addPlayerOneCount
{
//    switch (self.playerOneClosedStatus) {
//        case closedStatusNone:
//            self.playerOneClosedStatus = closedStatusSlash;
//            break;
//        case closedStatusSlash:
//            self.playerOneClosedStatus = closedStatusEx;
//            break;
//        case closedStatusEx:
//            self.playerOneClosedStatus = closedStatusComplete;
//            break;
//        default:
//            self.playerOneClosedStatus = closedStatusNone;
//            break;
//    }
// use above instead of comparing

    if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"+"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"/"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"X"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"☺︎"] forState:UIControlStateNormal];
        self.playerOneClosedStatus = @1;
        
        NSDictionary *playerOneScoreDic = @{@"score": [NSNumber numberWithInt:self.dartNumber], @"closedStatus": self.playerOneClosedStatus};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"playerOneClosedNumber" object:self userInfo:playerOneScoreDic];
        
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
        if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
            NSLog(@"Ha Ha");
        } else {
            self.playerOneNumberScore += self.dartNumber;
            [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%d", self.playerOneNumberScore] forState:UIControlStateNormal];
            
            NSDictionary *playerOneScoreDic = @{@"score": [NSNumber numberWithInt:self.dartNumber], @"closedStatus": self.playerOneClosedStatus};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"playerOneScoreUP" object:self userInfo:playerOneScoreDic];
            
        }
    
    }
}
    
- (void)addPlayerTwoCount
{
    if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"+"]) {
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
            
            NSDictionary *playerTwoScoreDic = @{@"score": [NSNumber numberWithInt:self.dartNumber]};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"playerTwoScoreUP" object:self userInfo:playerTwoScoreDic];
        }
    }
}

- (void)minusPlayerOneCount:(UIButton *)sender
{
    
    if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
        if (self.playerOneNumberScore == self.dartNumber) {
            [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
            self.playerOneNumberScore = 0;
            
            NSDictionary *playerOneMinusScoreDic = @{@"score": [NSNumber numberWithInt:self.dartNumber]};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"playerOneScoreDown" object:self userInfo:playerOneMinusScoreDic];
            
        } else if ([self.playerOneMinusButton.titleLabel.text isEqualToString:@"-"]) {
            [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
        } else {
            self.playerOneNumberScore -= self.dartNumber;
            [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%d",self.playerOneNumberScore] forState:UIControlStateNormal];
            
            NSDictionary *playerOneMinusScoreDic = @{@"score": [NSNumber numberWithInt:self.dartNumber]};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"playerOneScoreDown" object:self userInfo:playerOneMinusScoreDic];

        }
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"X"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"/"]) {
        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"+"] forState:UIControlStateNormal];
    }
}

- (void)minusPlayerTwoCount:(UIButton *)sender
{
    
    if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
        if (self.playerTwoNumberScore == self.dartNumber) {
            [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
            self.playerTwoNumberScore = 0;
            
            NSDictionary *playerTwoMinusScoreDic = @{@"score": [NSNumber numberWithInt:self.dartNumber]};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"playerTwoScoreDown" object:self userInfo:playerTwoMinusScoreDic];
            
        } else if ([self.playerTwoMinusButton.titleLabel.text isEqualToString:@"-"]) {
            [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
        } else {
            self.playerTwoNumberScore -= self.dartNumber;
            [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"%d",self.playerTwoNumberScore] forState:UIControlStateNormal];
            
            NSDictionary *playerTwoMinusScoreDic = @{@"score": [NSNumber numberWithInt:self.dartNumber]};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"playerTwoScoreDown" object:self userInfo:playerTwoMinusScoreDic];
            
        }
    } else if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"X"]) {
        [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
    } else if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"/"]) {
        [self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"+"] forState:UIControlStateNormal];
    }
}

- (void)setDartNumberText:(NSString *)dartNumberText {
    _dartNumberText = dartNumberText;
    self.dartNumberLabel.text = dartNumberText;
    

}

@end
