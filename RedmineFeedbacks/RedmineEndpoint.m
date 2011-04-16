//
//  RedmineEndpoint.m
//  RedmineFeedback
//
//  Created by Thibaut LE LEVIER on 15/04/11.
//  Copyright 2011 Thibaut LE LEVIER. All rights reserved.
//

#import "RedmineEndpoint.h"


@implementation RedmineEndpoint

@synthesize redmineTracker;
@synthesize redmineCategory;
@synthesize redmineURL;
@synthesize redmineUser;
@synthesize redminePass;
@synthesize redmineProjectIdentifier;

- (void)dealloc
{
	[redmineURL release], redmineURL = nil;
	[redmineUser release], redmineUser = nil;
	[redminePass release], redminePass = nil;
	[redmineProjectIdentifier release], redmineProjectIdentifier = nil;
	[redmineTracker release], redmineTracker = nil;
	[redmineCategory release], redmineCategory = nil;

	[super dealloc];
}

-(NSURL*)issueEndpoint
{
	return [NSURL URLWithString:
			[NSString stringWithFormat:@"%@://%@:%@@%@%@/projects/%@/issues.xml",[self.redmineURL scheme],self.redmineUser,self.redminePass,[self.redmineURL host],[self.redmineURL relativePath],self.redmineProjectIdentifier]
			];
}

@end


