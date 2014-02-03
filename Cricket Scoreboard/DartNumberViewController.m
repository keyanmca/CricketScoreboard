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

@property (nonatomic) UIButton *playerOneAddButton;
@property (nonatomic) UIButton *playerOneMinusButton;
@property (nonatomic) UILabel *dartNumberLabel;
@property (nonatomic) UIButton *playerTwoMinusButton;
@property (nonatomic) UIButton *playerTwoAddButton;
@property (nonatomic) DartNumberModel *dartNumberModel;

@end

@implementation DartNumberViewController

- (instancetype)initWithDartNumber:(NSInteger)dartNumber {
    if (self = [super init]) {
        self.dartNumberModel = [[DartNumberModel alloc] initWithDartNumber:dartNumber];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(resetGame)
												 name:@"Reset"
											   object:nil];
	
    
    self.playerOneMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playerOneMinusButton.frame = CGRectMake(0.0, 0.0, 165.0, 104.0);
    [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
    self.playerOneMinusButton.titleLabel.font = [UIFont systemFontOfSize:50];
    [self.playerOneMinusButton setTitleColor:[UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.playerOneMinusButton addTarget:self action:@selector(playerOneMinusButtonTapped) forControlEvents:UIControlEventTouchUpInside];
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
    [self.playerOneAddButton addTarget:self action:@selector(playerOneAddButtonTapped) forControlEvents:UIControlEventTouchUpInside];
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
    [self.playerTwoAddButton addTarget:self action:@selector(playerTwoAddButtonTapped) forControlEvents:UIControlEventTouchUpInside];
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
    [self.playerTwoMinusButton addTarget:self action:@selector(playerTwoMinusButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playerTwoMinusButton];
    
    UILabel *bottomBorder = [[UILabel alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(self.dartNumberLabel.frame), 768.0, 1.0)];
    bottomBorder.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
    [self.view addSubview:bottomBorder];
    
    
//    self.view.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
}



- (NSString *)buttonCharacterForClosedStatus:(ClosedStatus)closedStatus {
    NSString *buttonCharacter;
    switch (closedStatus) {
        case closedStatusSlash:
            buttonCharacter = @"/";
            break;
        case closedStatusEx:
            buttonCharacter = @"X";
            break;
        case closedStatusComplete:
            buttonCharacter = @"☺︎";
            break;
        case closedStatusNone:
        default:
            buttonCharacter = @"+";
            break;
    }
    return buttonCharacter;
}









// old code exists below.  this is what i used before the DartNumberModel.
- (void)playerOneAddButtonTapped
{
    [self.dartNumberModel addPlayerOneDartScore];
    [self.playerOneAddButton setTitle:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerOneClosedStatus] forState:UIControlStateNormal];
    if (self.dartNumberModel.playerOneDartScore > 0) {
        [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%d", self.dartNumberModel.playerOneDartScore] forState:UIControlStateNormal];
    } else {
        [self.playerOneMinusButton setTitle:@"-" forState:UIControlStateNormal];
    }
	
	[self notifyListenersOfStatusChange];
    
	//post notification that player status changed
    
    
//    if (self.dartNumberModel.playerOneClosedStatus == closedStatusComplete) {
//        NSDictionary *playerOneScoreDic = @{@"score": [NSNumber numberWithInt:self.dartNumberModel.dartNumber],
//                                            @"closedStatus": @(self.dartNumberModel.playerOneClosedStatus)};
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"playerOneClosedNumber" object:self userInfo:playerOneScoreDic];
//    }
//
//    if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"+"]) {
//        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"/"] forState:UIControlStateNormal];
//    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"/"]) {
//        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
//    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"X"]) {
//        [self.playerOneAddButton setTitle:[NSString stringWithFormat:@"☺︎"] forState:UIControlStateNormal];
    
    
//    } else if ([self.playerOneAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
//        if ([self.playerTwoAddButton.titleLabel.text isEqualToString:@"☺︎"]) {
//            NSLog(@"Ha Ha");
//        } else {
//            self.playerOneNumberScore += self.dartNumberModel.dartNumber;
//            [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%d", self.playerOneNumberScore] forState:UIControlStateNormal];
//            
//            NSDictionary *playerOneScoreDic = @{@"score": [NSNumber numberWithInt:self.dartNumberModel.dartNumber], @"closedStatus": self.playerOneClosedStatus};
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"playerOneScoreUP" object:self userInfo:playerOneScoreDic];
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"playerOneClosedNumber" object:self userInfo:playerOneScoreDic];
//            
//        }
//    
//    }
}
    
- (void)playerTwoAddButtonTapped
{
    [self.dartNumberModel addPlayerTwoDartScore];
    [self.playerTwoAddButton setTitle:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerTwoClosedStatus] forState:UIControlStateNormal];
    
    if (self.dartNumberModel.playerTwoDartScore > 0) {
        [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"%d", self.dartNumberModel.playerTwoDartScore] forState:UIControlStateNormal];
    } else {
        [self.playerTwoMinusButton setTitle:@"-" forState:UIControlStateNormal];
    }
	[self notifyListenersOfStatusChange];

}

- (void)playerOneMinusButtonTapped
{
    [self.dartNumberModel subtractPlayerOneDartScore];
    [self.playerOneAddButton setTitle:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerOneClosedStatus] forState:UIControlStateNormal];
    if (self.dartNumberModel.playerOneDartScore == 0) {
        [self.playerOneMinusButton setTitle:@"-" forState:UIControlStateNormal];
    } else {
        [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%d",self.dartNumberModel.playerOneDartScore] forState:UIControlStateNormal];
    }
	[self notifyListenersOfStatusChange];
}

- (void)playerTwoMinusButtonTapped
{
    [self.dartNumberModel subtractPlayerTwoDartScore];
    [self.playerTwoAddButton setTitle:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerTwoClosedStatus] forState:UIControlStateNormal];
    if (self.dartNumberModel.playerTwoDartScore == 0) {
        [self.playerTwoMinusButton setTitle:@"-" forState:UIControlStateNormal];
    } else {
        [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"%d",self.dartNumberModel.playerTwoDartScore] forState:UIControlStateNormal];
    }
	[self notifyListenersOfStatusChange];
}

- (void)notifyListenersOfStatusChange {
	[[NSNotificationCenter defaultCenter] postNotificationName:@"PlayerStatusChanged" object:nil];
}

- (void)setDartNumberText:(NSString *)dartNumberText {
    _dartNumberText = dartNumberText;
    self.dartNumberLabel.text = dartNumberText;
}

- (NSInteger)playerOneDartScore {
	return self.dartNumberModel.playerOneDartScore;
}

- (NSInteger)playerTwoDartScore {
	return self.dartNumberModel.playerTwoDartScore;
}

- (ClosedStatus)playerOneClosedStatus {
	return self.dartNumberModel.playerOneClosedStatus;
}

- (ClosedStatus)playerTwoClosedStatus {
	return self.dartNumberModel.playerTwoClosedStatus;
	
}

- (void)resetGame {
	self.dartNumberModel.playerOneDartScore = 0;
	self.dartNumberModel.playerTwoDartScore = 0;
	self.dartNumberModel.playerOneClosedStatus = closedStatusNone;
	self.dartNumberModel.playerTwoClosedStatus = closedStatusNone;
	[self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
	[self.playerOneAddButton setTitle:[NSString stringWithFormat:@"+"] forState:UIControlStateNormal];
	[self.playerTwoAddButton setTitle:[NSString stringWithFormat:@"+"] forState:UIControlStateNormal];
	[self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
}

@end
