//
//  ETiAd.h
//
//  Created by Jeremy Cope on 5/8/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iAd/iAd.h>


@interface ETiAd : NSObject <ADBannerViewDelegate>

-(id)initWithDisplayView:(UIView*)view;

@property (strong) ADBannerView *adView;
@property BOOL iAdVisible; //Track if it is currently visible
@end

