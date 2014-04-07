//
//  SalonViewController.m
//  Conference
//
//  Created by ig_2014 on 03/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

//IMPORT
#import "SalonViewController.h"

//INTERFACE
@interface SalonViewController ()

@end

//IMPLEMENTATION
@implementation SalonViewController


//METHODS
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MAILS
- (IBAction)sendButton:(id)sender {
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:@"Polytech - Informations complémentaires suite à notre rencontre"];
    [mc setMessageBody:@"Bonjour,\n\nSuite à notre rencontre lors du salon <nomsalon> (le <datesalon>), nous vous communiquons une liste de documents pouvant vous être utile si vous souhaitez rejoindre l'école.\n\nMerci et à bientôt à Polytech.\n\n======DOCUMENTS======\nDocument 1\nDocument 2\n======================\n\n" isHTML:NO];
    
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // TODO: change NSLog to UIAlertView or exception
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
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
