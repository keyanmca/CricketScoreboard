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

@property (nonatomic) UILabel *topFrame;
@property (nonatomic) UITextField *playerOneName;
@property (nonatomic) UITextField *playerTwoName;
//@property (nonatomic) DartNumberViewController *dartTwentyViewController;
//@property (nonatomic) DartNumberViewController *dartNinteenViewController;
//@property (nonatomic) DartNumberViewController *dartEighteenViewController;
//@property (nonatomic) DartNumberViewController *dartSeventeenViewController;
//@property (nonatomic) DartNumberViewController *dartSixteenViewController;
//@property (nonatomic) DartNumberViewController *dartFifteenViewController;
//@property (nonatomic) DartNumberViewController *dartBullsEyeViewController;
@property (nonatomic) UILabel *totalLabel;
@property (nonatomic) UILabel *playerOneScoreLabel;
@property (nonatomic) UILabel *playerTwoScoreLabel;

@property (nonatomic) NSNumber *playerOneScore;
@property (nonatomic) NSNumber *playerTwoScore;
@property (nonatomic) NSArray *dartNumberTextArray;
@property (nonatomic) NSArray *dartNumberArray;
@property (nonatomic) NSArray *dartViewControllersArray;

@property (nonatomic) NSNumber *playerOne20ClosedStatus;
@property (nonatomic) NSNumber *playerOne19ClosedStatus;
@property (nonatomic) NSNumber *playerOne18ClosedStatus;
@property (nonatomic) NSNumber *playerOne17ClosedStatus;
@property (nonatomic) NSNumber *playerOne16ClosedStatus;
@property (nonatomic) NSNumber *playerOne15ClosedStatus;
@property (nonatomic) NSNumber *playerOne25ClosedStatus;




@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updatePlayerOneScore:)
                                                 name:@"playerOneScoreUP"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updatePlayerTwoScore:)
                                                 name:@"playerTwoScoreUP"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(decreasePlayerOneScore:)
                                                 name:@"playerOneScoreDown"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(decreasePlayerTwoScore:)
                                                 name:@"playerTwoScoreDown"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerOneClosed:)
                                                 name:@"playerOneClosedNumber"
                                               object:nil];
    
    self.view.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
	// Do any additional setup after loading the view, typically from a nib.
    
