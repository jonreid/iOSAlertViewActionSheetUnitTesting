//
//  JMRMockAlertViewVerifier.m
//  Copyright 2013 Jonathan M. Reid. See LICENSE.txt
//

#import "JMRMockAlertViewVerifier.h"

#import "JMRMockAlertView.h"


@implementation JMRMockAlertViewVerifier

+ (id)verifier
{
    return [[self alloc] init];
}

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
	[self setTitle:[alert title]];
	[self setMessage:[alert message]];
	[self setDelegate:[alert delegate]];
	[self setCancelButtonTitle:[alert cancelButtonTitle]];
	[self setOtherButtonTitles:[alert otherButtonTitles]];
}

@end
