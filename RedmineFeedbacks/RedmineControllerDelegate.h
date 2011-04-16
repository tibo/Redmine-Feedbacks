//
//  RedmineControllerDelegate.h
//  RedmineFeedback
//
//  Created by Thibaut LE LEVIER on 16/04/11.
//  Copyright 2011 Thibaut LE LEVIER. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RedmineController;

@protocol RedmineControllerDelegate <NSObject>

-(void)issueDidSendWithID:(int)issueid;
@optional
-(void)issueDidFailWithHTTPReturnCode:(int)code;

@end
