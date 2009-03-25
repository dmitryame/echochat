//
//  SettingsController.h
//  echochat
//
//  Created by James Urquhart on 25/03/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditCell;

@interface SettingsController : UIViewController {
    IBOutlet UITableView* tableView;
    IBOutlet UINavigationBar* navBar;
    
    IBOutlet EditCell *editableCell; // loaded from EditCell.xib

}

@property(nonatomic, retain) UITableView* tableView;
@property(nonatomic, retain) UINavigationBar* navBar;
@property(nonatomic, retain) EditCell* editableCell;

- (IBAction)commitSettings:(id)sender;

@end
