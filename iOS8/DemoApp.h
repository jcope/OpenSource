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
//Demo Collection View Cell Information
-(NSString*)appName;
-(NSString*)appDetail;
-(UIImage*)appImage;
//The View Controller which will be pushed via the NavigationController to start the demo
-(UIViewController*)mainViewController;
@optional
-(void)appWillClose;
@end
