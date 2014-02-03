//
//  DartNumberModel.h
//  Cricket Scoreboard
//
//  Created by Jon on 1/31/14.
//  Copyright (c) 2014 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    closedStatusNone,
    closedStatusSlash,
    closedStatusEx,
    closedStatusComplete
} ClosedStatus;


@interface DartNumberModel : NSObject

@property (nonatomic) NSInteger playerOneDartScore;
@property (nonatomic) NSInteger playerTwoDartScore;
@property (nonatomic) NSInteger dartNumber;

@property (nonatomic) ClosedStatus playerOneClosedStatus;
@property (nonatomic) ClosedStatus playerTwoClosedStatus;

- (instancetype)initWithDartNumber:(NSInteger)dartNumber;
- (BOOL)isPlayerOneClosed;
- (BOOL)isPlayerTwoClosed;
- (void)addPlayerOneDartScore;
- (void)addPlayerTwoDartScore;
- (void)subtractPlayerOneDartScore;
- (void)subtractPlayerTwoDartScore;



@end
