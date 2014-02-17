#import "DartNumberModel.h"
#import <XCTest/XCTest.h>

@interface DartNumberModel()

@property (nonatomic, readwrite) NSInteger playerOneDartScore;
@property (nonatomic, readwrite) NSInteger playerTwoDartScore;
@property (nonatomic, readwrite) ClosedStatus playerOneClosedStatus;
@property (nonatomic, readwrite) ClosedStatus playerTwoClosedStatus;
@property (nonatomic, readwrite) NSInteger dartNumber;

@end

@interface DartNumberModelTest : XCTestCase

@property (nonatomic) DartNumberModel *testObject;
@property (nonatomic) NSInteger dartNumber;

@end

@implementation DartNumberModelTest

- (void)setUp {
    [super setUp];
	self.dartNumber = 20;
	self.testObject = [[DartNumberModel alloc] initWithDartNumber:self.dartNumber];
}

- (void)testAddPlayerTwoDartScore_setsTheDartNumberTotalTo20 {
	NSInteger expectedPlayerTwoDartScore = 20;
	
	[self.testObject addPlayerTwoDartScore];
	NSInteger actualPlayerTwoDartScore = [self.testObject playerTwoDartScore];
	
	XCTAssertEqual(actualPlayerTwoDartScore, expectedPlayerTwoDartScore, @"");
}

- (void)testAddPlayerTwoDartScore_withScoreOf60_setsTheDartNumberTotalTo40 {
	NSInteger expectedPlayerTwoDartScore = 40;
	
	[self.testObject addPlayerTwoDartScore];
	[self.testObject addPlayerTwoDartScore];
	NSInteger actualPlayerTwoDartScore = [self.testObject playerTwoDartScore];
	
	XCTAssertEqual(actualPlayerTwoDartScore, expectedPlayerTwoDartScore, @"");
}

- (void)testSubtractPlayerOneDartScore_withScoreOf60_subtractsDartNumberFromPlayerOneScore {
	self.testObject.playerOneDartScore = 60;
	NSInteger expectedPlayerOneDartScore = 40;
	
	[self.testObject subtractPlayerOneDartScore];
	
	NSInteger actualPlayerOneDartScore = [self.testObject playerOneDartScore];
	XCTAssertEqual(actualPlayerOneDartScore, expectedPlayerOneDartScore, @"");
}

- (void)testSubtractPlayerOneDartScore_withScoreOf40_subtractsDartNumberFromPlayerOneScore {
	self.testObject.playerOneDartScore = 40;
	NSInteger expectedPlayerOneDartScore = 20;
	
	[self.testObject subtractPlayerOneDartScore];
	
	NSInteger actualPlayerOneDartScore = [self.testObject playerOneDartScore];
	XCTAssertEqual(actualPlayerOneDartScore, expectedPlayerOneDartScore, @"");
}

- (void)testSubtractPlayerTwoDartScore_withScoreOf40_subtractsDartNumberFromPlayerTwoScore {
	self.testObject.playerTwoDartScore = 40;
	NSInteger expectedPlayerTwoDartScore = 20;
	
	[self.testObject subtractPlayerTwoDartScore];
	
	NSInteger actualPlayerTwoDartScore = [self.testObject playerTwoDartScore];
	XCTAssertEqual(actualPlayerTwoDartScore, expectedPlayerTwoDartScore, @"");
}

- (void)testSubtractPlayerTwoDartScore_withScoreOf60_subtractsDartNumberFromPlayerTwoScore {
	self.testObject.playerTwoDartScore = 60;
	NSInteger expectedPlayerTwoDartScore = 40;
	
	[self.testObject subtractPlayerTwoDartScore];
	
	NSInteger actualPlayerTwoDartScore = [self.testObject playerTwoDartScore];
	XCTAssertEqual(actualPlayerTwoDartScore, expectedPlayerTwoDartScore, @"");
}

- (void)testSubtractPlayerOneDartScore_doesNotSubtractFromPlayerOneScore_IfScoreIsZero {
	self.testObject.playerOneDartScore = 0;
	NSInteger expectedPlayerOneDartScore = 0;
	
	[self.testObject subtractPlayerOneDartScore];
	
	NSInteger actualPlayerOneDartScore = [self.testObject playerOneDartScore];
	XCTAssertEqual(actualPlayerOneDartScore, expectedPlayerOneDartScore, @"");
}

