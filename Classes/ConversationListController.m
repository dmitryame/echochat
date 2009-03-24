//
//  ConversationListController.m
//  echochat
//
//  Created by James Urquhart on 24/03/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ConversationListController.h"
#import "ConversationViewController.h"

@implementation ConversationListController

@synthesize conversations;
@dynamic list;


// The designated initializer. Override to perform setup that is required before the view is loaded.
// NOTE: THIS IS NOT CALLED ON STUFF IN THE NIB!
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        conversations = NULL;
    }
    return self;
}

- (void)waitForNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(conversationListLoaded:) name:@"ConversationListLoaded" object:nil];
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self waitForNotification];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)conversationListLoaded:(id)notification
{
    self.list = [NSMutableArray array];
    [list removeAllObjects];
    
    // TODO: grab a conversation list
    
    // For now, here's a dummy!
    for (int i=0; i<25; i++)
        [list addObject:[NSNull null]];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self]; // don't reload again!
    
    [conversations reloadData];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // ...
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // push conversation
    ConversationViewController *conversation = [[ConversationViewController alloc] initWithNibName:@"ConversationView" bundle:nil];
    [self.navigationController pushViewController:conversation animated:YES];
    [conversation release];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (tableView.editing) ? UITableViewCellEditingStyleDelete : UITableViewCellEditingStyleNone;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        int section = indexPath.section;
        [list removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

// Data manipulation - reorder / moving support

/*- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
 {
 }*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    return proposedDestinationIndexPath;
}

NSString *kCCell = @"CCELL";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    int section = indexPath.section;
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCCell];
    
    if (row < [list count]) {
        
        if (cell == nil)
            cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:kCCell] autorelease];
        
        cell.text = @"TEST";
        
        return cell;
    } else {
        //L0Log(@"Invalid row for section %i", section);
        return nil;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

- (NSMutableArray*)list
{
    return list;
}

- (void)setList:(NSMutableArray*)aValue
{
    if (list)
        [list release];
    
    list = [aValue retain];
    
    [conversations reloadData];
}

- (IBAction)editConversations:(id)sender
{
    conversations.editing = !conversations.editing;
    
    /*
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoops!"
                                                    message:@"Looks like this hasn't been implemented yet..."
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [conversations release];
    [list release];
    [super dealloc];
}


@end
