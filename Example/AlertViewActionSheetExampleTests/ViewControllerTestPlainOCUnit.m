// System under test
#import "ViewController.h"

// Test support
#import <SenTestingKit/SenTestingKit.h>
#import "JMRMockActionSheet.h"
#import "JMRMockActionSheetVerifier.h"
#import "JMRMockAlertView.h"
#import "JMRMockAlertViewVerifier.h"


@interface ViewControllerTestPlainOCUnit : SenTestCase
@end

@implementation ViewControllerTestPlainOCUnit
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
    STAssertNotNil([sut showAlertButton], nil);
}

- (void)testShowAlertButtonAction
{
    NSArray *actions = [sut.showAlertButton actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside];
    STAssertEquals([actions count], 1U, nil);
    STAssertEqualObjects(actions[0], @"showAlert:", nil);
}

- (void)testDefaultAlertViewClass
{
    STAssertEqualObjects(sut.alertViewClass, [UIAlertView class], nil);
}

- (void)testShowAlert
{
    sut.alertViewClass = [JMRMockAlertView class];
    JMRMockAlertViewVerifier *alertVerifier = [[JMRMockAlertViewVerifier alloc] init];
    
    [sut showAlert:nil];
    STAssertEquals(alertVerifier.showCount, 1U, nil);
    STAssertEqualObjects(alertVerifier.title, @"Get Driving Directions", nil);
    STAssertEqualObjects(alertVerifier.message, @"Continue to the Maps app for driving directions?", nil);
    STAssertEquals(alertVerifier.delegate, sut, nil);
    NSArray *otherButtonTitles = alertVerifier.otherButtonTitles;
    STAssertEquals([otherButtonTitles count], 1U, nil);
    STAssertEqualObjects(otherButtonTitles[0], @"OK", nil);
    STAssertEqualObjects(alertVerifier.cancelButtonTitle, @"Cancel", nil);
}

#pragma mark Action Sheet Tests

- (void)testShowActionSheetButton_ShouldBeConnected
{
    STAssertNotNil(sut.showActionSheetButton, nil);
}

- (void)testShowActionSheetButtonAction
{
    NSArray *actions = [(sut.showActionSheetButton) actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside];
    STAssertEquals([actions count], 1U, nil);
    STAssertEqualObjects(actions[0], @"showActionSheet:", nil);
}

- (void)testDefaultActionSheetClass
{
    STAssertEqualObjects(sut.actionSheetClass, [UIActionSheet class], nil);
}

- (void)testShowActionSheet
{
    sut.actionSheetClass = [JMRMockActionSheet class];
    JMRMockActionSheetVerifier *sheetVerifier = [[JMRMockActionSheetVerifier alloc] init];
    
    [sut showActionSheet:nil];
    STAssertEquals(sheetVerifier.showCount, 1U, nil);
    STAssertEquals(sheetVerifier.parentView, [sut view], nil);
    STAssertEqualObjects(sheetVerifier.title, @"http://qualitycoding.org", nil);
    STAssertEquals(sheetVerifier.delegate, sut, nil);
    STAssertEqualObjects(sheetVerifier.cancelButtonTitle, @"Cancel", nil);
    NSArray *otherButtonTitles = sheetVerifier.otherButtonTitles;
    STAssertEquals([otherButtonTitles count], 2U, nil);
    STAssertEqualObjects(otherButtonTitles[0], @"Open in Safari", nil);
    STAssertEqualObjects(otherButtonTitles[1], @"Copy link", nil);
}

@end
