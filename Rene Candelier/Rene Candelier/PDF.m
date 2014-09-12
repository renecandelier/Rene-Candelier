//
//  PDF.m
//  Rene Candelier
//
//  Created by Rene Candelier on 9/9/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "PDF.h"

@interface PDF ()<UIWebViewDelegate>

@end

@implementation PDF

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView.delegate = self;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Rene"ofType:@"pdf"];

    NSURL *targetURL = [NSURL fileURLWithPath:path]; // <pdfFilePath> if full path of your pdf file
    NSData *pdfData = [[NSData alloc] initWithContentsOfURL:targetURL];
    [self.webView loadData:pdfData MIMEType:@"application/pdf" textEncodingName:@"utf-8" baseURL:nil];
    
    
    
//    NSString *urlAddress = [[NSBundle mainBundle] pathForResource:@"Rene" ofType:@"pdf"];
//    
//    NSURL *url = [NSURL fileURLWithPath:urlAddress];
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
