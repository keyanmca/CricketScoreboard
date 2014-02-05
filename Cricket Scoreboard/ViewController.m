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
@property (nonatomic) UILabel *totalLabel;
@property (nonatomic) UILabel *playerOneScoreLabel;
@property (nonatomic) UILabel *playerTwoScoreLabel;
@property (nonatomic) UIButton *resetButton;

@property (nonatomic) NSNumber *playerOneScore;
@property (nonatomic) NSNumber *playerTwoScore;
@property (nonatomic) NSArray *dartNumberTextArray;
@property (nonatomic) NSArray *dartNumberArray;
@property (nonatomic) NSArray *dartViewControllersArray;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateScoreTotals)
                                                 name:@"PlayerStatusChanged"
                                               object:nil];
	
    
    self.view.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    
    self.dartNumberTextArray = @[@"20", @"19", @"18", @"17", @"16", @"15", @"B"];
    self.dartNumberArray = @[@20, @19, @18, @17, @16, @15, @25];
    
    NSMutableArray *dartViewControllersArray = [NSMutableArray array];
	
	NSInteger index = 0;
    CGFloat dartViewControllerXCoordinate = 90.0;
    for (NSString *dartNumberText in self.dartNumberTextArray) {
        NSNumber *dartNumber = self.dartNumberArray[index];
        DartNumberViewController *dartViewController = [[DartNumberViewController alloc] initWithDartNumber:[dartNumber integerValue]];
        dartViewController.dartNumberText = dartNumberText;
        dartViewController.view.frame = CGRectMake(0.0, dartViewControllerXCoordinate, 768.0, 105.0);
        [self.view addSubview:dartViewController.view];
        dartViewControllerXCoordinate += 105.0;
        index++;
        [dartViewControllersArray addObject:dartViewController];
    }
    self.dartViewControllersArray = dartViewControllersArray;
    
    
    DartNumberViewController *lastDartViewController = [self.dartViewControllersArray lastObject];
    DartNumberViewController *firstDartViewController = [self.dartViewControllersArray firstObject];
    CGFloat bottomRowYCoordinate = CGRectGetMaxY(lastDartViewController.view.frame);
    CGFloat topRowYCoordinate = CGRectGetMinY(firstDartViewController.view.frame);

    
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
	self.playerOneName.autocapitalizationType = UITextAutocapitalizationTypeWords;
    //    self.playerOneName.backgroundColor = [UIColor blueColor];
	self.playerOneName.delegate = self;
    [self.view addSubview:self.playerOneName];
	UIColor *color = [UIColor colorWithRed: 247.0/255.0 green:247.0/255.0 blue:247/255.0 alpha:1.0];
    self.playerOneName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Player One" attributes:@{NSForegroundColorAttributeName: color}];
    
    self.playerTwoName = [[UITextField alloc] initWithFrame:CGRectMake(434, 30, 332, 50)];
    self.playerTwoName.placeholder = [NSString stringWithFormat:@"Player Two"];
    self.playerTwoName.font = [UIFont systemFontOfSize:40];
    [self.playerTwoName setTextColor:[UIColor colorWithRed: 255.0/255.0 green:247.0/255.0 blue:247/255.0 alpha:1.0]];
    self.playerTwoName.textAlignment = NSTextAlignmentCenter;
	self.playerTwoName.autocapitalizationType = UITextAutocapitalizationTypeWords;
    //    self.playerTwoName.backgroundColor = [UIColor blueColor];
	self.playerTwoName.delegate = self;
    [self.view addSubview:self.playerTwoName];
    self.playerTwoName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Player Two" attributes:@{NSForegroundColorAttributeName: color}];
	
	
	self.resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.resetButton.frame = CGRectMake(0.0, CGRectGetMaxY(self.totalLabel.frame), 768, (CGRectGetMaxY(self.view.frame) - CGRectGetMaxY(self.totalLabel.frame)));
    [self.resetButton setTitle:[NSString stringWithFormat:@"Reset"] forState:UIControlStateNormal];
    self.resetButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.resetButton addTarget:self action:@selector(resetButtonTapped) forControlEvents:UIControlEventTouchUpInside];
	self.resetButton.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
    [self.view addSubview:self.resetButton];
}





- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


- (void)resetButtonTapped {
	NSLog(@"Reset Button Tapped");
	[[NSNotificationCenter defaultCenter] postNotificationName:@"Reset" object:self];
	self.playerOneScoreLabel.text = @"0";
	self.playerTwoScoreLabel.text = @"0";
}


- (void)updateScoreTotals {
	NSInteger playerOneTotal = 0;
	NSInteger playerTwoTotal = 0;
	BOOL playerOneAllClosed = YES;
	BOOL playerTwoAllClosed = YES;
	for (DartNumberViewController *dartNumberViewController in self.dartViewControllersArray) {
		playerOneTotal += dartNumberViewController.playerOneDartScore;
		playerTwoTotal += dartNumberViewController.playerTwoDartScore;
		if (playerOneAllClosed && dartNumberViewController.playerOneClosedStatus != closedStatusComplete) {
			playerOneAllClosed = NO;
		}
		if (playerTwoAllClosed && dartNumberViewController.playerTwoClosedStatus != closedStatusComplete) {
			playerTwoAllClosed = NO;
		}
	}
	
	self.playerOneScoreLabel.text = [NSString stringWithFormat:@"%d", playerOneTotal];
	self.playerTwoScoreLabel.text = [NSString stringWithFormat:@"%d", playerTwoTotal];
	
	
	
	if (playerOneAllClosed && (playerOneTotal > playerTwoTotal || playerTwoTotal == 0)) {
		NSLog(@"Player One Wins!");
		NSString *playerOneNameText = self.playerOneName.text;
		if ([self.playerOneName.text isEqualToString:@""]) {
			playerOneNameText = @"PLAYER ONE";
		}
		UIAlertView *playerOneWins = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ WINS!!!!", playerOneNameText] message:@"Play Again?" delegate:self cancelButtonTitle:@"Not Now" otherButtonTitles:@"Play Again", nil];
		[playerOneWins show];
		
	}
	if (playerTwoAllClosed && (playerTwoTotal > playerOneTotal || playerOneTotal == 0)) {
		NSLog(@"Player Two Wins!");
		NSString *playerTwoNameText = self.playerTwoName.text;
		if ([self.playerTwoName.text isEqualToString:@""]) {
			playerTwoNameText = @"PLAYER TWO";
		}
		UIAlertView *playerTwoWins = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ WINS!!!!", playerTwoNameText] message:@"Play Again?" delegate:self cancelButtonTitle:@"Not Now" otherButtonTitles:@"Play Again", nil];
		[playerTwoWins show];
	}
	

}

- (void)alertView:(UIAlertView *)playerOneWins clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSString *title = [playerOneWins buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Play Again"]) {
		NSLog(@"Reset Button Tapped");
		[[NSNotificationCenter defaultCenter] postNotificationName:@"Reset" object:self];
		self.playerOneScoreLabel.text = @"0";
		self.playerTwoScoreLabel.text = @"0";
	}
}


@end


    


    
