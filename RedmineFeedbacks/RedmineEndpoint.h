//
//  RedmineEndpoint.h
//  RedmineFeedback
//
//  Created by Thibaut LE LEVIER on 15/04/11.
//  Copyright 2011 Thibaut LE LEVIER. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RedmineEndpoint : NSObject {
	NSURL *redmineURL;
	NSString *redmineUser;
	NSString *redminePass;
	NSString *redmineProjectIdentifier;
	NSString *redmineTracker;
	NSString *redmineCategory;
}

@property (nonatomic, copy) NSString *redmineTracker;
@property (nonatomic, copy) NSString *redmineCategory;
@property (nonatomic, retain) NSURL *redmineURL;
@property (nonatomic, copy) NSString *redmineUser;
@property (nonatomic, copy) NSString *redminePass;
@property (nonatomic, copy) NSString *redmineProjectIdentifier;

-(NSURL*)issueEndpoint;

@end


