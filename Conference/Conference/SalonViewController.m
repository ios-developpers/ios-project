//
//  SalonViewController.m
//  Conference
//
//  Created by ig_2014 on 03/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

//IMPORT
#import "SalonViewController.h"
#import "PoolPopoverViewController.h"

//INTERFACE
@interface SalonViewController ()

@end

//IMPLEMENTATION
@implementation SalonViewController

@synthesize salon;

@synthesize tableViewPools;
@synthesize tableViewDocuments;

@synthesize poolView;
@synthesize poolPopover;

@synthesize buttonaddUnPool;
@synthesize buttonGoToEdit;
@synthesize buttonSendMail;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(forceReload:) name:@"SalonPoolNotification" object:nil];
}

-(void) forceReload:(NSNotification *)notification
{

    NSLog(@"is calling force reload");
    [tableViewPools reloadData];
    if (poolPopover != nil)
    {
        [poolPopover dismissPopoverAnimated:YES];
        poolPopover = nil;
    }
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
    
    NSString *nomSalon = salon.name;
    NSDate *dateSalon = salon.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MMM/yyyy"];
    NSString *stringFromDate = [dateFormatter stringFromDate:dateSalon];
    
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:@"Polytech - Informations complémentaires suite à notre rencontre"];
    NSString* body = [NSString stringWithFormat:@"Bonjour,\n\nSuite à notre rencontre lors du salon %@ (le %@), nous vous communiquons une liste de documents pouvant vous être utile si vous souhaitez rejoindre l'école.\n\nMerci et à bientôt à Polytech.\n\n======DOCUMENTS======\nDocument 1\nDocument 2\n======================\n\n", nomSalon, stringFromDate];
    [mc setMessageBody:body isHTML:NO];
    
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == buttonSendMail)
    {
        
    }
    else if (sender == buttonGoToEdit)
    {
        PoolViewController* segueController = [segue destinationViewController];
        NSIndexPath *selectedRowPath = [tableViewPools indexPathForSelectedRow];
        
        segueController.pool = [[[ListePool getInstance] getAllPoolsOf:salon] objectAtIndex:selectedRowPath.row];
    }
    else if (sender == buttonaddUnPool)
    {
        PoolPopoverViewController* segueController = [segue destinationViewController];
        segueController.parent = self;
        
        poolPopover=[(UIStoryboardPopoverSegue *)segue popoverController];
    }
    else
    {
        
    }
}

@end
