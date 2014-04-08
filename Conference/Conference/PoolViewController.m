//
//  PoolViewController.m
//  Conference
//
//  Created by ig_2014 on 08/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "PoolViewController.h"

@implementation PoolViewController

@synthesize pool;
@synthesize tableViewDocument;

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
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(forceReload:) name:@"" object:nil];
}

-(void) viewWillDisappear:(BOOL)animated
{
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", [Utils concatenateString:LogLoaded withString:@" Pool View Controller"]);
    
    NSLog(@"Debug");
    Document* tmp;
    
    for(tmp in pool.listDocument)
    {
        NSLog(@"%@", tmp.name);
    }
}

-(void) forceReload:(NSNotification *)notification
{
    [tableViewDocument reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    static NSString *MyIdentifier = @"CellDocumentPool";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if([[ListePool getInstance] pool:pool contains:[[ListeDocument getInstance].listDocument objectAtIndex:[indexPath row]]])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([[ListePool getInstance] pool:pool contains:[[ListeDocument getInstance].listDocument objectAtIndex:[indexPath row]]])
    {
        [pool removeDocument:[[ListeDocument getInstance].listDocument objectAtIndex:[indexPath row]]];
    }
    else
    {
        [pool addDocument:[[ListeDocument getInstance].listDocument objectAtIndex:[indexPath row]]];
    }
        
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
