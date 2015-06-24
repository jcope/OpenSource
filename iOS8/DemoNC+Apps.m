//
//  DemoNC+Apps.m
//  iOS8
//
//  Created by Jeremy Cope on 5/16/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "DemoNC+Apps.h"
//Import your Demo
#import "EmmaApp.h"
#import "DemoWatchSpringboard.h"
#import "DemoRESideMenu.h"
#import "DemoIntent.h"
#import "DemoMWPhotoBrowser.h"
#import "DemoKingpin.h"

@implementation DemoNC (Apps)

-(void)createDemoApps{
    self.demoAppArray = [NSMutableArray arrayWithCapacity:20];
    
    //*********** Initialize and Add Demo App Here **************//
    [self.demoAppArray addObject:[[EmmaApp alloc] init]];
    [self.demoAppArray addObject:[[DemoWatchSpringboard alloc] init]];
    [self.demoAppArray addObject:[[DemoRESideMenu alloc] init]];
    [self.demoAppArray addObject:[[DemoIntent alloc] init]];
    [self.demoAppArray addObject:[[DemoMWPhotoBrowser alloc] init]];
    [self.demoAppArray addObject:[[DemoKingpin alloc] init]];
}
@end
