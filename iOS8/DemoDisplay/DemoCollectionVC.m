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
@property (strong) id currentApp;
@property (strong) UIButton* closeButton;
@property (strong) UIViewController* homeVC;
@property (strong) NSArray* demoArray;
@end

@implementation DemoCollectionVC

-(id)initWithHomeVC:(UIViewController*)homeVC demoArray:(NSArray*)demoArray{
    //Store the data
    _homeVC = homeVC;
    _demoArray = demoArray;
    [self createCloseButton];
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
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //Grab the demo at index
    
    id demoApp = _demoArray[indexPath.row];
    if ([demoApp respondsToSelector:@selector(launchAppFromViewController:)]) {
        //Launch Demo App
        _currentApp = demoApp;
        [_currentApp launchAppFromViewController:_homeVC];
        //Overlay a close button
        [_homeVC.view addSubview:_closeButton];
    }
}
-(void)createCloseButton{
    CGFloat buttonWidth = 50;
    _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [_closeButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17]];
    [_closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_closeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [_closeButton setFrame:CGRectMake(SCREEN_WIDTH-buttonWidth-10,25,buttonWidth,30)];
    [_closeButton setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.75]];
    [_closeButton.layer setCornerRadius:10];
    [_closeButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)closeAction{
    if ([_currentApp respondsToSelector:@selector(closeApp)]) {
        [_currentApp closeApp];
    }
    //Fade out Close Button
    [_closeButton removeFromSuperview];
}
@end
