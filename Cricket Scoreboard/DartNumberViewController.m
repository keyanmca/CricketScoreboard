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

@property (nonatomic) UIColor *borderColor;
@property (nonatomic) UIColor *lightTextColor;
@property (nonatomic) UIColor *numberBackgroundColor;

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
	
	self.borderColor = [UIColor colorWithRed:31.0/255.0 green:31.0/255.0 blue:33.0/255.0 alpha:1.0];
	self.lightTextColor = [UIColor colorWithRed: 247.0/255.0 green:247.0/255.0 blue:247/255.0 alpha:1.0];
	self.numberBackgroundColor = [UIColor colorWithRed:255.0/255.0 green:149.0/255.0 blue:0.0/255.0 alpha:1.0];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(resetGame)
												 name:@"Reset"
											   object:nil];
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		
		NSInteger plusMinusCellHeight = 104.0;
		
		self.playerOneMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
		self.playerOneMinusButton.frame = CGRectMake(0.0, 0.0, 165.0, plusMinusCellHeight);
		[self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
		self.playerOneMinusButton.titleLabel.font = [UIFont systemFontOfSize:50];
		[self.playerOneMinusButton setTitleColor:self.borderColor forState:UIControlStateNormal];
		[self.playerOneMinusButton addTarget:self action:@selector(playerOneMinusButtonTapped) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:self.playerOneMinusButton];
		
		UILabel *playerOneBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneMinusButton.frame), 0.0, 1.0, plusMinusCellHeight)];
		playerOneBorder.backgroundColor = self.borderColor;
		[self.view addSubview:playerOneBorder];
		
		//    self.playerOneMinusButton.backgroundColor = [UIColor redColor];
		
		self.playerOneAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
		self.playerOneAddButton.frame = CGRectMake(CGRectGetMaxX(playerOneBorder.frame), 0.0, 164.0, plusMinusCellHeight);
		[self.playerOneAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateNormal];
		[self.playerOneAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateHighlighted];
		[self.playerOneAddButton setContentMode:UIViewContentModeCenter];
		[self.playerOneAddButton setContentEdgeInsets:UIEdgeInsetsMake(15.0, 45.0, 15.0, 45.0)];
		
		[self.playerOneAddButton addTarget:self action:@selector(playerOneAddButtonTapped) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:self.playerOneAddButton];
		
		UILabel *leftSideBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneAddButton.frame), 0.0, 1.0, plusMinusCellHeight)];
		leftSideBorder.backgroundColor = self.borderColor;
		[self.view addSubview:leftSideBorder];
		
		//    self.playerOneAddButton.backgroundColor = [UIColor redColor];
		
		self.dartNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftSideBorder.frame), 0.0, 106.0, plusMinusCellHeight)];
		self.dartNumberLabel.text = self.dartNumberText;
		self.dartNumberLabel.backgroundColor = self.numberBackgroundColor;
		self.dartNumberLabel.font = [UIFont systemFontOfSize:50];
		[self.dartNumberLabel setTextColor:self.lightTextColor];
		self.dartNumberLabel.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:self.dartNumberLabel];
		
		UILabel *rightSideBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.dartNumberLabel.frame), 0.0, 1.0, plusMinusCellHeight)];
		rightSideBorder.backgroundColor = self.borderColor;
		[self.view addSubview:rightSideBorder];
		
		
		self.playerTwoAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[self.playerTwoAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateNormal];
		[self.playerTwoAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateHighlighted];
		[self.playerTwoAddButton setFrame:CGRectMake(CGRectGetMaxX(rightSideBorder.frame), 0.0, 164.0, plusMinusCellHeight)];
		[self.playerTwoAddButton setContentMode:UIViewContentModeCenter];
		[self.playerTwoAddButton setContentEdgeInsets:UIEdgeInsetsMake(15.0, 45.0, 15.0, 45.0)];
		[self.playerTwoAddButton addTarget:self action:@selector(playerTwoAddButtonTapped) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:self.playerTwoAddButton];
		
		UILabel *playerTwoBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerTwoAddButton.frame), 0.0, 1.0, plusMinusCellHeight)];
		playerTwoBorder.backgroundColor = self.borderColor;
		[self.view addSubview:playerTwoBorder];
		
		
		//    self.playerTwoAddButton.backgroundColor = [UIColor redColor];
		
		self.playerTwoMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
		self.playerTwoMinusButton.frame = CGRectMake(CGRectGetMaxX(playerTwoBorder.frame), 0.0, 165.0, plusMinusCellHeight);
		[self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
		self.playerTwoMinusButton.titleLabel.font = [UIFont systemFontOfSize:50];
		[self.playerTwoMinusButton setTitleColor:self.borderColor forState:UIControlStateNormal];
		[self.playerTwoMinusButton addTarget:self action:@selector(playerTwoMinusButtonTapped) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:self.playerTwoMinusButton];
		
		UILabel *bottomBorder = [[UILabel alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(self.dartNumberLabel.frame), 768.0, 1.0)];
		bottomBorder.backgroundColor = self.borderColor;
		[self.view addSubview:bottomBorder];
		
	} else {
		CGRect screenBounds = [[UIScreen mainScreen] bounds];
		if (screenBounds.size.height == 568) {
			
			NSInteger iPhone5PlusMinusCellHeight = 60.0;
			
			self.playerOneMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
			self.playerOneMinusButton.frame = CGRectMake(0.0, 0.0, 66.0, iPhone5PlusMinusCellHeight);
			[self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
			self.playerOneMinusButton.titleLabel.font = [UIFont systemFontOfSize:30];
			[self.playerOneMinusButton setTitleColor:self.borderColor forState:UIControlStateNormal];
			[self.playerOneMinusButton addTarget:self action:@selector(playerOneMinusButtonTapped) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:self.playerOneMinusButton];
			
			UILabel *playerOneBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneMinusButton.frame), 0.0, 1.0, iPhone5PlusMinusCellHeight)];
			playerOneBorder.backgroundColor = self.borderColor;
			[self.view addSubview:playerOneBorder];
			
			//    self.playerOneMinusButton.backgroundColor = [UIColor redColor];
			
			self.playerOneAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
			self.playerOneAddButton.frame = CGRectMake(CGRectGetMaxX(playerOneBorder.frame), 0.0, 66.0, iPhone5PlusMinusCellHeight);
			[self.playerOneAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateNormal];
			[self.playerOneAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateHighlighted];
			[self.playerOneAddButton setContentMode:UIViewContentModeCenter];
			[self.playerOneAddButton setContentEdgeInsets:UIEdgeInsetsMake(6.0, 8.0, 4.0, 8.0)];
			
			[self.playerOneAddButton addTarget:self action:@selector(playerOneAddButtonTapped) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:self.playerOneAddButton];
			
			UILabel *leftSideBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneAddButton.frame), 0.0, 1.0, iPhone5PlusMinusCellHeight)];
			leftSideBorder.backgroundColor = self.borderColor;
			[self.view addSubview:leftSideBorder];
			
			//    self.playerOneAddButton.backgroundColor = [UIColor redColor];
			
			self.dartNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftSideBorder.frame), 0.0, 52.0, 60.0)];
			self.dartNumberLabel.text = self.dartNumberText;
			self.dartNumberLabel.backgroundColor = self.numberBackgroundColor;
			self.dartNumberLabel.font = [UIFont systemFontOfSize:30];
			[self.dartNumberLabel setTextColor:self.lightTextColor];
			self.dartNumberLabel.textAlignment = NSTextAlignmentCenter;
			[self.view addSubview:self.dartNumberLabel];
			
			//		UILabel *dartNumberLabelBorder = [[UILabel alloc] initWithFrame:CGRectMake(0.0, (CGRectGetMaxY(self.dartNumberLabel.frame) - 1.0), 60.0, 1.0)];
			//		dartNumberLabelBorder.backgroundColor = self.borderColor;
			//		[self.dartNumberLabel addSubview:dartNumberLabelBorder];
			
			UILabel *rightSideBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.dartNumberLabel.frame), 0.0, 1.0, iPhone5PlusMinusCellHeight)];
			rightSideBorder.backgroundColor = self.borderColor;
			[self.view addSubview:rightSideBorder];
			
			
			self.playerTwoAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
			[self.playerTwoAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateNormal];
			[self.playerTwoAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateHighlighted];
			[self.playerTwoAddButton setFrame:CGRectMake(CGRectGetMaxX(rightSideBorder.frame), 0.0, 66.0, iPhone5PlusMinusCellHeight)];
			[self.playerTwoAddButton setContentMode:UIViewContentModeCenter];
			[self.playerTwoAddButton setContentEdgeInsets:UIEdgeInsetsMake(6.0, 8.0, 4.0, 8.0)];
			[self.playerTwoAddButton addTarget:self action:@selector(playerTwoAddButtonTapped) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:self.playerTwoAddButton];
			
			UILabel *playerTwoBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerTwoAddButton.frame), 0.0, 1.0, iPhone5PlusMinusCellHeight)];
			playerTwoBorder.backgroundColor = self.borderColor;
			[self.view addSubview:playerTwoBorder];
			
			
			//    self.playerTwoAddButton.backgroundColor = [UIColor redColor];
			
			self.playerTwoMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
			self.playerTwoMinusButton.frame = CGRectMake(CGRectGetMaxX(playerTwoBorder.frame), 0.0, 66.0, iPhone5PlusMinusCellHeight);
			[self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
			self.playerTwoMinusButton.titleLabel.font = [UIFont systemFontOfSize:30];
			[self.playerTwoMinusButton setTitleColor:self.borderColor forState:UIControlStateNormal];
			[self.playerTwoMinusButton addTarget:self action:@selector(playerTwoMinusButtonTapped) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:self.playerTwoMinusButton];
			
			UILabel *bottomBorder = [[UILabel alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(self.dartNumberLabel.frame) - 1.0, 320.0, 1.0)];
			bottomBorder.backgroundColor = self.borderColor;
			[self.view addSubview:bottomBorder];
			//		self.dartNumberLabel.backgroundColor = [UIColor clearColor];
			
		} else {
			
			NSInteger iPhone4PlusMinusCellHeight = 50.0;
			
			self.playerOneMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
			self.playerOneMinusButton.frame = CGRectMake(0.0, 0.0, 66.0, iPhone4PlusMinusCellHeight);
			[self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
			self.playerOneMinusButton.titleLabel.font = [UIFont systemFontOfSize:30];
			[self.playerOneMinusButton setTitleColor:self.borderColor forState:UIControlStateNormal];
			[self.playerOneMinusButton addTarget:self action:@selector(playerOneMinusButtonTapped) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:self.playerOneMinusButton];
			
			UILabel *playerOneBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneMinusButton.frame), 0.0, 1.0, iPhone4PlusMinusCellHeight)];
			playerOneBorder.backgroundColor = self.borderColor;
			[self.view addSubview:playerOneBorder];
			
			//    self.playerOneMinusButton.backgroundColor = [UIColor redColor];
			
			self.playerOneAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
			self.playerOneAddButton.frame = CGRectMake(CGRectGetMaxX(playerOneBorder.frame), 0.0, 66.0, iPhone4PlusMinusCellHeight);
			[self.playerOneAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateNormal];
			[self.playerOneAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateHighlighted];
			[self.playerOneAddButton setContentMode:UIViewContentModeCenter];
			[self.playerOneAddButton setContentEdgeInsets:UIEdgeInsetsMake(8.0, 12.0, 8.0, 12.0)];
			
			[self.playerOneAddButton addTarget:self action:@selector(playerOneAddButtonTapped) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:self.playerOneAddButton];
			
			UILabel *leftSideBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerOneAddButton.frame), 0.0, 1.0, iPhone4PlusMinusCellHeight)];
			leftSideBorder.backgroundColor = self.borderColor;
			[self.view addSubview:leftSideBorder];
			
			//    self.playerOneAddButton.backgroundColor = [UIColor redColor];
			
			self.dartNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftSideBorder.frame), 0.0, 52.0, 50.0)];
			self.dartNumberLabel.text = self.dartNumberText;
			self.dartNumberLabel.backgroundColor = self.numberBackgroundColor;
			self.dartNumberLabel.font = [UIFont systemFontOfSize:30];
			[self.dartNumberLabel setTextColor:self.lightTextColor];
			self.dartNumberLabel.textAlignment = NSTextAlignmentCenter;
			[self.view addSubview:self.dartNumberLabel];
			
			//		UILabel *dartNumberLabelBorder = [[UILabel alloc] initWithFrame:CGRectMake(0.0, (CGRectGetMaxY(self.dartNumberLabel.frame) - 1.0), 60.0, 1.0)];
			//		dartNumberLabelBorder.backgroundColor = self.borderColor;
			//		[self.dartNumberLabel addSubview:dartNumberLabelBorder];
			
			UILabel *rightSideBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.dartNumberLabel.frame), 0.0, 1.0, iPhone4PlusMinusCellHeight)];
			rightSideBorder.backgroundColor = self.borderColor;
			[self.view addSubview:rightSideBorder];
			
			
			self.playerTwoAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
			[self.playerTwoAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateNormal];
			[self.playerTwoAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateHighlighted];
			[self.playerTwoAddButton setFrame:CGRectMake(CGRectGetMaxX(rightSideBorder.frame), 0.0, 66.0, iPhone4PlusMinusCellHeight)];
			[self.playerTwoAddButton setContentMode:UIViewContentModeCenter];
			[self.playerTwoAddButton setContentEdgeInsets:UIEdgeInsetsMake(8.0, 12.0, 8.0, 12.0)];
			[self.playerTwoAddButton addTarget:self action:@selector(playerTwoAddButtonTapped) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:self.playerTwoAddButton];
			
			UILabel *playerTwoBorder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.playerTwoAddButton.frame), 0.0, 1.0, iPhone4PlusMinusCellHeight)];
			playerTwoBorder.backgroundColor = self.borderColor;
			[self.view addSubview:playerTwoBorder];
			
			
			//    self.playerTwoAddButton.backgroundColor = [UIColor redColor];
			
			self.playerTwoMinusButton = [UIButton buttonWithType:UIButtonTypeSystem];
			self.playerTwoMinusButton.frame = CGRectMake(CGRectGetMaxX(playerTwoBorder.frame), 0.0, 66.0, iPhone4PlusMinusCellHeight);
			[self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
			self.playerTwoMinusButton.titleLabel.font = [UIFont systemFontOfSize:30];
			[self.playerTwoMinusButton setTitleColor:self.borderColor forState:UIControlStateNormal];
			[self.playerTwoMinusButton addTarget:self action:@selector(playerTwoMinusButtonTapped) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:self.playerTwoMinusButton];
			
			UILabel *bottomBorder = [[UILabel alloc]initWithFrame:CGRectMake(0.0, CGRectGetMaxY(self.dartNumberLabel.frame) - 1.0, 320.0, 1.0)];
			bottomBorder.backgroundColor = self.borderColor;
			[self.view addSubview:bottomBorder];
			//		self.dartNumberLabel.backgroundColor = [UIColor clearColor];
			
		}
		
		
		
	}
    
    
    
    
