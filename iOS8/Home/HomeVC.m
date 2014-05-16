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


@interface HomeVC ()
//Data
@property UINavigationController* demoNC;
//View
@property BackgroundVC* backgroundVC;
@property DemoCollectionVC* demoCollection;
@end

@implementation HomeVC

#pragma mark Init
- (id)initWithDemoNC:(UINavigationController*)nav
        demoAppArray:(NSArray *)appArray{
    if (self = [super init]) {
        //Store the DemoNavController
        _demoNC = nav;
        
        //Create the background annimation view
        _backgroundVC = [[BackgroundVC alloc] init];
        [self.view addSubview:_backgroundVC.view];
        
        //Create the Demo CollectionView
        _demoCollection = [[DemoCollectionVC alloc] initWithDemoNC:nav
                                                         demoArray:appArray];
        [_demoCollection.view setAlpha:0.0];
        [self.view addSubview:_demoCollection.view];
    }
    return self;
}
#pragma mark View Delegates
-(void)viewDidLoad{
    //Start the Background
    [_backgroundVC setupWithCompletion:^void{[self homeStart];}];
}
-(void)viewDidAppear:(BOOL)animated{
    //Hide the Navigation Contoller on this view
    [_demoNC setNavigationBarHidden:YES animated:YES];
}
#pragma mark - Home Annimation
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
