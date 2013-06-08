//
//  JMRMockActionSheetVerifier.h
//  Copyright 2013 Jonathan M. Reid. See LICENSE.txt
//

#import <UIKit/UIKit.h>


/**
    Captures JMRMockActionSheet arguments.
 */
@interface JMRMockActionSheetVerifier : NSObject

@property (nonatomic, assign) NSUInteger showCount;
@property (nonatomic, strong) UIView *parentView;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) id delegate;
@property (nonatomic, copy) NSString *cancelButtonTitle;
@property (nonatomic, copy) NSString *destructiveButtonTitle;
@property (nonatomic, copy) NSArray *otherButtonTitles;

- (id)init;

@end
