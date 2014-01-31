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

@property (nonatomic, readonly) NSInteger playerOneDartScore;
@property (nonatomic, readonly) NSInteger playerTwoDartScore;
@property (nonatomic, readonly) NSInteger dartNumber;

@property (nonatomic, readonly) ClosedStatus playerOneClosedStatus;
@property (nonatomic, readonly) ClosedStatus playerTwoClosedStatus;

- (instancetype)initWithDartNumber:(NSInteger)dartNumber;
- (BOOL)isPlayerOneClosed;
- (BOOL)isPlayerTwoClosed;
- (void)addPlayerOneDartScore;
- (void)addPlayerTwoDartScore;
- (void)subtractPlayerOneDartScore;
- (void)subtractPlayerTwoDartScore;



@end
