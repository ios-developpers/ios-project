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

@interface AccueilViewController ()

- (IBAction)addSalonListener:(UIBarButtonItem *)sender;

@end

@implementation AccueilViewController

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
	// Do any additional setup after loading the view.
    Document *doc1 = [[Document alloc] initWithName:@"doc1 name" andUrl:@"doc1.url.com"];
    Document *doc2 = [[Document alloc] initWithName:@"doc2 name" andUrl:@"doc2.url.com"];
    Document *doc3 = [[Document alloc] initWithName:@"doc3 name" andUrl:@"doc3.url.com"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addSalonListener:(UIBarButtonItem *)sender
{
    NSLog(@"%@", [Utils concatenateString:LogListener withString:@" Add Salon in Accueil View"]);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    _arr = [[NSArray alloc]initWithObjects:@"HEJ",@"FOO", nil];
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }
    
    NSString *cellValue = [_arr objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
}

@end
