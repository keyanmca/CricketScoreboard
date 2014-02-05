//
//  DartNumberModel.m
//  Cricket Scoreboard
//
//  Created by Jon on 1/31/14.
//  Copyright (c) 2014 Jon. All rights reserved.
//

#import "DartNumberModel.h"

@interface DartNumberModel()

@property (nonatomic, readwrite) NSInteger playerOneDartScore;
@property (nonatomic, readwrite) NSInteger playerTwoDartScore;
@property (nonatomic, readwrite) ClosedStatus playerOneClosedStatus;
@property (nonatomic, readwrite) ClosedStatus playerTwoClosedStatus;
@property (nonatomic, readwrite) NSInteger dartNumber;

@end

@implementation DartNumberModel

- (instancetype)initWithDartNumber:(NSInteger)dartNumber {
    if (self = [super init]) {
        self.dartNumber = dartNumber;
    }
    return self;
}

- (BOOL)isPlayerOneClosed {
    return self.playerOneClosedStatus == closedStatusComplete;
}

- (BOOL)isPlayerTwoClosed {
    return self.playerTwoClosedStatus == closedStatusComplete;
}

- (void)addPlayerOneDartScore {
    if ([self isPlayerOneClosed] == YES && self.playerTwoClosedStatus != closedStatusComplete) {
        self.playerOneDartScore += self.dartNumber;
    }
    self.playerOneClosedStatus = [self nextClosedStatusForClosedStatus:self.playerOneClosedStatus];
//	self.playerOneDartScore += self.dartNumber;
}

- (void)addPlayerTwoDartScore {
    if([self isPlayerTwoClosed] == YES && self.playerOneClosedStatus != closedStatusComplete) {
        self.playerTwoDartScore += self.dartNumber;
    }
    self.playerTwoClosedStatus = [self nextClosedStatusForClosedStatus:self.playerTwoClosedStatus];
//	self.playerTwoDartScore += self.dartNumber;
}

- (void)subtractPlayerOneDartScore {
    if (self.playerOneDartScore > 0) {
        self.playerOneDartScore -= self.dartNumber;
    } else {
        self.playerOneClosedStatus = [self previousClosedStatusForClosedStatus:self.playerOneClosedStatus];
    }
//	self.playerOneDartScore = 0;
}

- (void)subtractPlayerTwoDartScore {
    if (self.playerTwoDartScore > 0) {
        self.playerTwoDartScore -= self.dartNumber;
    } else {
        self.playerTwoClosedStatus = [self previousClosedStatusForClosedStatus:self.playerTwoClosedStatus];
    }
}

- (ClosedStatus)nextClosedStatusForClosedStatus:(ClosedStatus)previousClosedStatus {
    ClosedStatus nextClosedStatus = closedStatusNone;
    switch (previousClosedStatus) {
        case closedStatusNone:
            nextClosedStatus = closedStatusSlash;
            break;
        case closedStatusSlash:
            nextClosedStatus = closedStatusEx;
            break;
        case closedStatusEx:
        case closedStatusComplete:
            nextClosedStatus = closedStatusComplete;
            break;
        default:
            nextClosedStatus = closedStatusNone;
            break;
    }
    return nextClosedStatus;
}

- (ClosedStatus)previousClosedStatusForClosedStatus:(ClosedStatus)currentClosedStatus {
    ClosedStatus previousClosedStatus = closedStatusNone;
    switch (currentClosedStatus) {
        case closedStatusComplete:
            previousClosedStatus = closedStatusEx;
            break;
        case closedStatusEx:
            previousClosedStatus = closedStatusSlash;
            break;
        case closedStatusSlash:
        case closedStatusNone:
            previousClosedStatus = closedStatusNone;
            break;
        default:
            previousClosedStatus = closedStatusNone;
            break;
    }
    return previousClosedStatus;
}

- (void)reset {
	self.playerOneDartScore = 0;
	self.playerTwoDartScore = 0;
	self.playerOneClosedStatus = closedStatusNone;
	self.playerTwoClosedStatus = closedStatusNone;
}



@end

