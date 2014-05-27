//
//  DemoCell.m
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "DemoCell.h"

@interface DemoCell ()
@property (strong) UIImageView* cellImage;
@property (strong) UILabel* cellTitle;
@property (strong) UILabel* cellDetail;
@end

@implementation DemoCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Layout the elements
        //Image
        _cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 90)];
        [self addSubview:_cellImage];
        
        //Title
        _cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(75, 2, 200, 30)];
        [_cellTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:25]];
        [_cellTitle setTextColor:[UIColor blackColor]];
        [self addSubview:_cellTitle];
        
        //Detail
        _cellDetail = [[UILabel alloc] initWithFrame:CGRectMake(75, 30, 200, 60)];
        [_cellDetail setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:15]];
        [_cellDetail setTextColor:[UIColor darkGrayColor]];
        [_cellDetail setNumberOfLines:3];
        [self addSubview:_cellDetail];
    }
    return self;
}

+(NSString*)cellIdentifier{
    return @"demoCell";
}

-(void)setDemoData:(id)app{
    //Apply Data to elements
    //App Image
    if ([app respondsToSelector:@selector(appImage)]) {
        [_cellImage setImage:[app appImage]];
    }
    //App Title
    if ([app respondsToSelector:@selector(appName)]) {
        [_cellTitle setText:[app appName]];
    }
    //App Detail
    if ([app respondsToSelector:@selector(appDetail)]) {
        [_cellDetail setText:[app appDetail]];
    }
}

@end
