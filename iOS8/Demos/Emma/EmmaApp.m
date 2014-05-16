//
//  EmmaApp.m
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "EmmaApp.h"

@interface EmmaApp ()
@property UIViewController* homeVC;
@end

@implementation EmmaApp

- (id)init{
    if (self = [super init]) {
        [self.view setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.45]];
    }
    return self;
}
#pragma mark - DemoApp Delegates
-(NSString*)appName{
    return @"Emma Tech";
}
-(NSString*)appDetail{
    return @"A sample application demo.";
}
-(UIImage*)appImage{
    return [UIImage imageNamed:@"Emma.png"];
}
-(UIViewController*)mainViewController{
    return self;
}

@end
