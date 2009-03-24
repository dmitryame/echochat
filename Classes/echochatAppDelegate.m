//
//  echochatAppDelegate.m
//  echochat
//
//  Created by James Urquhart on 24/03/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "echochatAppDelegate.h"


@implementation echochatAppDelegate

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
    
    
	[self performSelector:@selector(postLoad:) withObject:nil afterDelay:0.1];
}

- (void)postLoad:(id)object
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ConversationListLoaded" object:nil userInfo:nil];
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

