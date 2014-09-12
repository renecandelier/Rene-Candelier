//
//  DestinationViewController.m
//  AFBlurSegue-Demo
//
//  Created by Alvaro Franco on 6/5/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import "DestinationViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface DestinationViewController ()

@end

@implementation DestinationViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    [_closeButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchUpInside];
    
    UIView * scoreView = [[UIView alloc]initWithFrame:CGRectMake(15, 130, SCREEN_WIDTH-30, SCREEN_HEIGHT -260)];
    
    
    scoreView.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];
    [[scoreView layer] setShadowOpacity:0.0];
    [[scoreView layer] setShadowRadius:0.0];
    [[scoreView layer] setShadowColor:nil];
    
    scoreView.layer.cornerRadius = 15;
    scoreView.layer.masksToBounds = YES;
    
    [self.view addSubview:scoreView];
    
    //--------------------
    
    UILabel * contactTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreView.bounds.size.width/2-100, 5, 200, 100)];
    
    [contactTitleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:40]];
    contactTitleLabel.textAlignment = NSTextAlignmentCenter;
    contactTitleLabel.text =[NSString stringWithFormat:@"Contact"];
    
    contactTitleLabel.textColor = [UIColor whiteColor];
    
    [scoreView addSubview:contactTitleLabel];

}

-(void)closeModal {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
