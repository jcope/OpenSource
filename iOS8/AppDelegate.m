//
//  AppDelegate.m
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeVC.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Launch the Home View Controller with acess to the demo collection
    HomeVC* homeVC = [[HomeVC alloc] init];
    [self.window setRootViewController:homeVC];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
