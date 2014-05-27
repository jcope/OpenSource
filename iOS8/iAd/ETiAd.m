//
//  ETiAd.m
//  Power Playlist
//
//  Created by Jeremy Cope on 5/8/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "ETiAd.h"

@interface ETiAd ()
@property UIView* displayView;
@property CGFloat iAdHeight;
@end

@implementation ETiAd

#define IAD_LOG_DEBUG 0
#define IAD_VIEW_TRANSITION_DURATION 0.7

-(id)initWithDisplayView:(UIView*)view{
    if (self = [super init]) {
        _displayView = view;
        //iAd
        _iAdVisible = NO;
        _iAdHeight = 50;
        
        NSLog(@"Register for iAd");
        //Default to the bottom of a portrait view
        _adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - _iAdHeight, SCREEN_WIDTH, _iAdHeight)];
        _adView.frame = [self offScreenFrame];
        _adView.delegate = self;
        
        [_displayView addSubview:_adView];
    }
    return self;
}
//*****************PRIVATE*****************//
#pragma mark - iAd Delegation
- (void)bannerViewDidLoadAd:(ADBannerView *)banner{
    if(IAD_LOG_DEBUG) NSLog(@"iAd Success");
    //Only presents if not present already. Signals to move other elements as well.
    [self showAdBanner:NO];
    
}
// This method will be invoked when an error has occurred attempting to get advertisement content.
// The ADError enum lists the possible error codes.
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    if(IAD_LOG_DEBUG) NSLog(@"iAd Banner Failed: %@",error);
    //Only hides if present.
    [self hideAdBanner];
}
#pragma mark - iAd Banner Movement
-(CGRect)onScreenFrame{
    return CGRectMake(0, SCREEN_HEIGHT - _iAdHeight, SCREEN_WIDTH, _iAdHeight);
}
-(CGRect)offScreenFrame{
    return CGRectOffset([self onScreenFrame], 0, _iAdHeight);
}
-(void)showAdBanner:(BOOL)force{
    //Show only if it wasn't visible
    if (!_iAdVisible || force){
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        [UIView setAnimationDuration:IAD_VIEW_TRANSITION_DURATION];
        _adView.frame = [self onScreenFrame];
        if(IAD_LOG_DEBUG) NSLog(@"Setting Frame: %@",NSStringFromCGRect(_adView.frame));
        //Commit actions
        [UIView commitAnimations];
        _iAdVisible = YES;
    }
}
-(void)hideAdBanner{
    //Hide only if it was visisble
    if (_iAdVisible) {
        if(IAD_LOG_DEBUG) NSLog(@"hide banner");
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        [UIView setAnimationDuration:IAD_VIEW_TRANSITION_DURATION];
        _adView.frame = [self offScreenFrame];
        //Commit actions
        [UIView commitAnimations];
        _iAdVisible = NO;
    }
}
@end
