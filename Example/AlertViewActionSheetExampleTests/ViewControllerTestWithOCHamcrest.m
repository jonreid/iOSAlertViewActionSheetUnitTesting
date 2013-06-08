    // Class under test
#import "ViewController.h"

    // Test support
#import <SenTestingKit/SenTestingKit.h>
#import "JMRMockActionSheet.h"
#import "JMRMockActionSheetVerifier.h"
#import "JMRMockAlertView.h"
#import "JMRMockAlertViewVerifier.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>


@interface ViewControllerTestWithOCHamcrest : SenTestCase
@end

@implementation ViewControllerTestWithOCHamcrest
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
    assertThat([sut showAlertButton], is(notNilValue()));
}

- (void)testShowAlertButtonAction
{
    // when
    [sut view];
    
    // then
    UIButton *button = [sut showAlertButton];
    assertThat([button actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside],
               contains(@"showAlert:", nil));
}

- (void)testDefaultAlertViewClass
{
    assertThat([sut alertViewClass], is([UIAlertView class]));
}

- (void)testShowAlert
{
    // given
    [sut setAlertViewClass:[JMRMockAlertView class]];
    JMRMockAlertViewVerifier *alertVerifier = [[JMRMockAlertViewVerifier alloc] init];
    
    // when
    [sut showAlert:nil];
    
    // then
    assertThatInt([alertVerifier showCount], is(equalTo(@1)));
    assertThat([alertVerifier title], is(@"Get Driving Directions"));
    assertThat([alertVerifier message], is(@"Continue to the Maps app for driving directions?"));
    assertThat([alertVerifier delegate], is(sameInstance(sut)));
    assertThat([alertVerifier otherButtonTitles], contains(@"OK", nil));
    assertThat([alertVerifier cancelButtonTitle], is(@"Cancel"));
}

#pragma mark Action Sheet Tests

- (void)testShowActionSheetButtonShouldBeConnected
{
    // given
    [sut view];
    
    // then
    assertThat([sut showActionSheetButton], is(notNilValue()));
}

- (void)testShowActionSheetButtonAction
{
    // when
    [sut view];
    
    // then
    UIButton *button = [sut showActionSheetButton];
    assertThat([button actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside],
               contains(@"showActionSheet:", nil));
}

- (void)testDefaultActionSheetClass
{
    assertThat([sut actionSheetClass], is([UIActionSheet class]));
}

- (void)testShowActionSheet
{
    // given
    [sut setActionSheetClass:[JMRMockActionSheet class]];
    JMRMockActionSheetVerifier *sheetVerifier = [[JMRMockActionSheetVerifier alloc] init];
    
    // when
    [sut showActionSheet:nil];
    
    // then
    assertThatInt([sheetVerifier showCount], is(equalTo(@1)));
    assertThat([sheetVerifier parentView], is(sameInstance([sut view])));
    assertThat([sheetVerifier title], is(@"http://qualitycoding.org"));;
    assertThat([sheetVerifier delegate], is(sameInstance(sut)));
    assertThat([sheetVerifier cancelButtonTitle], is(@"Cancel"));
    assertThat([sheetVerifier otherButtonTitles], contains(@"Open in Safari", @"Copy link", nil));
}

@end
