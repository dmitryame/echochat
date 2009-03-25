//
//  EditCell.m
//  echochat
//
//  Created by James Urquhart on 25/03/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EditCell.h"


@implementation EditCell

@synthesize label;
@synthesize content;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}

- (void)setData:(NSDictionary*)dict
{
    self.label.text = [dict objectForKey:@"label"];
    self.content.text = [dict objectForKey:@"content"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [label release];
    [content release];
    [super dealloc];
}


@end
