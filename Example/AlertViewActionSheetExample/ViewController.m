#import "ViewController.h"

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // By default, we want to use the real UIAlertView and UIActionSheet classes.
        // Don't just copy this; TDD your way here by writing a failing test.
        _alertViewClass = [UIAlertView class];
        _actionSheetClass = [UIActionSheet class];
    }
    return self;
}

- (IBAction)showAlert:(id)sender
{
    // Allocate _alertViewClass instead of UIAlertView.
    UIAlertView *alertView = [[_alertViewClass alloc] initWithTitle:@"Get Driving Directions"
                                                            message:@"Continue to the Maps app for driving directions?"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (IBAction)showActionSheet:(id)sender
{
    // Allocate _actionSheetClass instead of UIActionSheet.
    UIActionSheet *actionSheet = [[_actionSheetClass alloc] initWithTitle:@"http://qualitycoding.org"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Open in Safari", @"Copy link", nil];
    [actionSheet showInView:[self view]];
}

@end
