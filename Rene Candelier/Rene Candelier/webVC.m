//
//  webVC.m
//  Rene Candelier
//
//  Created by Rene Candelier on 9/8/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "webVC.h"
#import "AFBlurSegue.h"
#import "AFBlurSegue.h"

@interface webVC ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *sendResumeButton;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;



@end

@implementation webVC{
    UIActivityIndicatorView*activityind;

}
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [activityind startAnimating];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [activityind stopAnimating];
}
-(void)showModalViewController {
    
    [self performSegueWithIdentifier: @"contact" sender:self];
    
}

-(void)sendResume {
    
    [self performSegueWithIdentifier: @"sendResume" sender:self];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *destination = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"contact"]||[segue.identifier isEqualToString:@"sendResume"]){
        
        destination.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        
        AFBlurSegue *blurSegue = (AFBlurSegue *)segue;
        
        blurSegue.blurRadius = 10;
        blurSegue.tintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
        blurSegue.saturationDeltaFactor = 0.5;
    }
    
    
}

-(void)setLink:(NSString *)link{
    
    _link = link;
 
    
    activityind=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityind.center = CGPointMake(30, SCREEN_HEIGHT-30);
    
    
    [activityind startAnimating];
    

    
    
    
    UIButton * IMbutton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-50, 15, 40, 40)];
    
    UIImage *IMbuttonImage = [UIImage imageNamed:@"IM White.png"];
    [IMbutton setBackgroundImage:IMbuttonImage forState:UIControlStateNormal];
    [IMbutton addTarget:self action:@selector(showModalViewController) forControlEvents:UIControlEventTouchUpInside
     ];
    
    
    UIButton * backButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 30, 30)];
    
    UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
    
    [self.view addSubview:headerView];
    headerView.backgroundColor = [UIColor colorWithRed:0.302f green:0.600f blue:0.863f alpha:1.0f];
    
    
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
        
        
        self.sendResumeButton.hidden = NO;
        self.refreshButton.hidden = YES;

        
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Candelier"ofType:@"pdf"];
        NSLog(@"%@",path);
        if (path) {
            NSURL *targetURL = [NSURL fileURLWithPath:path];
            NSData *pdfData = [[NSData alloc] initWithContentsOfURL:targetURL];
            [self.webView loadData:pdfData MIMEType:@"application/pdf" textEncodingName:@"UTF-8" baseURL:targetURL];
            
            [self.webView setScalesPageToFit:YES];
        }
       
    
//        NSString *urlAddress = [[NSBundle mainBundle] pathForResource:@"bless" ofType:@"pdf"];
//        
//        NSLog(@"%@",urlAddress);
//        
//        if (urlAddress) {
//        NSURL *url = [NSURL fileURLWithPath:urlAddress];
//        
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//        
//    
//        [self.webView loadRequest:requestObj];
//        }

        
        
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//                                                             
//                                                             NSUserDomainMask, YES);
//        
//        NSString *documentsDirectory = [paths objectAtIndex:0];
//        
//        NSString *filePath = [documentsDirectory stringByAppendingPathExtension:@"Candelier.pdf"];
//        
//        NSURL *url = [NSURL fileURLWithPath:filePath];
//        
//        NSString *urlString = [url absoluteString];
//        
//        NSString *encodedString=[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        
//        NSURL *webURL = [NSURL URLWithString:encodedString];
//        
//        NSURLRequest *request = [NSURLRequest requestWithURL:webURL];
//        
//        [self.webView loadRequest:request];
        
        
    }else{
        
    
        self.sendResumeButton.hidden = YES;
        self.refreshButton.hidden = NO;

        NSURL *url = [NSURL URLWithString:self.link];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObj];
        
    }
    activityind.color = [UIColor colorWithRed:0.173f green:0.827f blue:0.718f alpha:1.0f];
    [self.view addSubview:activityind];

}


-(void)backButtonClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)sendResumeButton:(id)sender {
    [self sendResume];

}
@end