//    self.playerOneScore = @0;
    
    self.playerOneName = [[UITextField alloc] initWithFrame:CGRectMake(2, 30, 332, 50)];
    self.playerOneName.placeholder = [NSString stringWithFormat:@"Player One"];
    self.playerOneName.font = [UIFont systemFontOfSize:40];
    [self.playerOneName setTextColor:[UIColor colorWithRed: 255.0/255.0 green:149.0/255.0 blue:0/255.0 alpha:1.0]];
    self.playerOneName.textAlignment = NSTextAlignmentCenter;
    //    self.playerOneName.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.playerOneName];
    
    self.playerTwoName = [[UITextField alloc] initWithFrame:CGRectMake(434, 30, 332, 50)];
    self.playerTwoName.placeholder = [NSString stringWithFormat:@"Player Two"];
    self.playerTwoName.font = [UIFont systemFontOfSize:40];
    [self.playerTwoName setTextColor:[UIColor colorWithRed: 255.0/255.0 green:149.0/255.0 blue:0/255.0 alpha:1.0]];
    self.playerTwoName.textAlignment = NSTextAlignmentCenter;
    //    self.playerTwoName.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.playerTwoName];
    
    self.dartNumberTextArray = @[@"20", @"19", @"18", @"17", @"16", @"15", @"B"];
    self.dartNumberArray = @[@20, @19, @18, @17, @16, @15, @25];
    
    NSMutableArray *dartViewControllersArray = [NSMutableArray array];
    
    NSInteger index = 0;
    CGFloat dartViewControllerXCoordinate = 90.0;
    for (NSString *dartNumberText in self.dartNumberTextArray) {
        DartNumberViewController *dartViewController = [[DartNumberViewController alloc] init];
        dartViewController.dartNumberText = dartNumberText;
        NSNumber *dartNumber = self.dartNumberArray[index];
        dartViewController.dartNumber = [dartNumber integerValue];
        dartViewController.view.frame = CGRectMake(0.0, dartViewControllerXCoordinate, 768.0, 105.0);
        [self.view addSubview:dartViewController.view];
        dartViewControllerXCoordinate += 105.0;
        index++;
        [dartViewControllersArray addObject:dartViewController];
    }
    self.dartViewControllersArray = dartViewControllersArray;
    
    
    //    self.dartTwentyViewController = [[DartNumberViewController alloc] init];
    //    self.dartTwentyViewController.dartNumberText = @"20";
    //    self.dartTwentyViewController.dartNumber = 20;
    //    self.dartTwentyViewController.view.frame = CGRectMake(46.0, 90, 676.0, 105.0);
    //    [self.view addSubview:self.dartTwentyViewController.view];
    //
    //    self.dartNinteenViewController = [[DartNumberViewController alloc] init];
    //    self.dartNinteenViewController.dartNumberText = @"19";
    //    self.dartNinteenViewController.dartNumber = 19;
    //    self.dartNinteenViewController.view.frame = CGRectMake(46.0, 195.0, 676.0, 105.0);
    //    [self.view addSubview:self.dartNinteenViewController.view];
    //
    //    self.dartEighteenViewController = [[DartNumberViewController alloc] init];
    //    self.dartEighteenViewController.dartNumberText = @"18";
    //    self.dartEighteenViewController.dartNumber = 18;
    //    self.dartEighteenViewController.view.frame = CGRectMake(46.0, 300.0, 676.0, 105.0);
    //    [self.view addSubview:self.dartEighteenViewController.view];
    //
    //    self.dartSeventeenViewController = [[DartNumberViewController alloc] init];
    //    self.dartSeventeenViewController.dartNumberText = @"17";
    //    self.dartSeventeenViewController.dartNumber = 17;
    //    self.dartSeventeenViewController.view.frame = CGRectMake(46.0, 405.0, 676.0, 105.0);
    //    [self.view addSubview:self.dartSeventeenViewController.view];
    //
    //    self.dartSixteenViewController = [[DartNumberViewController alloc] init];
    //    self.dartSixteenViewController.dartNumberText = @"16";
    //    self.dartSixteenViewController.dartNumber = 16;
    //    self.dartSixteenViewController.view.frame = CGRectMake(46.0, 510.0, 676.0, 105.0);
    //    [self.view addSubview:self.dartSixteenViewController.view];
    //
    //    self.dartFifteenViewController = [[DartNumberViewController alloc] init];
    //    self.dartFifteenViewController.dartNumberText = @"15";
    //    self.dartFifteenViewController.dartNumber = 15;
    //    self.dartFifteenViewController.view.frame = CGRectMake(46.0, 615.0, 676.0, 105.0);
    //    [self.view addSubview:self.dartFifteenViewController.view];
    //
    //    self.dartBullsEyeViewController = [[DartNumberViewController alloc] init];
    //    self.dartBullsEyeViewController.dartNumberText = @"B";
    //    self.dartBullsEyeViewController.dartNumber = 25;
    //    self.dartBullsEyeViewController.view.frame = CGRectMake(46.0, 720.0, 676.0, 105.0);
    //    [self.view addSubview:self.dartBullsEyeViewController.view];
    
    DartNumberViewController *lastDartViewController = [self.dartViewControllersArray lastObject];
    DartNumberViewController *firstDartViewController = [self.dartViewControllersArray firstObject];
    CGFloat bottomRowYCoordinate = CGRectGetMaxY(lastDartViewController.view.frame);
    CGFloat topRowYCoordinate = CGRectGetMinY(firstDartViewController.view.frame);
    
    //    UILabel *bottomTotalBorder = [[UILabel alloc] initWithFrame:CGRectMake(0.0, bottomRowYCoordinate - 2.0, 768.0, 2.0)];
    //    bottomTotalBorder.backgroundColor = [UIColor colorWithRed:142.0/255.0 green:142.0/255.0 blue:147.0/255.0 alpha:1.0];
    //    [self.view addSubview:bottomTotalBorder];
    
    self.playerOneScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, bottomRowYCoordinate, 165, 105.0)];
    //    self.playerOneScoreLabel.text = [NSString stringWithFormat:@"%@",self.playerOneScore];
    self.playerOneScoreLabel.text = @"0";
    self.playerOneScoreLabel.font = [UIFont systemFontOfSize:60];
    [self.playerOneScoreLabel setTextColor:[UIColor whiteColor]];
    self.playerOneScoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.playerOneScoreLabel];
    self.playerOneScoreLabel.backgroundColor = [UIColor colorWithRed:142.0/255.0 green:142.0/255.0 blue:147.0/255.0 alpha:1.0];
    
    self.playerTwoScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(603.0, bottomRowYCoordinate, 165.0, 105.0)];
    self.playerTwoScoreLabel.text = @"0";
    self.playerTwoScoreLabel.font = [UIFont systemFontOfSize:60];
    [self.playerTwoScoreLabel setTextColor:[UIColor whiteColor]];
    self.playerTwoScoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.playerTwoScoreLabel];
    self.playerTwoScoreLabel.backgroundColor = [UIColor colorWithRed:142.0/255.0 green:142.0/255.0 blue:147.0/255.0 alpha:1.0];
    
    self.totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(165.0, bottomRowYCoordinate, 438.0, 105.0)];
    self.totalLabel.text = @"TOTAL";
    self.totalLabel.font = [UIFont systemFontOfSize:40];
    [self.totalLabel setTextColor:[UIColor whiteColor]];
    self.totalLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.totalLabel];
    self.totalLabel.backgroundColor = [UIColor colorWithRed:142.0/255.0 green:142.0/255.0 blue:147.0/255.0 alpha:1.0];
    
    self.topFrame = [[UILabel alloc] initWithFrame:(CGRectMake(0.0, 0.0, 768.0, topRowYCoordinate))];
    self.topFrame.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
    [self.view addSubview:self.topFrame];
    
    self.playerOneName = [[UITextField alloc] initWithFrame:CGRectMake(2, 30, 332, 50)];
    self.playerOneName.placeholder = [NSString stringWithFormat:@"Player One"];
    self.playerOneName.font = [UIFont systemFontOfSize:40];
    [self.playerOneName setTextColor:[UIColor colorWithRed: 247.0/255.0 green:247.0/255.0 blue:247/255.0 alpha:1.0]];
    self.playerOneName.textAlignment = NSTextAlignmentCenter;
    //    self.playerOneName.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.playerOneName];
    
    UIColor *color = [UIColor colorWithRed: 247.0/255.0 green:247.0/255.0 blue:247/255.0 alpha:1.0];
    self.playerOneName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Player One" attributes:@{NSForegroundColorAttributeName: color}];
    
    self.playerTwoName = [[UITextField alloc] initWithFrame:CGRectMake(434, 30, 332, 50)];
    self.playerTwoName.placeholder = [NSString stringWithFormat:@"Player Two"];
    self.playerTwoName.font = [UIFont systemFontOfSize:40];
    [self.playerTwoName setTextColor:[UIColor colorWithRed: 255.0/255.0 green:247.0/255.0 blue:247/255.0 alpha:1.0]];
    self.playerTwoName.textAlignment = NSTextAlignmentCenter;
    //    self.playerTwoName.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.playerTwoName];
    
    self.playerTwoName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Player Two" attributes:@{NSForegroundColorAttributeName: color}];
    
    UILabel *bottomFrame = [[UILabel alloc] initWithFrame:(CGRectMake(0.0, CGRectGetMaxY(self.totalLabel.frame), 768.0, CGRectGetMaxY(self.view.frame)))];
    bottomFrame.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
    [self.view addSubview:bottomFrame];
    
}

