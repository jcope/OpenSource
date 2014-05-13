//
//  DemoCell.h
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Event;
@interface DemoCell : UICollectionViewCell

+(NSString*)cellIdentifier;
-(void)setDemoData:(id)app;

@end
