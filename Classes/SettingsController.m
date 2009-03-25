//
//  SettingsController.m
//  echochat
//
//  Created by James Urquhart on 25/03/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SettingsController.h"
#import "EditCell.h"
#import "echochatAppDelegate.h"

@implementation SettingsController

@synthesize tableView;
@synthesize navBar;
@synthesize editableCell;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        tableView = nil;
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
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
                                                                                target:self 
                                                                                action:@selector(commitSettings:)];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"Settings"];
    navigationItem.hidesBackButton = YES;
    navigationItem.rightBarButtonItem = buttonItem;
    [buttonItem release];
    
    [navBar pushNavigationItem:navigationItem animated:NO];
    [navigationItem release];
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

- (IBAction)commitSettings:(id)sender
{
    echochatAppDelegate *echo = [[UIApplication sharedApplication] delegate];
    [echo.tabBarController dismissModalViewControllerAnimated:YES];
}

// TableView delegate

- (void)tableView:(UITableView *)stableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // ...
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)stableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryNone;
}

- (void)tableView:(UITableView *)stableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // ...
}


NSString *kSCell = @"SCELL";

- (UITableViewCell *)tableView:(UITableView *)stableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    int section = indexPath.section;
    
    EditCell *cell = (EditCell *)[stableView dequeueReusableCellWithIdentifier:kSCell];
    
    if (cell == nil) {
        // Load the cell from EditCell nib
        [[NSBundle mainBundle] loadNibNamed:@"EditCell" owner:self options:nil];
        cell = editableCell;
        editableCell = nil;
    }
    
    if (row == 0)
        [cell setData:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Username", @"label", @"", @"content", nil]];
    else if (row == 1)
        [cell setData:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Password", @"label", @"", @"content", nil]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)stableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)stableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)stableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// TextField Delegate

- (bool)textFieldShouldReturn:(UITextField *)textField {
	return YES;
}

- (void)dealloc {
    [tableView release];
    [super dealloc];
}


@end
