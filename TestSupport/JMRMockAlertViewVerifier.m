//
//  JMRMockAlertViewVerifier.m
//  Copyright 2013 Jonathan M. Reid. See LICENSE.txt
//

#import "JMRMockAlertViewVerifier.h"

#import "JMRMockAlertView.h"


@implementation JMRMockAlertViewVerifier

- (id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(alertShown:)
                                                     name:JMRMockAlertViewShowNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)alertShown:(NSNotification *)notification
{
    JMRMockAlertView *alert = [notification object];
	++_showCount;
	self.title = alert.title;
	self.message = alert.message;
	self.delegate = alert.delegate;
	self.cancelButtonTitle = alert.cancelButtonTitle;
	self.otherButtonTitles = alert.otherButtonTitles;
}

@end
