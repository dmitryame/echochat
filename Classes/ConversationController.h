//
//  ConversationController.h
//  echochat
//
//  Created by James Urquhart on 24/03/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ConversationController : UIViewController {
    IBOutlet UINavigationController *navigation;

}

@property(nonatomic, retain) UINavigationController* navigation;

@end