- (void)testSubtractPlayerTwoDartScore_doesNotSubtractFromPlayerTwoScore_IfScoreIsZero {
	self.testObject.playerTwoDartScore = 0;
	NSInteger expectedPlayerTwoDartScore = 0;
	
	[self.testObject subtractPlayerTwoDartScore];
	
	NSInteger actualPlayerTwoDartScore = [self.testObject playerTwoDartScore];
	XCTAssertEqual(actualPlayerTwoDartScore, expectedPlayerTwoDartScore, @"");
}

- (void)testAddPlayerOneScore_OnlyIfClosedStatusIsNotClosedStatusSlash {
	self.testObject.playerOneDartScore = 0;
	self.testObject.playerOneClosedStatus = closedStatusSlash;
	NSInteger expectedScore = 0;
	
	[self.testObject addPlayerOneDartScore];
	
	NSInteger actualScore = self.testObject.playerOneDartScore;
	XCTAssertEqual(actualScore, expectedScore, @"");
}

- (void)testAddPlayerOneScore_OnlyIfClosedStatusIsNotClosedStatusEx {
	self.testObject.playerOneDartScore = 0;
	self.testObject.playerOneClosedStatus = closedStatusEx;
	NSInteger expectedScore = 0;
	
	[self.testObject addPlayerOneDartScore];
	
	NSInteger actualScore = self.testObject.playerOneDartScore;
	XCTAssertEqual(actualScore, expectedScore, @"");
}

- (void)testAddPlayerOneScore_OnlyIfClosedStatusIsNotClosedStatusNone {
	self.testObject.playerOneDartScore = 0;
	self.testObject.playerOneClosedStatus = closedStatusNone;
	NSInteger expectedScore = 0;
	
	[self.testObject addPlayerOneDartScore];
	
	NSInteger actualScore = self.testObject.playerOneDartScore;
	XCTAssertEqual(actualScore, expectedScore, @"");
}

- (void)testAddPlayerOneScore_DoNotAddScoreIfPlayerTwoStatusIsClosedStatusComplete {
	self.testObject.playerOneDartScore = 20;
	self.testObject.playerOneClosedStatus = closedStatusComplete;
	self.testObject.playerTwoClosedStatus = closedStatusComplete;
	NSInteger expectedScore = 20;
	
	[self.testObject addPlayerOneDartScore];
	
	NSInteger actualScore = self.testObject.playerOneDartScore;
	XCTAssertEqual(actualScore, expectedScore, @"");
}

- (void)testAddPlayerOneScore_SetsNextStatusToSlashIfStatusIsNotComplete {
	self.testObject.playerOneClosedStatus = closedStatusNone;
	ClosedStatus expectedClosedStatus = closedStatusSlash;
	
	[self.testObject addPlayerOneDartScore];
	
	ClosedStatus actualClosedStatus = self.testObject.playerOneClosedStatus;
	XCTAssertEqual(actualClosedStatus, expectedClosedStatus, @"");
}

- (void)testAddPlayerOneScore_SetsNextStatusToExIfStatusIsNotComplete {
	self.testObject.playerOneClosedStatus = closedStatusSlash;
	ClosedStatus expectedClosedStatus = closedStatusEx;
	
	[self.testObject addPlayerOneDartScore];
	
	ClosedStatus actualClosedStatus = self.testObject.playerOneClosedStatus;
	XCTAssertEqual(actualClosedStatus, expectedClosedStatus, @"");
}


- (void)testReset_ResetsAllScoresAndStatuses {
	self.testObject.playerOneDartScore = 45;
	self.testObject.playerTwoDartScore = 108;
	self.testObject.playerOneClosedStatus = closedStatusEx;
	self.testObject.playerTwoClosedStatus = closedStatusSlash;
	
	[self.testObject reset];
	
	XCTAssertEqual(self.testObject.playerOneDartScore, (NSInteger)0, @"");
	XCTAssertEqual(self.testObject.playerTwoDartScore, (NSInteger)0, @"");
	XCTAssertEqual(self.testObject.playerOneClosedStatus, closedStatusNone, @"");
	XCTAssertEqual(self.testObject.playerTwoClosedStatus, closedStatusNone, @"");
}

@end
