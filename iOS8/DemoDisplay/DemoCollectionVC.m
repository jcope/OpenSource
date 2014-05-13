//
//  DemoCollectionVC.m
//  iOS8
//
//  Created by Jeremy Cope on 4/15/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "DemoCollectionVC.h"
#import "DemoCollectionLayout.h"
#import "DemoCell.h"

@interface DemoCollectionVC ()
@property (strong) NSArray* demoArray;
@end

@implementation DemoCollectionVC

-(id)initWithDemoArray:(NSArray*)demoArray{
    //Store the data
    _demoArray = demoArray;
    DemoCollectionLayout* layout = [[DemoCollectionLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

-(id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithCollectionViewLayout:layout]) {
        //Set up the frame
        CGFloat xInit = 20;
        CGFloat yInit = 80; //35
        CGFloat yBottomBuffer = 60;
        if (IS_IPAD) {
            xInit = 40;
        }
        CGFloat width = SCREEN_WIDTH-(2*xInit);
        CGFloat hieght = SCREEN_HEIGHT-(yInit+yBottomBuffer);
        [self.view setFrame:CGRectMake(xInit, yInit, width, hieght)];
        
        //Register the Cells
        [self.collectionView registerClass:[DemoCell class] forCellWithReuseIdentifier:[DemoCell cellIdentifier]];
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        [self.collectionView setContentInset:UIEdgeInsetsMake(110,0,5,0)];
        [self.collectionView setDataSource: self];
    }
    return self;
}


#pragma mark - Collection View Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"Here: %d",[_demoArray count]);
    return [_demoArray count];
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //Grab the demo at index
    id demoApp = _demoArray[indexPath.row];
    
    DemoCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:[DemoCell cellIdentifier]
                                                              forIndexPath:indexPath];
    //Apply the message data
    [cell setDemoData:demoApp];

    [cell setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.75]];
    [cell.layer setCornerRadius:10];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat xInit = 20;
    if (IS_IPAD) {
        xInit = 40;
    }
    CGFloat cellWidth = SCREEN_WIDTH-(2*xInit);
    
    return CGSizeMake(cellWidth, 75);
}
@end
