    // Class under test
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
}

- (void)tearDown
{
    sut = nil;
    [super tearDown];
}

#pragma mark Alert View Tests

- (void)testShowAlertButtonShouldBeConnected
{
    // given
    [sut view];
    
    // then
    STAssertNotNil([sut showAlertButton], nil);
}

- (void)testShowAlertButtonAction
{
    // when
    [sut view];
    
    // then
    UIButton *button = [sut showAlertButton];
    NSArray *actions = [button actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside];
    STAssertEquals([actions count], 1U, nil);
    STAssertEqualObjects(actions[0], @"showAlert:", nil);
}

- (void)testDefaultAlertViewClass
{
    STAssertEqualObjects([sut alertViewClass], [UIAlertView class], nil);
}

- (void)testShowAlert
{
    // given
    [sut setAlertViewClass:[JMRMockAlertView class]];
    JMRMockAlertViewVerifier *alertVerifier = [[JMRMockAlertViewVerifier alloc] init];
    
    // when
    [sut showAlert:nil];
    
    // then
    STAssertEquals([alertVerifier showCount], 1U, nil);
    STAssertEqualObjects([alertVerifier title], @"Get Driving Directions", nil);
    STAssertEqualObjects([alertVerifier message], @"Continue to the Maps app for driving directions?", nil);
    STAssertEquals([alertVerifier delegate], sut, nil);
    NSArray *otherButtonTitles = [alertVerifier otherButtonTitles];
    STAssertEquals([otherButtonTitles count], 1U, nil);
    STAssertEqualObjects(otherButtonTitles[0], @"OK", nil);
    STAssertEqualObjects([alertVerifier cancelButtonTitle], @"Cancel", nil);
}

#pragma mark Action Sheet Tests

- (void)testShowActionSheetButtonShouldBeConnected
{
    // given
    [sut view];
    
    // then
    STAssertNotNil([sut showActionSheetButton], nil);
}

- (void)testShowActionSheetButtonAction
{
    // when
    [sut view];
    
    // then
    UIButton *button = [sut showActionSheetButton];
    NSArray *actions = [button actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside];
    STAssertEquals([actions count], 1U, nil);
    STAssertEqualObjects(actions[0], @"showActionSheet:", nil);
}

- (void)testDefaultActionSheetClass
{
    STAssertEqualObjects([sut actionSheetClass], [UIActionSheet class], nil);
}

- (void)testShowActionSheet
{
    // given
    [sut setActionSheetClass:[JMRMockActionSheet class]];
    JMRMockActionSheetVerifier *sheetVerifier = [[JMRMockActionSheetVerifier alloc] init];
    
    // when
    [sut showActionSheet:nil];
    
    // then
    STAssertEquals([sheetVerifier showCount], 1U, nil);
    STAssertEquals([sheetVerifier parentView], [sut view], nil);
    STAssertEqualObjects([sheetVerifier title], @"http://qualitycoding.org", nil);
    STAssertEquals([sheetVerifier delegate], sut, nil);
    STAssertEqualObjects([sheetVerifier cancelButtonTitle], @"Cancel", nil);
    NSArray *otherButtonTitles = [sheetVerifier otherButtonTitles];
    STAssertEquals([otherButtonTitles count], 2U, nil);
    STAssertEqualObjects(otherButtonTitles[0], @"Open in Safari", nil);
    STAssertEqualObjects(otherButtonTitles[1], @"Copy link", nil);
}

@end
