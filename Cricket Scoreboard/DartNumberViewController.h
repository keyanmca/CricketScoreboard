//
//  DartNumberViewController.h
//  Cricket Scoreboard
//
//  Created by Jon on 1/28/14.
//  Copyright (c) 2014 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DartNumberViewController : UIViewController

@property (nonatomic) NSString *dartNumberText;

- (instancetype)initWithDartNumber:(NSInteger)dartNumber;

@end
