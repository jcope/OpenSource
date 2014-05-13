//
//  DemoApp.h
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DemoApp <NSObject>
@required
-(NSString*)appName;
-(NSString*)appDetail;
-(UIImage*)appImage;
-(BOOL)launchAppFromViewController:(UIViewController*)viewController;
@end
