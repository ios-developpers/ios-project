//
//  DocumentViewController.m
//  Conference
//
//  Created by ig_2014 on 03/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "DocumentViewController.h"

@implementation DocumentViewController

@synthesize tableViewDocument;
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

-(void) viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(forceReload:) name:@"DocumentNotification" object:nil];
}

-(void) viewWillDisappear:(BOOL)animated
{
    if (docPopover != nil)
    {
        [docPopover dismissPopoverAnimated:YES];
        docPopover = nil;
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", [Utils concatenateString:LogLoaded withString:@" Document View Controller"]);
}

-(void) forceReload:(NSNotification *)notification
{
    [tableViewDocument reloadData];
    
    if (docPopover != nil)
    {
        [docPopover dismissPopoverAnimated:YES];
        docPopover = nil;
    }
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
    
    if (docPopover == nil | ![docPopover isPopoverVisible]) {
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
    return [[ListeDocument getInstance] countListDocument];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"CellDocument";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    cell.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    
    Document *document = [[ListeDocument getInstance].listDocument objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = document.name;
    cell.detailTextLabel.text = document.url;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [[ListeDocument getInstance] removeDocumentAtIndex:indexPath.row];
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self performSegueWithIdentifier:@"GoToSalonDetail" sender:[self.tableViewDocument cellForRowAtIndexPath:indexPath]];
}

@end