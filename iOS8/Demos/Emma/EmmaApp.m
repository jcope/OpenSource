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
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UILabel *legalLabel;
@property (strong, nonatomic) IBOutlet UIButton *gitButton;
@property (strong, nonatomic) IBOutlet UIImageView *logoImage;
@property (strong, nonatomic) IBOutlet UILabel *emmaLabel;

@end

@implementation EmmaApp
#pragma mark Initialization
- (id)init{
    if (self = [super init]) {
        //Initialization
        [[NSBundle mainBundle] loadNibNamed:@"Emma" owner:self options:nil];
        [self.view setBackgroundColor:[UIColor whiteColor]];
        //Add text labels
        [self setupAppInfo];
    }
    return self;
}
-(void)setupAppInfo{
    [_detailLabel setAlpha:0.1];
    [_legalLabel setAlpha:0.1];
    [_gitButton setAlpha:0.1];
    [_logoImage setAlpha:0.1];
    [_emmaLabel setAlpha:0.1];
}
#pragma mark View Life Cycle
-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:2.0 animations:^{
        [self.view setBackgroundColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.85]];
        [_detailLabel setAlpha:1.0];
        [_legalLabel setAlpha:1.0];
        [_gitButton setAlpha:1.0];
        [_logoImage setAlpha:1.0];
        [_emmaLabel setAlpha:1.0];
    }];
}
#pragma mark View Actions
- (IBAction)gitAction:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/jcope/OpenSource"]];
    
}
#pragma mark - DemoApp Delegates
-(NSString*)appName{
    return @"Emma";
}
-(NSString*)appDetail{
    return @"A software and technologies startup, we focus on delivering premium mobile solutions.";
}
-(UIImage*)appImage{
    return [UIImage imageNamed:@"Emma.png"];
}
-(UIViewController*)mainViewController{
    return self;
}
-(void)appWillClose{
    NSLog(@"Close app");
}

@end
