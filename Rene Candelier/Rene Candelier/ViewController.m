//
//  ViewController.m
//  Rene Candelier
//
//  Created by Rene Candelier on 9/8/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "ViewController.h"
#import "AFBlurSegue.h"
#import "AFBlurSegue.h"
#import "webVC.h"


@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *actAp;
@property (weak, nonatomic) IBOutlet UIButton *usaApp;
@property (weak, nonatomic) IBOutlet UIButton *flightApp;
@property (weak, nonatomic) IBOutlet UIButton *cfaApp;
@property (weak, nonatomic) IBOutlet UIButton *churchApp;

@end
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation ViewController
-(void)showModalViewController {
    
    [self performSegueWithIdentifier: @"blurSegue" sender:self];

}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(50, 350, 250, 200)];
    view.backgroundColor = [UIColor blackColor];
   // [self.view addSubview:view];
    [UIView animateWithDuration:2.0f animations:^{
        CGRect theFrame = view.frame;
        theFrame.size.height += 10.f;
        view.frame = theFrame;
    }];
    
    //self.appScroll.bounds.size.height = 1;
    [self.appScroll setScrollEnabled:YES];
    [self.appScroll setDelegate:self];
    self.appScroll.backgroundColor = [UIColor clearColor];
    self.appScroll.contentMode = UIViewContentModeScaleToFill;
    [self.appScroll setContentSize:CGSizeMake(self.appScroll.bounds.size.width+350,143.0)];
    self.appScroll.backgroundColor = [UIColor lightGrayColor];

    
    
    
    self.profilePicture.layer.cornerRadius = 50;
    self.profilePicture.clipsToBounds = YES;
    self.profilePicture.layer.borderWidth = 1.0;
    self.profilePicture.layer.borderColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f].CGColor;
    
    self.actAp.layer.cornerRadius = 15;
    self.actAp.clipsToBounds = YES;
    
    self.usaApp.layer.cornerRadius = 15;
    self.usaApp.clipsToBounds = YES;
    
    
    self.flightApp.layer.cornerRadius = 15;
    self.flightApp.clipsToBounds = YES;
    
    self.cfaApp.layer.cornerRadius = 15;
    self.cfaApp.clipsToBounds = YES;
    
    self.churchApp.layer.cornerRadius = 15;
    self.churchApp.clipsToBounds = YES;
    
    
    UIButton * IMbutton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-50, 15, 40, 40)];
    
    UIImage *backButtonImage = [UIImage imageNamed:@"IM White.png"];
    [IMbutton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [IMbutton addTarget:self action:@selector(showModalViewController) forControlEvents:UIControlEventTouchUpInside
     ];
    
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
    
    [self.view addSubview:headerView];
    headerView.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];
    
    
    UILabel * letsPlayLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, 15, 200, headerView.frame.size.height/2)];
    [letsPlayLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
    
    letsPlayLable.textColor = [UIColor whiteColor];
    letsPlayLable.textAlignment = NSTextAlignmentCenter;
    letsPlayLable.text = @"Rene Candelier";
    
    [headerView addSubview:letsPlayLable];
    [self.view addSubview:IMbutton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *destination = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"web"])
    {
        webVC *webController = segue.destinationViewController;
        webController.link = self.link;
        
    }else  if ([segue.identifier isEqualToString:@"blurSegue"]){
        
        destination.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        
        AFBlurSegue *blurSegue = (AFBlurSegue *)segue;
        
        blurSegue.blurRadius = 10;
        blurSegue.tintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
        blurSegue.saturationDeltaFactor = 0.5;
    }
    
    
}

- (IBAction)resumeButon:(id)sender {
    
    self.link = @"Rene";
    
    [self performSegueWithIdentifier:@"web" sender:self];
}

- (IBAction)gitHubButton:(id)sender {
    self.link = @"https://github.com/renecandelier";
    
    [self performSegueWithIdentifier:@"web" sender:self];
}

- (IBAction)contactButton:(id)sender {
    
    [self showModalViewController];
}


@end
