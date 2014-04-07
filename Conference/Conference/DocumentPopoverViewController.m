
//
//  DocumentPopoverViewController.m
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "DocumentPopoverViewController.h"

@implementation DocumentPopoverViewController

@synthesize champNom;
@synthesize champURL;

@synthesize igSwitch;
@synthesize eiiSwitch;
@synthesize steSwitch;
@synthesize stiaSwitch;
@synthesize matSwitch;
@synthesize meaSwitch;
@synthesize seSwitch;

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
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 40)];

    champURL.leftView = paddingView2;
    champURL.leftViewMode = UITextFieldViewModeAlways;
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
        if([[ListeDocument getInstance] addDocument:document])
        {
            NSLog(@"%@", [Utils concatenateString:LogSuccess withString:@" - document added in ListePool"]);
            
            if([igSwitch isOn])
            {
                [[[ListePool getInstance] getProfilAtIndex:0] addDocument:document];
            }
            if([eiiSwitch isOn])
            {
                [[[ListePool getInstance] getProfilAtIndex:1] addDocument:document];
            }
            if([steSwitch isOn])
            {
                [[[ListePool getInstance] getProfilAtIndex:2] addDocument:document];
            }
            if([stiaSwitch isOn])
            {
                [[[ListePool getInstance] getProfilAtIndex:3] addDocument:document];
            }
            if([matSwitch isOn])
            {
                [[[ListePool getInstance] getProfilAtIndex:4] addDocument:document];
            }
            if([meaSwitch isOn])
            {
                [[[ListePool getInstance] getProfilAtIndex:5] addDocument:document];
            }
            if([seSwitch isOn])
            {
                [[[ListePool getInstance] getProfilAtIndex:6] addDocument:document];
            }
        }
        
        champNom.text = @"";
        champURL.text = @"";
        
        [igSwitch setOn:NO animated:NO];
        [eiiSwitch setOn:NO animated:NO];
        [steSwitch setOn:NO animated:NO];
        [stiaSwitch setOn:NO animated:NO];
        [matSwitch setOn:NO animated:NO];
        [meaSwitch setOn:NO animated:NO];
        [seSwitch setOn:NO animated:NO];
    }
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    NSAssert(NO, @"Initialize with -init");
    return nil;
}

@end
