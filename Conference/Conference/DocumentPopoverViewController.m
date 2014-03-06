//
//  DocumentPopover.m
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "DocumentPopoverViewController.h"
#import "Utils.h"

@implementation DocumentPopoverViewController

@synthesize champNom;
@synthesize champURL;
@synthesize refProfil;

- (id)init
{
    self = [super initWithNibName:NULL bundle:NULL];
    if (self != nil)
    {
        // Further initialization if needed
        
    }
    return self;
}
- (IBAction)addDocument:(id)sender {
     NSLog(@"%@", @" Ajout du document");
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}
@end
