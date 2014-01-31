//
//  DartNumberViewController.h
//  Cricket Scoreboard
//
//  Created by Jon on 1/28/14.
//  Copyright (c) 2014 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DartNumberModel.h"

@interface DartNumberViewController : UIViewController

@property (nonatomic) NSString *dartNumberText;
@property (nonatomic, readonly) NSInteger playerOneDartScore;
@property (nonatomic, readonly) NSInteger playerTwoDartScore;
@property (nonatomic, readonly) ClosedStatus playerOneClosedStatus;
@property (nonatomic, readonly) ClosedStatus playerTwoClosedStatus;

- (instancetype)initWithDartNumber:(NSInteger)dartNumber;


@end
