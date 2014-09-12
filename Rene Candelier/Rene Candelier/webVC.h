//
//  webVC.h
//  Rene Candelier
//
//  Created by Rene Candelier on 9/8/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webVC : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) NSString * link;

@end
