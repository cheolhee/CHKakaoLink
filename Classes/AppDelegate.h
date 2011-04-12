//
//  NEKakaoAppDelegate.h
//  NEKakao
//
//  Created by cheolhee on 11/04/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHKakaoViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CHKakaoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CHKakaoViewController *viewController;

@end

