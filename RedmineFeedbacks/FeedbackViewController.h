//
//  FeedbackViewController.h
//  RedmineFeedback
//
//  Created by Thibaut LE LEVIER on 15/04/11.
//  Copyright 2011 Thibaut LE LEVIER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedmineEndpoint.h"
#import "RedmineController.h"

@interface FeedbackViewController : UIViewController <RedmineControllerDelegate> {
	IBOutlet UINavigationItem *navbar;
	IBOutlet UITextField *namefield;
	IBOutlet UITextField *mailfield;
	IBOutlet UITextField *subjectfield;
	IBOutlet UITextView *messagefield;
	RedmineEndpoint *endpoint;
}

@property (nonatomic, retain) RedmineEndpoint *endpoint;

-(IBAction)editTitle;
-(IBAction)quitFeedback;
-(IBAction)sendFeedback;
@end

