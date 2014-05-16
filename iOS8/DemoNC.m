//
//  DemoNC.m
//  iOS8
//
//  Created by Jeremy Cope on 5/15/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "DemoNC.h"
#import "DemoNC+Apps.h"
#import "HomeVC.h"
@interface DemoNC ()

@end

@implementation DemoNC

//Convenience
- (id)init{
    //Create the Demo Apps
    [self createDemoApps];
    //Create the Home View Controller
    HomeVC* homeVC = [[HomeVC alloc] initWithDemoNC:self
                                       demoAppArray:_demoAppArray];
    //Create and Setup the Navigation Bar
    return [self initWithRootViewController:homeVC];
}
-(id)initWithRootViewController:(UIViewController *)rootViewController{
    if (self = [super initWithRootViewController:rootViewController]){
        //Other Setup
        self.navigationBarHidden = YES;
    }
    return self;
}
@end
