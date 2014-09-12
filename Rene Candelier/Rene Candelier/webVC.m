//
//  webVC.m
//  Rene Candelier
//
//  Created by Rene Candelier on 9/8/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "webVC.h"

@interface webVC ()<UIWebViewDelegate>

@end

@implementation webVC
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height



-(void)setLink:(NSString *)link{
    
    _link = link;
 
    
    
    
    UIButton * IMbutton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-50, 15, 40, 40)];
    
    UIImage *IMbuttonImage = [UIImage imageNamed:@"IM White.png"];
    [IMbutton setBackgroundImage:IMbuttonImage forState:UIControlStateNormal];
    //    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
    //     ];
    
    
    UIButton * backButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 30, 30)];
    
    UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    
    backButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
    
    [self.view addSubview:headerView];
    headerView.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];
    
    
    UILabel * letsPlayLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, 15, 200, headerView.frame.size.height/2)];
    [letsPlayLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
    
    letsPlayLable.textColor = [UIColor whiteColor];
    letsPlayLable.textAlignment = NSTextAlignmentCenter;
    letsPlayLable.text = @"Rene Candelier";
    
    [headerView addSubview:letsPlayLable];
    [headerView addSubview:backButton];
    
    [headerView addSubview:IMbutton];
    
    self.webView.delegate = self;
    
    if ([self.link isEqualToString:@"Rene"]) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Rene"ofType:@"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSData *pdfData = [[NSData alloc] initWithContentsOfURL:targetURL];
        [self.webView loadData:pdfData MIMEType:@"application/pdf" textEncodingName:@"UTF-8" baseURL:targetURL];
        
         [self.webView setScalesPageToFit:YES];
        
        
    }else{
        
        NSURL *url = [NSURL URLWithString:self.link];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObj];
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)backButtonClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
