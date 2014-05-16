//
//  AppDelegate.m
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoNC.h"
#import "HomeVC.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Launch the Demo Navigation
    //This creates the Demo Apps and the Home View for presentation
    DemoNC* navigation = [[DemoNC alloc] init];
    
    [self.window setRootViewController:navigation];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
