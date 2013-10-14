//
//  JMRMockActionSheetVerifier.m
//  Copyright 2013 Jonathan M. Reid. See LICENSE.txt
//

#import "JMRMockActionSheetVerifier.h"

#import "JMRMockActionSheet.h"


@implementation JMRMockActionSheetVerifier

- (id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(actionSheetShown:)
                                                     name:JMRMockActionSheetShowNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)actionSheetShown:(NSNotification *)notification
{
    JMRMockActionSheet *alert = [notification object];
	++_showCount;
	self.parentView = alert.parentView;
	self.title = alert.title;
	self.delegate = alert.delegate;
	self.cancelButtonTitle = alert.cancelButtonTitle;
	self.destructiveButtonTitle = alert.destructiveButtonTitle;
    self.otherButtonTitles = alert.otherButtonTitles;
}

@end
