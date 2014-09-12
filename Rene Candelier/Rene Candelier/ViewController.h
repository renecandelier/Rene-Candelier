//
//  ViewController.h
//  Rene Candelier
//
//  Created by Rene Candelier on 9/8/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *profilePicture;
@property (nonatomic) NSString * link;
- (IBAction)resumeButon:(id)sender;
- (IBAction)gitHubButton:(id)sender;
- (IBAction)contactButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *appScroll;
-(void)showModalViewController;
@end

