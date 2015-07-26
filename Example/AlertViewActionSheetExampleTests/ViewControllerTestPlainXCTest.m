// System under test
#import "ViewController.h"

// Test support
#import <XCTest/XCTest.h>
#import "JMRMockActionSheet.h"
#import "JMRMockActionSheetVerifier.h"
#import "JMRMockAlertView.h"
#import "JMRMockAlertViewVerifier.h"


@interface ViewControllerTestPlainXCTest : XCTestCase
@end

@implementation ViewControllerTestPlainXCTest
{
    ViewController *sut;
}

- (void)setUp
{
    [super setUp];
    sut = [[ViewController alloc] init];
    [sut view];
}

- (void)tearDown
{
    sut = nil;
    [super tearDown];
}

#pragma mark Alert View Tests

- (void)testShowAlertButton_ShouldBeConnected
{
    XCTAssertNotNil([sut showAlertButton]);
}

- (void)testShowAlertButtonAction
{
    NSArray *actions = [sut.showAlertButton actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside];

    XCTAssertEqual([actions count], (NSUInteger)1);
    XCTAssertEqualObjects(actions[0], @"showAlert:");
}

- (void)testDefaultAlertViewClass
{
    XCTAssertEqualObjects(sut.alertViewClass, [UIAlertView class]);
}

- (void)testShowAlert
{
    sut.alertViewClass = [JMRMockAlertView class];
    JMRMockAlertViewVerifier *alertVerifier = [[JMRMockAlertViewVerifier alloc] init];
    
    [sut showAlert:nil];

    XCTAssertEqual(alertVerifier.showCount, (NSUInteger)1);
    XCTAssertEqualObjects(alertVerifier.title, @"Get Driving Directions");
    XCTAssertEqualObjects(alertVerifier.message, @"Continue to the Maps app for driving directions?");
    XCTAssertEqual(alertVerifier.delegate, sut);
    NSArray *otherButtonTitles = alertVerifier.otherButtonTitles;
    XCTAssertEqualObjects(alertVerifier.cancelButtonTitle, @"Cancel");
    XCTAssertEqual([otherButtonTitles count], (NSUInteger)1);
    XCTAssertEqualObjects(otherButtonTitles[0], @"OK");
}

#pragma mark Action Sheet Tests

- (void)testShowActionSheetButton_ShouldBeConnected
{
    XCTAssertNotNil(sut.showActionSheetButton);
}

- (void)testShowActionSheetButtonAction
{
    NSArray *actions = [(sut.showActionSheetButton) actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside];

    XCTAssertEqual([actions count], (NSUInteger)1);
    XCTAssertEqualObjects(actions[0], @"showActionSheet:");
}

- (void)testDefaultActionSheetClass
{
    XCTAssertEqualObjects(sut.actionSheetClass, [UIActionSheet class]);
}

- (void)testShowActionSheet
{
    sut.actionSheetClass = [JMRMockActionSheet class];
    JMRMockActionSheetVerifier *sheetVerifier = [[JMRMockActionSheetVerifier alloc] init];
    
    [sut showActionSheet:nil];

    XCTAssertEqual(sheetVerifier.showCount, (NSUInteger)1);
    XCTAssertEqual(sheetVerifier.parentView, [sut view]);
    XCTAssertEqualObjects(sheetVerifier.title, @"http://qualitycoding.org");
    XCTAssertEqual(sheetVerifier.delegate, sut);
    XCTAssertEqualObjects(sheetVerifier.cancelButtonTitle, @"Cancel");
    NSArray *otherButtonTitles = sheetVerifier.otherButtonTitles;
    XCTAssertEqual([otherButtonTitles count], (NSUInteger)3);
    XCTAssertEqualObjects(otherButtonTitles[0], @"Open in Safari");
    XCTAssertEqualObjects(otherButtonTitles[1], @"Copy link");
    XCTAssertEqualObjects(otherButtonTitles[2], @"Separately added button");
}

@end
