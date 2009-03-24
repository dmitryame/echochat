//
//  ConversationController.m
//  echochat
//
//  Created by James Urquhart on 24/03/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ConversationController.h"


@implementation ConversationController

@synthesize navigation;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        navigation = nil;
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Correct frame
    CGRect newFrame = navigation.view.frame;
    newFrame.origin.y = 0;
    [navigation.view setFrame:newFrame];
    
    [self.view addSubview:navigation.view];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [navigation release];
    [super dealloc];
}


@end
