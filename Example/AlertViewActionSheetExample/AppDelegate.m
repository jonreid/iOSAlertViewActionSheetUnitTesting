#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _viewController = [[ViewController alloc] init];
    [_window setRootViewController:_viewController];
    [_window makeKeyAndVisible];
    return YES;
}

@end
