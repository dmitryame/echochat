//
//  EditCell.h
//  echochat
//
//  Created by James Urquhart on 25/03/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EditCell : UITableViewCell {
    IBOutlet UILabel* label;
    IBOutlet UITextField* content;
    
}

@property(nonatomic, retain) UILabel* label;
@property(nonatomic, retain) UITextField* content;

- (void)setData:(NSDictionary*)dict;

@end
