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

@end