//    self.view.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
}



- (NSString *)buttonCharacterForClosedStatus:(ClosedStatus)closedStatus {
    NSString *buttonCharacter; {
	switch (closedStatus) {
		case closedStatusSlash:
			buttonCharacter = @"Dart_Slash.png";
			break;
		case closedStatusEx:
			buttonCharacter = @"Dart_Ex.png";
			break;
		case closedStatusComplete:
			buttonCharacter = @"Dart_Closed.png";
			break;
		case closedStatusNone:
		default:
			buttonCharacter = @"Dart_Plus.png";
			break;
    }
    return buttonCharacter;
	}
}









// old code exists below.  this is what i used before the DartNumberModel.
- (void)playerOneAddButtonTapped
{
    [self.dartNumberModel addPlayerOneDartScore];
	
	[self.playerOneAddButton setImage:[UIImage imageNamed:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerOneClosedStatus]] forState:UIControlStateNormal];
	[self.playerOneAddButton setImage:[UIImage imageNamed:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerOneClosedStatus]] forState:UIControlStateHighlighted];

//	[self.playerOneAddButton setTitle:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerOneClosedStatus] forState:UIControlStateNormal];
    if (self.dartNumberModel.playerOneDartScore > 0) {
        [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%ld", (long)self.dartNumberModel.playerOneDartScore] forState:UIControlStateNormal];
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
	
	[self.playerTwoAddButton setImage:[UIImage imageNamed:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerTwoClosedStatus]] forState:UIControlStateNormal];
	[self.playerTwoAddButton setImage:[UIImage imageNamed:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerTwoClosedStatus]] forState:UIControlStateHighlighted];
	
