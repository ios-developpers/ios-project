//
//  MyViewController.m
//  Conference
//
//  Created by ig_2014 on 04/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "AccueilViewController.h"
#import "Utils.h"
#import "Constants.h"
#import "Document.h"
#import "Salon.h"
#import "ListeSalons.h"
#import "SalonPopoverViewController.h"
#import "DocumentPopoverViewController.h"

@implementation AccueilViewController

@synthesize tableViewSalon;
@synthesize docView;
@synthesize docPopover;

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
    [ListeSalons addObserver:self];
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
    } else {
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
    return [ListeSalons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    
    Salon *salon = [[ListeSalons getListeSalons] objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = [salon getName];
    
    return cell;
}

@end
