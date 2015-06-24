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
#import "HomeVC.h"

@interface DemoCollectionVC ()
@property (strong) id currentApp;
@property (strong) UINavigationController* demoNC;
@property (strong) NSArray* demoArray;
@end

@implementation DemoCollectionVC

-(id)initWithDemoNC:(UINavigationController*)demoNC demoArray:(NSArray*)demoArray{
    //Store the data
    _demoNC = demoNC;
    _demoNC.delegate = self;
    _demoArray = demoArray;
    DemoCollectionLayout* layout = [[DemoCollectionLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

-(id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithCollectionViewLayout:layout]) {
        //Set up the frame
        CGFloat xInit = 20;
        CGFloat yInit = 90; //35
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
        [self.collectionView setContentInset:UIEdgeInsetsMake(100,0,5,0)];
        [self.collectionView setDataSource: self];
    }
    return self;
}


#pragma mark - Collection View Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
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

    [cell setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.85]];
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
    
    return CGSizeMake(cellWidth, 110);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //Grab the demo at index
    id demoApp = _demoArray[indexPath.row];
    if ([demoApp respondsToSelector:@selector(mainViewController)]) {
        
        _currentApp = demoApp;
        [_demoNC pushViewController:[_currentApp mainViewController] animated:YES];
        [_demoNC setNavigationBarHidden:NO animated:YES];
    }
}
#pragma mark - NavigationController Delegate
//This delegate method should be moved to a more appropriate class
//Will remain here for now because we need access to the currentApp object
- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated{
    //If we will show the HomeVC, then we will signal to the current app
    //If it respondes tot he appWillClose selector
    if ([viewController isKindOfClass:[HomeVC class]]) {
        if ([_currentApp respondsToSelector:@selector(appWillClose)]) {
            [_currentApp appWillClose];
        }
    }
}
@end