//    [self.playerTwoAddButton setTitle:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerTwoClosedStatus] forState:UIControlStateNormal];
    
    if (self.dartNumberModel.playerTwoDartScore > 0) {
        [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"%ld", (long)self.dartNumberModel.playerTwoDartScore] forState:UIControlStateNormal];
    } else {
        [self.playerTwoMinusButton setTitle:@"-" forState:UIControlStateNormal];
    }
	[self notifyListenersOfStatusChange];

}

- (void)playerOneMinusButtonTapped
{
    [self.dartNumberModel subtractPlayerOneDartScore];
    [self.playerOneAddButton setImage:[UIImage imageNamed:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerOneClosedStatus]] forState:UIControlStateNormal];
	[self.playerOneAddButton setImage:[UIImage imageNamed:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerOneClosedStatus]] forState:UIControlStateHighlighted];
    if (self.dartNumberModel.playerOneDartScore == 0) {
        [self.playerOneMinusButton setTitle:@"-" forState:UIControlStateNormal];
    } else {
        [self.playerOneMinusButton setTitle:[NSString stringWithFormat:@"%ld",(long)self.dartNumberModel.playerOneDartScore] forState:UIControlStateNormal];
    }
	[self notifyListenersOfStatusChange];
}

- (void)playerTwoMinusButtonTapped
{
    [self.dartNumberModel subtractPlayerTwoDartScore];
	[self.playerTwoAddButton setImage:[UIImage imageNamed:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerTwoClosedStatus]] forState:UIControlStateNormal];
	[self.playerTwoAddButton setImage:[UIImage imageNamed:[self buttonCharacterForClosedStatus:self.dartNumberModel.playerTwoClosedStatus]] forState:UIControlStateHighlighted];
    if (self.dartNumberModel.playerTwoDartScore == 0) {
        [self.playerTwoMinusButton setTitle:@"-" forState:UIControlStateNormal];
    } else {
        [self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"%ld",(long)self.dartNumberModel.playerTwoDartScore] forState:UIControlStateNormal];
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
	[self.dartNumberModel reset];
//	self.dartNumberModel.playerOneDartScore = 0;
//	self.dartNumberModel.playerTwoDartScore = 0;
//	self.dartNumberModel.playerOneClosedStatus = closedStatusNone;
//	self.dartNumberModel.playerTwoClosedStatus = closedStatusNone;
	[self.playerOneMinusButton setTitle:@"-" forState:UIControlStateNormal];
	[self.playerOneAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateNormal];
	[self.playerOneAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateHighlighted];
	[self.playerTwoAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateNormal];
	[self.playerTwoAddButton setImage:[UIImage imageNamed:@"Dart_Plus.png"] forState:UIControlStateHighlighted];
	[self.playerTwoMinusButton setTitle:[NSString stringWithFormat:@"-"] forState:UIControlStateNormal];
}

@end