- (void)updatePlayerOneScore:(NSNotification *)notification {
    NSDictionary *theData = notification.userInfo;
    if (theData != nil) {
        NSNumber *n = [theData objectForKey:@"score"];
        NSInteger newPlayerOneScore = [self.playerOneScore integerValue] + [n integerValue];
        self.playerOneScore = @(newPlayerOneScore);
        self.playerOneScoreLabel.text = [NSString stringWithFormat:@"%@", self.playerOneScore];
    }
}

- (void)updatePlayerTwoScore:(NSNotification *)notification {
    NSDictionary *theData = notification.userInfo;
    if (theData != nil) {
        NSNumber *n = [theData objectForKey:@"score"];
        NSInteger newPlayerOneScore = [self.playerTwoScore integerValue] + [n integerValue];
        self.playerTwoScore = @(newPlayerOneScore);
        self.playerTwoScoreLabel.text = [NSString stringWithFormat:@"%@", self.playerTwoScore];
    }
}

- (void)decreasePlayerOneScore:(NSNotification *)notification {
    NSDictionary *theData = notification.userInfo;
    if (theData != nil) {
        NSNumber *n = [theData objectForKey:@"score"];
        NSInteger newPlayerOneScore = [self.playerOneScore integerValue] - [n integerValue];
        self.playerOneScore = @(newPlayerOneScore);
        self.playerOneScoreLabel.text = [NSString stringWithFormat:@"%@", self.playerOneScore];
    }
}


