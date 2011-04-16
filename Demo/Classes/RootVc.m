//
//  RootVc.m
//  RedmineFeedback
//
//  Created by Thibaut LE LEVIER on 15/04/11.
//  Copyright 2011 Thibaut LE LEVIER. All rights reserved.
//

#import "RootVc.h"


@implementation RootVc

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

-(IBAction)sendFeedback
{
	FeedbackViewController *feedbackvc = [[FeedbackViewController alloc] initWithNibName:@"FeedbackViewController" bundle:nil];
	
	RedmineEndpoint *ep = [[RedmineEndpoint alloc] init];
	ep.redmineURL = [NSURL URLWithString:@"http://192.168.1.81/redmine"];
	ep.redmineUser = @"admin";
	ep.redminePass = @"admin";
	ep.redmineProjectIdentifier = @"test2";
	feedbackvc.endpoint = ep;
	[ep release];
	
	[self presentModalViewController:feedbackvc animated:YES];
	[feedbackvc release];
}


@end
