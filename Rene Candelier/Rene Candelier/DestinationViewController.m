//
//  DestinationViewController.m
//  AFBlurSegue-Demo
//
//  Created by Alvaro Franco on 6/5/14.
//  Copyright (c) 2014 AlvaroFranco. All rights reserved.
//

#import "DestinationViewController.h"
#import <MessageUI/MessageUI.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface DestinationViewController ()<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@end

@implementation DestinationViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    [_closeButton addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchUpInside];
    
    UIView * contactView = [[UIView alloc]initWithFrame:CGRectMake(15, SCREEN_HEIGHT/2 -100, SCREEN_WIDTH-30, SCREEN_HEIGHT -350)];
    
    
    contactView.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];
    [[contactView layer] setShadowOpacity:0.0];
    [[contactView layer] setShadowRadius:0.0];
    [[contactView layer] setShadowColor:nil];
    
    contactView.layer.cornerRadius = 15;
    contactView.layer.masksToBounds = YES;
    
    [self.view addSubview:contactView];
    
    //--------------------
    
    UILabel * contactTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(contactView.bounds.size.width/2-100, 0, 200, 40)];
    
    [contactTitleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:40]];
    contactTitleLabel.textAlignment = NSTextAlignmentCenter;
    contactTitleLabel.text =[NSString stringWithFormat:@"Contact"];
    
    contactTitleLabel.textColor = [UIColor whiteColor];
    
    [contactView addSubview:contactTitleLabel];
    
    
    UIButton * callButton = [[UIButton alloc]initWithFrame:CGRectMake(contactView.bounds.size.width/2-20, contactView.bounds.size.height/2-20, 60, 60)];
    
    UIImage *callImage = [UIImage imageNamed:@"phone8.png"];
    [callButton setBackgroundImage:callImage forState:UIControlStateNormal];
    [callButton addTarget:self action:@selector(callPhone) forControlEvents:UIControlEventTouchUpInside
     ];
    [contactView addSubview:callButton];
    
    
    
    UIButton * emailButton = [[UIButton alloc]initWithFrame:CGRectMake(20, contactView.bounds.size.height/2-20, 70, 70)];
    
    UIImage *mailImage = [UIImage imageNamed:@"mail20.png"];
    [emailButton setBackgroundImage:mailImage forState:UIControlStateNormal];
        [emailButton addTarget:self action:@selector(mailButton) forControlEvents:UIControlEventTouchUpInside
         ];
    [contactView addSubview:emailButton];
    
    
    
    UIButton * textButton = [[UIButton alloc]initWithFrame:CGRectMake(contactView.bounds.size.width-80, contactView.bounds.size.height/2-20, 60, 60)];
    
    UIImage *textImage = [UIImage imageNamed:@"text.png"];
    [textButton setBackgroundImage:textImage forState:UIControlStateNormal];
        [textButton addTarget:self action:@selector(sendText) forControlEvents:UIControlEventTouchUpInside
         ];
    [contactView addSubview:textButton];
    
    
    
}

-(void) sendText{
    MFMessageComposeViewController *messageVC = [[MFMessageComposeViewController alloc] init];
    
    messageVC.body = @"Hello Rene Candelier. ";
    messageVC.recipients = @[@"4044800440"];
    messageVC.messageComposeDelegate = self;
    
    [self presentViewController:messageVC animated:NO completion:NULL];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


//Delete?
- (void)showSMS:(NSString*)file {
    
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    NSArray *recipents = @[@"12345678", @"72345524"];
    NSString *message = [NSString stringWithFormat:@"Just sent the %@ file to your email. Please check!", file];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)mailButton {
    // Email Subject
    NSString *emailTitle = @"Contact - Rene Candelier";
    // Email Content
    NSString *messageBody = @"";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"ReneCandelier@GMail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void)callPhone {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"404-480-0440" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Call", nil];
    [alert setTag:02];
    [alert show];
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag == 02 && buttonIndex != alertView.cancelButtonIndex) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://4044800440"]];
    }
}

-(void)closeModal {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
