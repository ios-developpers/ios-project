//
//  PoolPopoverViewController.m
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "PoolPopoverViewController.h"

@implementation PoolPopoverViewController

@synthesize champNom;
@synthesize docPopover;
@synthesize parent;

- (IBAction)addPool:(id)sender {
    NSLog(@"%@", [Utils concatenateString:LogListener withString:@" Add Pool in Pool Popover"]);
    
    NSString *name = [champNom text];
    
    if([Utils isBlanck:name])
    {
        // error
        NSLog(@"%@", [Utils concatenateString:LogError withString:@" - empty parameters on add pool"]);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Champs vide" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        // add pool
        Pool *pool = [[Pool alloc] initWithName:name];
        if([parent.salon addPool:pool])
        {
            NSLog(@"%@", [Utils concatenateString:LogSuccess withString:@" - pool added in Salon"]);
        }
        
        champNom.text = @"";
    }

}

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
    
    champNom.leftView = paddingView;
    champNom.leftViewMode = UITextFieldViewModeAlways;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}
@end
