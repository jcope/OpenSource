//
//  BackgroundVC.m
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "BackgroundVC.h"

@interface BackgroundVC ()
@property BOOL activeBackground;
@property UIImageView* background;
@property NSArray* imageArray;
@property NSInteger imageIndex;
@end

@implementation BackgroundVC

- (id)init{
    if (self = [super init]) {
        _background = [[UIImageView alloc] initWithFrame:self.view.frame];
        [_background setImage:[UIImage imageNamed:@"Background.png"]];
        self.view = _background;
        
        _imageIndex = 0;
        _activeBackground = NO;
        _imageArray = @[[UIImage imageNamed:@"Background1.png"],
                        [UIImage imageNamed:@"Background2.png"],
                        [UIImage imageNamed:@"Background3.png"],
                        [UIImage imageNamed:@"Background4.png"],
                        [UIImage imageNamed:@"Background5.png"]];
    }
    return self;
}
//Fade in the background
-(void)setupWithCompletion:(void (^)(void))completion{
    [UIView transitionWithView:self.view
                      duration:3.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _background.image = [UIImage imageNamed:@"Background1.png"];
                    } completion:^(BOOL finished) {
                        completion();
                    }];
    
}
-(void)start{
    _activeBackground = YES;
    //Start Timer
    [self dissolveBackground];
}
-(void)stop{
    _activeBackground = NO;
}
-(void)dissolveBackground{
    //NSLog(@"Transistion background...");
    [UIView transitionWithView:self.view
                      duration:1.75f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _background.image = _imageArray[(_imageIndex++)%[_imageArray count]];
                    } completion:^(BOOL finished) {
                        if(_activeBackground){
                            [self dissolveBackground];
                        }
                    }];
    
}
@end