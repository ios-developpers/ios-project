//
//  SalonPopover.m
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "SalonPopoverViewController.h"
#import "Utils.h"
#import "Constants.h"
#import "Salon.h"
#import "ListeSalons.h"

@implementation SalonPopoverViewController

@synthesize nameSalon;
@synthesize lieuSalon;
@synthesize dateSalon;

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

- (IBAction)newSalonListener:(UIButton *)sender
{
    NSLog(@"%@", [Utils concatenateString:LogListener withString:@" New Salon in Popover Salon"]);
    
    NSString *name = [self->nameSalon text];
    NSString *lieu = [self->lieuSalon text];
    NSDate *date = [self->dateSalon date];
    
    // insert control of strings here
    
    Salon *salon = [[Salon alloc] initWithName:name andAdress:lieu andDate:date];
    [ListeSalons addSalon:salon];
    
    // close popover
    
}

@end
