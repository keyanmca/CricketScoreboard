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

- (void)testAddPlayerOneDartScore_setsTheDartNumberTotalTo20 {
	NSInteger expectedPlayerOneDartScore = 20;
	
	[self.testObject addPlayerOneDartScore];
	NSInteger actualPlayerOneDartScore = [self.testObject playerOneDartScore];
	
	XCTAssertEqual(actualPlayerOneDartScore, expectedPlayerOneDartScore, @"");
}

- (void)testAddPlayerOneDartScore_setsTheDartNumberTotalTo40 {
	NSInteger expectedPlayerOneDartScore = 40;
	
	[self.testObject addPlayerOneDartScore];
	[self.testObject addPlayerOneDartScore];
	NSInteger actualPlayerOneDartScore = [self.testObject playerOneDartScore];
	
	XCTAssertEqual(actualPlayerOneDartScore, expectedPlayerOneDartScore, @"");
}

- (void)testAddPlayerTwoDartScore_setsTheDartNumberTotalTo20 {
	NSInteger expectedPlayerTwoDartScore = 20;
	
	[self.testObject addPlayerTwoDartScore];
	NSInteger actualPlayerTwoDartScore = [self.testObject playerTwoDartScore];
	
	XCTAssertEqual(actualPlayerTwoDartScore, expectedPlayerTwoDartScore, @"");
}

- (void)testAddPlayerTwoDartScore_setsTheDartNumberTotalTo40 {
	NSInteger expectedPlayerTwoDartScore = 40;
	
	[self.testObject addPlayerTwoDartScore];
	[self.testObject addPlayerTwoDartScore];
	NSInteger actualPlayerTwoDartScore = [self.testObject playerTwoDartScore];
	
	XCTAssertEqual(actualPlayerTwoDartScore, expectedPlayerTwoDartScore, @"");
}

- (void)testSubtractPlayerOneDartScore_setsTheDartNumberTotalTo0 {
	NSInteger expectedPlayerOneDartScore = 0;
	
	[self.testObject subtractPlayerOneDartScore];
	NSInteger actualPlayerOneDartScore = [self.testObject playerOneDartScore];
	
	XCTAssertEqual(actualPlayerOneDartScore, expectedPlayerOneDartScore, @"");
}

//- (void)testSubtractPlayerOneDartScore_setsTheDartNumberTotalTo0 {
//	NSInteger expectedPlayerOneDartScore = 0;
//	
//	[self.testObject subtractPlayerOneDartScore];
//	[self.testObject subtractPlayerOneDartScore];
//}

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
