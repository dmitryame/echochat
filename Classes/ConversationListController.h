//
//  ConversationListController.h
//  echochat
//
//  Created by James Urquhart on 24/03/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// table view cell content offsets
#define kCellLeftOffset			8.0
#define kCellTopOffset			12.0
#define kCellDescriptionOffset	24.0

#define kCellHeight 64.0


@interface ConversationListController : UIViewController {
    IBOutlet UITableView *conversations;
    
    NSMutableArray *list;
}

@property(nonatomic, retain) UITableView *conversations;
@property(nonatomic, retain) NSMutableArray *list;

- (IBAction)editConversations:(id)sender;
- (void)waitForNotification;

@end
