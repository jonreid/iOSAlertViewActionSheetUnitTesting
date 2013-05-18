#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate,
                                              UIActionSheetDelegate>

@property (nonatomic, weak) IBOutlet UIButton *showAlertButton;
@property (nonatomic, weak) IBOutlet UIButton *showActionSheetButton;
@property (nonatomic, strong) Class alertViewClass;
@property (nonatomic, strong) Class actionSheetClass;

- (IBAction)showAlert:(id)sender;
- (IBAction)showActionSheet:(id)sender;

@end
