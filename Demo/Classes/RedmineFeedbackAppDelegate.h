//
//  RedmineFeedbackAppDelegate.h
//  RedmineFeedback
//
//  Created by Thibaut LE LEVIER on 15/04/11.
//  Copyright 2011 Thibaut LE LEVIER. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootVc;

@interface RedmineFeedbackAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RootVc *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RootVc *viewController;

@end

