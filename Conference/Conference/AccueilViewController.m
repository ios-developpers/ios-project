//
//  MyViewController.m
//  Conference
//
//  Created by ig_2014 on 04/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "AccueilViewController.h"

@implementation AccueilViewController

@synthesize tableViewSalon;
@synthesize docView;
@synthesize docPopover;
@synthesize salonView;
@synthesize salonPopover;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
    }
    return self;
}


- (void)viewDidLoad
{    
    [super viewDidLoad];
    NSLog(@"%@", [Utils concatenateString:LogLoaded withString:@" Accueil View Controller"]);
    
    //self->isPopoverSalonOpened = NO;
}

-(void) forceReload
{
    [tableViewSalon reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addDocumentListener:(UIBarButtonItem *)sender
{
    NSLog(@"%@", [Utils concatenateString:LogListener withString:@" Add Document Listener"]);
    if (docView == nil) {
        //Create the ColorPickerViewController.
        docView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DocumentPopoverID"];
       // docView.delegate=self;
    }
    
    if (docPopover == nil) {
        //The color picker popover is not showing. Show it.
        docPopover = [[UIPopoverController alloc] initWithContentViewController:docView];
        [docPopover presentPopoverFromBarButtonItem:(UIBarButtonItem *)sender
                                    permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        [docView setAccueil:self];
    } else {
        //The color picker popover is showing. Hide it.
        [docPopover dismissPopoverAnimated:YES];
        docPopover = nil;
    }
    
    if (salonPopover != nil)
    {
        //The color picker popover is showing. Hide it.
        [salonPopover dismissPopoverAnimated:YES];
        salonPopover = nil;
    }
}

- (IBAction)addSalonListener:(UIBarButtonItem *)sender
{
    NSLog(@"%@", [Utils concatenateString:LogListener withString:@" Add Salon Listener"]);
    if (salonView == nil) {
        //Create the ColorPickerViewController.
        salonView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SalonPopoverID"];
        // docView.delegate=self;
    }
    
    if (salonPopover == nil) {
        //The color picker popover is not showing. Show it.
        salonPopover = [[UIPopoverController alloc] initWithContentViewController:salonView];
        [salonPopover presentPopoverFromBarButtonItem:(UIBarButtonItem *)sender
                           permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];

        
    } else {
        //The color picker popover is showing. Hide it.
        [salonPopover dismissPopoverAnimated:YES];
        salonPopover = nil;
    }
    
    if (docPopover != nil)
    {
        //The color picker popover is showing. Hide it.
        [docPopover dismissPopoverAnimated:YES];
        docPopover = nil;
    }
}

/*
 *  For table view
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Facade countSalons];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    cell.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    
    Salon *salon = [[Facade getListeSalons] objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = [salon getName];
    cell.detailTextLabel.text = [salon getAdress];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"GoToSalonDetail" sender:[self.tableViewSalon cellForRowAtIndexPath:indexPath]];
}

/*
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"GoToSalonDetail"])
    {
        SplitView *destination = [segue destinationViewController];
    }
}
*/
@end
