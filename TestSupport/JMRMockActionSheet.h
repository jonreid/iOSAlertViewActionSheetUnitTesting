//
//  JMRMockActionSheet.h
//  Copyright 2013 Jonathan M. Reid. See LICENSE.txt
//

#import <UIKit/UIKit.h>

extern NSString *const JMRMockActionSheetShowNotification;


/**
    Inject this class in place of the UIActionSheet class.
    Instantiate a JMRMockActionSheetVerifier before the execution phase of your test.
 */
@interface JMRMockActionSheet : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, weak) id delegate;
@property (nonatomic, copy) NSString *cancelButtonTitle;
@property (nonatomic, copy) NSString *destructiveButtonTitle;
@property (nonatomic, strong) NSMutableArray *otherButtonTitles;
@property (nonatomic, strong) UIView *parentView;
@property (nonatomic, assign) UIActionSheetStyle actionSheetStyle;

- (id)initWithTitle:(NSString *)title delegate:(id <UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;
- (void)showInView:(UIView *)view;

@end
