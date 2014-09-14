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

//Link to load GITHUB
@property (nonatomic) NSString * link;

//Settings Up Buttons
- (IBAction)resumeButon:(id)sender;
- (IBAction)gitHubButton:(id)sender;
- (IBAction)contactButton:(id)sender;

//Scroll for the APPS
@property (weak, nonatomic) IBOutlet UIScrollView *appScroll;


//Segue for the Contact Button
-(void)showModalViewController;
@end

