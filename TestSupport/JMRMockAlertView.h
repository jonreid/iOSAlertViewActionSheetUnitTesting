//
//  JMRMockAlertView.h
//  Copyright 2013 Jonathan M. Reid. See LICENSE.txt
//

#import <UIKit/UIKit.h>

extern NSString *const JMRMockAlertViewShowNotification;


/**
    Inject this class in place of the UIAlertView class.
    Instantiate a JMRMockAlertViewVerifier before the execution phase of your test.
 */
@interface JMRMockAlertView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, weak) id delegate;
@property (nonatomic, copy) NSString *cancelButtonTitle;
@property (nonatomic, strong) NSMutableArray *otherButtonTitles;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
- (void)show;

@end
