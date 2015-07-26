// System under test
#import "ViewController.h"

// Test support
#import <XCTest/XCTest.h>
#import "JMRMockActionSheet.h"
#import "JMRMockActionSheetVerifier.h"
#import "JMRMockAlertView.h"
#import "JMRMockAlertViewVerifier.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>


@interface ViewControllerTestWithOCHamcrest : XCTestCase
@end

@implementation ViewControllerTestWithOCHamcrest
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
    assertThat(sut.showAlertButton, is(notNilValue()));
}

- (void)testShowAlertButtonAction
{
    assertThat([sut.showAlertButton actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside],
               contains(@"showAlert:", nil));
}

- (void)testDefaultAlertViewClass
{
    assertThat(sut.alertViewClass, is([UIAlertView class]));
}

- (void)testShowAlert
{
    sut.alertViewClass = [JMRMockAlertView class];
    JMRMockAlertViewVerifier *alertVerifier = [[JMRMockAlertViewVerifier alloc] init];
    
    [sut showAlert:nil];
    assertThat(@(alertVerifier.showCount), is(equalTo(@1)));
    assertThat(alertVerifier.title, is(@"Get Driving Directions"));
    assertThat(alertVerifier.message, is(@"Continue to the Maps app for driving directions?"));
    assertThat(alertVerifier.delegate, is(sameInstance(sut)));
    assertThat(alertVerifier.otherButtonTitles, contains(@"OK", nil));
    assertThat(alertVerifier.cancelButtonTitle, is(@"Cancel"));
}

#pragma mark Action Sheet Tests

- (void)testShowActionSheetButton_ShouldBeConnected
{
    assertThat(sut.showActionSheetButton, is(notNilValue()));
}

- (void)testShowActionSheetButtonAction
{
    assertThat([sut.showActionSheetButton actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside],
               contains(@"showActionSheet:", nil));
}

- (void)testDefaultActionSheetClass
{
    assertThat(sut.actionSheetClass, is([UIActionSheet class]));
}

- (void)testShowActionSheet
{
    sut.actionSheetClass = [JMRMockActionSheet class];
    JMRMockActionSheetVerifier *sheetVerifier = [[JMRMockActionSheetVerifier alloc] init];
    
    [sut showActionSheet:nil];
    assertThat(@(sheetVerifier.showCount), is(equalTo(@1)));
    assertThat(sheetVerifier.parentView, is(sameInstance([sut view])));
    assertThat(sheetVerifier.title, is(@"http://qualitycoding.org"));;
    assertThat(sheetVerifier.delegate, is(sameInstance(sut)));
    assertThat(sheetVerifier.cancelButtonTitle, is(@"Cancel"));
    assertThat(sheetVerifier.otherButtonTitles, contains(@"Open in Safari", @"Copy link", nil));
}

@end
