//
//  DocumentPopover.m
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "DocumentPopoverViewController.h"

@implementation DocumentPopoverViewController

@synthesize accueil;
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
    NSLog(@"%@", [Utils concatenateString:LogListener withString:@" Add Document in Document Popover"]);
    
    NSString *name = [champNom text];
    NSString *url = [champURL text];
    
    if([Utils isBlanck:name] | [Utils isBlanck:url])
    {
        // error
        NSLog(@"%@", [Utils concatenateString:LogError withString:@" - empty parameters on add document"]);

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Champs vide" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        // add document
        Document *document = [[Document alloc] initWithName:name andUrl:url];
        if([[Facade getInstance] addDocument:document])
        {
            NSLog(@"%@", [Utils concatenateString:LogSuccess withString:@" - document added in Facade"]);
        }
        
        champNom.text = @"";
        champURL.text = @"";
        
        [((AccueilViewController*)accueil).docPopover dismissPopoverAnimated:YES];
        ((AccueilViewController*)accueil).docPopover = nil;
    }
}

- (void)setVAccueil:(AccueilViewController *)newAccueil
{
    accueil = newAccueil;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}
@end
