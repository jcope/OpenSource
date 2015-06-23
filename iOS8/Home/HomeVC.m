//
//  HomeVC.m
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "HomeVC.h"
#import "BackgroundVC.h"
#import "DemoCollectionVC.h"
#import "ETiAd.h"


@interface HomeVC ()
//Data
@property UINavigationController* demoNC;
@property ETiAd* iAd;
//View
@property UILabel* appTitle;
@property UILabel* appDetailTitle;
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
        
        //Add the app+detail title
        [self addAppTitle];
        [self addAppDetail];
        
        //Create the Demo CollectionView
        _demoCollection = [[DemoCollectionVC alloc] initWithDemoNC:nav
                                                         demoArray:appArray];
        [_demoCollection.view setAlpha:0.0];
        [self.view addSubview:_demoCollection.view];
        

    }
    return self;
}
-(void)addAppTitle{
    _appTitle = [[UILabel alloc] init];
    CGFloat labelWidth = 225;
    [_appTitle setFrame:CGRectMake((SCREEN_WIDTH-labelWidth)/2, 20, labelWidth, 75)];
    //Create the attributed string so we can uttilze multiple fonts on seperate lines
    NSMutableAttributedString* firstLine = [[NSMutableAttributedString alloc] initWithString:@"iNTERACTIVE\n"
                                                                                  attributes:@{NSFontAttributeName:
                                                                                                   [UIFont fontWithName:@"HelveticaNeue"
                                                                                                                   size:32],
                                                                                               NSForegroundColorAttributeName:
                                                                                                   [UIColor whiteColor]}];
    NSAttributedString* secondLine = [[NSAttributedString alloc] initWithString:@"oPEN sOURCE"
                                                                      attributes:@{NSFontAttributeName:
                                                                                       [UIFont fontWithName:@"FacebookLetterFaces"
                                                                                                       size:20],
                                                                                   NSForegroundColorAttributeName:
                                                                                       [UIColor whiteColor]}];
    [firstLine appendAttributedString:secondLine];
    [_appTitle setAttributedText:firstLine];
    
    [_appTitle setTextAlignment:NSTextAlignmentCenter];
    [_appTitle setNumberOfLines:2];
    _appTitle.alpha = 0.0;
    [self.view addSubview:_appTitle];
}
-(void)addAppDetail{
    _appDetailTitle = [[UILabel alloc] init];
    CGFloat labelWidth = 275;
    [_appDetailTitle setFrame:CGRectMake((SCREEN_WIDTH-labelWidth)/2, 110, labelWidth, 50)];
    [_appDetailTitle setText:@"A launch pad for developers to test and promote new features."];
    [_appDetailTitle setFont:[UIFont fontWithName:@"HelveticaNeue" size:17]];
    [_appDetailTitle setTextColor:[UIColor whiteColor]];
    [_appDetailTitle setTextAlignment:NSTextAlignmentCenter];
    [_appDetailTitle setNumberOfLines:2];
    _appDetailTitle.alpha = 0.0;
    [self.view addSubview:_appDetailTitle];
}
#pragma mark - View Delegates
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
        [_appTitle setAlpha:1.0];
        [_appDetailTitle setAlpha:1.0];
        [_demoCollection.view setAlpha:1.0];
    } completion:^(BOOL finished) {
        //Start the Backgound Transitions
        [_backgroundVC start];
        //Add the Ads (Sorry, Gotta Get Paid!)
        //_iAd = [[ETiAd alloc] initWithDisplayView:_backgroundVC.view];
        
    }];
}
@end

