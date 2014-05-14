//
//  HomeVC.m
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "HomeVC.h"
#import "DemoCollectionVC.h"
#import "BackgroundVC.h"
//Import your Demo
#import "EmmaApp.h"
#import "DemoRESideMenu.h"

@interface HomeVC ()
//Data
@property NSMutableArray* demoArray;
//View
@property BackgroundVC* backgroundVC;
@property DemoCollectionVC* demoCollection;

@end

@implementation HomeVC

- (id)init{
    if (self = [super init]) {
        _demoArray = [NSMutableArray arrayWithCapacity:20];
        _backgroundVC = [[BackgroundVC alloc] init];
        [self.view addSubview:_backgroundVC.view];
        
        //Initialize and Add Demo App Here
        [_demoArray addObject:[[EmmaApp alloc] init]];
        [_demoArray addObject:[[DemoRESideMenu alloc] init]];
        [_demoArray addObject:[[EmmaApp alloc] init]];
        [_demoArray addObject:[[EmmaApp alloc] init]];
        [_demoArray addObject:[[EmmaApp alloc] init]];
        [_demoArray addObject:[[EmmaApp alloc] init]];
        [_demoArray addObject:[[EmmaApp alloc] init]];
        
        //Create the Demo Collection
        _demoCollection = [[DemoCollectionVC alloc] initWithHomeVC:self
                                                         demoArray:_demoArray];
        [_demoCollection.view setAlpha:0.0];
        [self.view addSubview:_demoCollection.view];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"Load view into memory..");
    //Setup the Background
    [_backgroundVC setupWithCompletion:^void{[self homeStart];}];
}
-(void)homeStart{
    //Fade in Collection View
    [UIView animateWithDuration:1.0 animations:^{
        [_demoCollection.view setAlpha:1.0];
    } completion:^(BOOL finished) {
        //Start the Backgound Transitions
        [_backgroundVC start];
    }];
}
@end
