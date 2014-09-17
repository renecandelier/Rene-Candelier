//
//  ResumePopUp.m
//  Rene Candelier
//
//  Created by Rene Candelier on 9/14/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "ResumePopUp.h"
#import <MessageUI/MessageUI.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ResumePopUp ()<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@end

@implementation ResumePopUp

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
    
    UILabel * contactTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(contactView.bounds.size.width/2-150, 2, 300, 50)];
    
    [contactTitleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:40]];
    contactTitleLabel.textAlignment = NSTextAlignmentCenter;
    contactTitleLabel.text =[NSString stringWithFormat:@"Send Resume"];
    
    contactTitleLabel.textColor = [UIColor whiteColor];
    
    [contactView addSubview:contactTitleLabel];
    
    
    
    UIButton * emailButton = [[UIButton alloc]initWithFrame:CGRectMake(40, contactView.bounds.size.height/2-20, 70, 70)];
    
    UIImage *mailImage = [UIImage imageNamed:@"mail20.png"];
    [emailButton setBackgroundImage:mailImage forState:UIControlStateNormal];
    [emailButton addTarget:self action:@selector(mailButton) forControlEvents:UIControlEventTouchUpInside
     ];
    [contactView addSubview:emailButton];
    
    
    
    UIButton * textButton = [[UIButton alloc]initWithFrame:CGRectMake(contactView.bounds.size.width-100, contactView.bounds.size.height/2-20, 60, 60)];
    
    UIImage *textImage = [UIImage imageNamed:@"text.png"];
    [textButton setBackgroundImage:textImage forState:UIControlStateNormal];
    [textButton addTarget:self action:@selector(sendText) forControlEvents:UIControlEventTouchUpInside
     ];
    [contactView addSubview:textButton];
    
    
    
}

-(void) sendText{
    MFMessageComposeViewController *messageVC = [[MFMessageComposeViewController alloc] init];
    
    messageVC.body = @"Rene Candelier's Resume: https://www.dropbox.com/s/zotjzdm1d28jda2/Rene%20Candelier%20-%20iOS%20Resume.pdf?dl=0 ";
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
//    // Email Subject
//    NSString *emailTitle = @"Rene Candelier's Resume";
//    // Email Content
//    NSString *messageBody = @"https://www.dropbox.com/s/zotjzdm1d28jda2/Rene%20Candelier%20-%20iOS%20Resume.pdf?dl=0";
//    // To address
//    NSArray *toRecipents = [NSArray arrayWithObject:@""];
//    
//    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
//    mc.mailComposeDelegate = self;
//    [mc setSubject:emailTitle];
//    [mc setMessageBody:messageBody isHTML:NO];
//    [mc setToRecipients:toRecipents];
//    
//    // Present mail view controller on screen
//    [self presentViewController:mc animated:YES completion:NULL];
    
    
    
    
    if([MFMailComposeViewController canSendMail]){
        
        MFMailComposeViewController *mail=[[MFMailComposeViewController alloc]init];
        mail.mailComposeDelegate=self;
        [mail setSubject:@"Rene Candelier's Resume"];
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"Candelier" ofType:@"pdf"];
        
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSData * pdfDocumet =[NSData dataWithContentsOfURL:targetURL];
        
        
        [mail addAttachmentData:pdfDocumet mimeType:@"Candelier/pdf" fileName:@"Rene Candelier - iOS Resume.pdf"];
        [mail setMessageBody:@"" isHTML:NO];
        [self presentViewController:mail animated:YES completion:nil];
    }
    else
    {
        //NSLog(@"Message cannot be sent");
    }
    
    
}

-(void)closeModal {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
