//
//  AppDelegate.m
//  ChatDemo
//
//  Created by goofygao on 9/2/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "AppDelegate.h"
#import "GFNavigationController.h"
#import "GFHomeChatTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self configLaunchLog];
    
    [self configRootViewController];
    
    return YES;
}



- (void)configRootViewController {
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUND];
    GFNavigationController *nav = [[GFNavigationController alloc] initWithRootViewController:[GFHomeChatTableViewController new]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

- (void)configLaunchLog {
    GFLog(@"APP网络请求ROOT_URL=%@",GFAPIRootBsseURL);
}

@end
