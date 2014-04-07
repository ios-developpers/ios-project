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

@synthesize salon;
@synthesize addPool;

@synthesize tableViewPools;
@synthesize tableViewDocuments;

@synthesize poolView;
@synthesize poolPopover;

//METHODS
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    self->salon = [[ListeSalon getInstance].listSalon objectAtIndex:[[ListeSalon getInstance] getSelectedSalon]];
    [tableViewPools reloadData];
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

-(IBAction)addPoolListener:(id)sender
{
    NSLog(@"%@", [Utils concatenateString:LogListener withString:@" Add Pool Listener"]);
    if (poolView == nil) {
        //Create the ColorPickerViewController.
        poolView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PoolPopoverID"];
        // docView.delegate=self;
    }
    
    if (poolPopover == nil | ![poolPopover isPopoverVisible]) {
        //The color picker popover is not showing. Show it.
        poolPopover = [[UIPopoverController alloc] initWithContentViewController:poolView];
        [poolPopover presentPopoverFromBarButtonItem:(UIBarButtonItem *)sender
                             permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        
    } else {
        //The color picker popover is showing. Hide it.
        [poolPopover dismissPopoverAnimated:YES];
        poolPopover = nil;
    }
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == tableViewPools)
        return [[[ListePool getInstance] getAllPoolsOf:salon ] count];
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == tableViewPools)
    {
        static NSString *MyIdentifier = @"CellPool";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        cell.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
        }
        
        Pool* pool = [[[ListePool getInstance] getAllPoolsOf:salon] objectAtIndex:[indexPath row]];
        
        cell.textLabel.text = pool.name;
        
        return cell;
    }
    else
        return nil;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //[[ListeSalon getInstance] removeSalonAtIndex:indexPath.row];
    }
}

@end
