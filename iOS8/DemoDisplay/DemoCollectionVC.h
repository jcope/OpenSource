//
//  DemoCollectionVC.h
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoCollectionVC : UICollectionViewController <UICollectionViewDelegate>

-(id)initWithDemoArray:(NSArray*)demoArray;
@end
