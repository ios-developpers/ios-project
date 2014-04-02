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
- (IBAction)addSalon:(id)sender {
    NSLog(@"%@", [Utils concatenateString:LogListener withString:@" Add Salon in Document Popover"]);
    
    
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}
@end
