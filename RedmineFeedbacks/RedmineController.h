//
//  RedmineController.h
//  RedmineFeedback
//
//  Created by Thibaut LE LEVIER on 15/04/11.
//  Copyright 2011 Thibaut LE LEVIER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RedmineControllerDelegate.h"

@interface RedmineController : NSObject {
	
	id <RedmineControllerDelegate> delegate;

	NSMutableData *connectionData;
	NSString *host;
	NSString *issuetitle;
}

-(void)addIssueWithTitle:(NSString*)title Author:(NSString*)author AuthorMail:(NSString*)mail andDescription:(NSString*)desc toEndPoint:(NSURL*)endpoint;

- (void)setDelegate:(id)val;
- (id)delegate;

@end
