//
//  JMRMockActionSheetVerifier.m
//  Copyright 2013 Jonathan M. Reid. See LICENSE.txt
//

#import "JMRMockActionSheetVerifier.h"

#import "JMRMockActionSheet.h"


@implementation JMRMockActionSheetVerifier

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
	[self setParentView:[alert parentView]];
	[self setTitle:[alert title]];
	[self setDelegate:[alert delegate]];
	[self setCancelButtonTitle:[alert cancelButtonTitle]];
	[self setDestructiveButtonTitle:[alert destructiveButtonTitle]];
    [self setOtherButtonTitles:[alert otherButtonTitles]];
}

@end
