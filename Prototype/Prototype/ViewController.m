//
//  ViewController.m
//  Prototype
//
//  Created by Mecca Shabazz on 9/28/16.
//  Copyright © 2016 SeanCampBell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendNotification:(id)sender {
    NSLog(@"sendNotification button action1");
    
    // From within your active view controller
    //if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        
        [mailCont setSubject:@"Notification From Prototype!"];
        [mailCont setToRecipients:[NSArray arrayWithObject:@"meccas559@gmail.com"]];
        [mailCont setMessageBody:@"Don't ever want to give you up" isHTML:NO];
        
        [self presentModalViewController:mailCont animated:YES];
        //[mailCont release];
    //}
    //else{
        //NSLog(@"Email Connection Failed!");
    //}
}

// Then implement the delegate method
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    NSLog(@"sendNotification button action2");
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
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