- (void)decreasePlayerTwoScore:(NSNotification *)notification {
    NSDictionary *theData = notification.userInfo;
    if (theData != nil) {
        NSNumber *n = [theData objectForKey:@"score"];
        NSInteger newPlayerOneScore = [self.playerTwoScore integerValue] - [n integerValue];
        self.playerTwoScore = @(newPlayerOneScore);
        self.playerTwoScoreLabel.text = [NSString stringWithFormat:@"%@", self.playerTwoScore];
    }
}

- (void)playerOneClosed:(NSNotification *)notification {
    NSDictionary *theData = notification.userInfo;
    if (theData != Nil) {
        NSNumber *n = [theData objectForKey:@"score"];
        NSNumber *closedStatus = [theData objectForKey:@"closedStatus"];
        if ([n integerValue] == 20 && [closedStatus integerValue] == 1){
            self.playerOne20ClosedStatus = @1;
            if ([self.playerOne20ClosedStatus isEqualToNumber:@1] && [self.playerOne19ClosedStatus isEqualToNumber:@1] && [self.playerOne18ClosedStatus isEqualToNumber:@1] && [self.playerOne17ClosedStatus isEqualToNumber:@1] && [self.playerOne16ClosedStatus isEqualToNumber:@1] && [self.playerOne15ClosedStatus isEqualToNumber:@1] && [self.playerOne25ClosedStatus isEqualToNumber:@1]) {
                NSLog(@"Player One Wins");
            }
        } else if ([n integerValue] == 19 && [closedStatus integerValue] == 1){
            self.playerOne19ClosedStatus = @1;
            if ([self.playerOne20ClosedStatus isEqualToNumber:@1] && [self.playerOne19ClosedStatus isEqualToNumber:@1] && [self.playerOne18ClosedStatus isEqualToNumber:@1] && [self.playerOne17ClosedStatus isEqualToNumber:@1] && [self.playerOne16ClosedStatus isEqualToNumber:@1] && [self.playerOne15ClosedStatus isEqualToNumber:@1] && [self.playerOne25ClosedStatus isEqualToNumber:@1]) {
                NSLog(@"Player One Wins");
            }

        } else if ([n integerValue] == 18 && [closedStatus integerValue] == 1){
            self.playerOne18ClosedStatus = @1;
            if ([self.playerOne20ClosedStatus isEqualToNumber:@1] && [self.playerOne19ClosedStatus isEqualToNumber:@1] && [self.playerOne18ClosedStatus isEqualToNumber:@1] && [self.playerOne17ClosedStatus isEqualToNumber:@1] && [self.playerOne16ClosedStatus isEqualToNumber:@1] && [self.playerOne15ClosedStatus isEqualToNumber:@1] && [self.playerOne25ClosedStatus isEqualToNumber:@1]) {
                NSLog(@"Player One Wins");
            }

        } else if ([n integerValue] == 17 && [closedStatus integerValue] == 1){
            self.playerOne17ClosedStatus = @1;
            if ([self.playerOne20ClosedStatus isEqualToNumber:@1] && [self.playerOne19ClosedStatus isEqualToNumber:@1] && [self.playerOne18ClosedStatus isEqualToNumber:@1] && [self.playerOne17ClosedStatus isEqualToNumber:@1] && [self.playerOne16ClosedStatus isEqualToNumber:@1] && [self.playerOne15ClosedStatus isEqualToNumber:@1] && [self.playerOne25ClosedStatus isEqualToNumber:@1]) {
                NSLog(@"Player One Wins");
            }

        } else if ([n integerValue] == 16 && [closedStatus integerValue] == 1){
            self.playerOne16ClosedStatus = @1;
            if ([self.playerOne20ClosedStatus isEqualToNumber:@1] && [self.playerOne19ClosedStatus isEqualToNumber:@1] && [self.playerOne18ClosedStatus isEqualToNumber:@1] && [self.playerOne17ClosedStatus isEqualToNumber:@1] && [self.playerOne16ClosedStatus isEqualToNumber:@1] && [self.playerOne15ClosedStatus isEqualToNumber:@1] && [self.playerOne25ClosedStatus isEqualToNumber:@1]) {
                NSLog(@"Player One Wins");
            }

        } else if ([n integerValue] == 15 && [closedStatus integerValue] == 1){
            self.playerOne15ClosedStatus = @1;
            if ([self.playerOne20ClosedStatus isEqualToNumber:@1] && [self.playerOne19ClosedStatus isEqualToNumber:@1] && [self.playerOne18ClosedStatus isEqualToNumber:@1] && [self.playerOne17ClosedStatus isEqualToNumber:@1] && [self.playerOne16ClosedStatus isEqualToNumber:@1] && [self.playerOne15ClosedStatus isEqualToNumber:@1] && [self.playerOne25ClosedStatus isEqualToNumber:@1]) {
                NSLog(@"Player One Wins");
            }

        } else if ([n integerValue] == 25 && [closedStatus integerValue] == 1){
            self.playerOne25ClosedStatus = @1;
            if ([self.playerOne20ClosedStatus isEqualToNumber:@1] && [self.playerOne19ClosedStatus isEqualToNumber:@1] && [self.playerOne18ClosedStatus isEqualToNumber:@1] && [self.playerOne17ClosedStatus isEqualToNumber:@1] && [self.playerOne16ClosedStatus isEqualToNumber:@1] && [self.playerOne15ClosedStatus isEqualToNumber:@1] && [self.playerOne25ClosedStatus isEqualToNumber:@1]) {
                NSLog(@"Player One Wins");
            }

        }
                   
    }
}

    



//NSLog(@"Player One Wins")

// && ([n integerValue] == 19 && [closedStatus integerValue] == 1) && ([n integerValue] == 18 && [closedStatus integerValue] == 1) && ([n integerValue] == 17 && [closedStatus integerValue] == 1) && ([n integerValue] == 16 && [closedStatus integerValue] == 1) && ([n integerValue] == 15 && [closedStatus integerValue] == 1) && ([n integerValue] == 25 && [closedStatus integerValue] == 1)
//-(void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [super dealloc];
//}

    
    //    self.dartTwentyViewController.playerOneNumberScore + self.dartNinteenViewController.playerOneNumberScore =
    
    
    //    self.totalLabel.backgroundColor = [UIColor purpleColor];
    //    self.playerTwoScoreLabel.backgroundColor = [UIColor purpleColor];
    
    //}
    
@end
