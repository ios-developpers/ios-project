//
//  SalonPopoverViewController.m
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "SalonPopoverViewController.h"

@implementation SalonPopoverViewController

@synthesize champSalon;
@synthesize champLieu;
@synthesize champDate;

- (id)init
{
    self = [super initWithNibName:NULL bundle:NULL];
    if (self != nil)
    {
        // Further initialization if needed

    }
    return self;
}

-(void) viewDidLoad
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 40)];
    
    champSalon.leftView = paddingView;
    champSalon.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 40)];
    
    champLieu.leftView = paddingView2;
    champLieu.leftViewMode = UITextFieldViewModeAlways;
}

- (IBAction)addSalon:(id)sender {
    NSLog(@"%@", [Utils concatenateString:LogListener withString:@" Add Salon in Document Popover"]);
    
    NSString *name = [champSalon text];
    NSString *lieu = [champLieu text];
    NSDate *date = [champDate date];
    
    if([Utils isBlanck:name] | [Utils isBlanck:lieu])
    {
        // error
        NSLog(@"%@", [Utils concatenateString:LogError withString:@" - empty parameters on add salon"]);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Champs vide" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        // add salon
        Salon *salon = [[Salon alloc] initWithName:name andAdress:lieu andDate:date];
        if([[ListeSalon getInstance] addSalon:salon])
        {
            NSLog(@"%@", [Utils concatenateString:LogSuccess withString:@" - salon added in Facade"]);
        }
        
        champSalon.text = @"";
        champLieu.text = @"";
    }
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}
@end
