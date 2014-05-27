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
-(NSString*)appName; //Display Name
-(NSString*)appDetail; //Short description of what the demo does
-(UIImage*)appImage; //Provide screenshot. Portrait.
//The View Controller that will be pushed via the NavigationController to start the demo
-(UIViewController*)mainViewController;
@optional
//Method will be called when the user pops your main view controller
//Release any resources and clean up your memory
-(void)appWillClose;
@end
