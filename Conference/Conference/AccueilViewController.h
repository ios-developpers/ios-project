//
//  MyViewController.h
//  Conference
//
//  Created by ig_2014 on 04/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocumentPopoverViewController.h"
#import "SalonPopoverViewController.h"
#import "Utils.h"
#import "Constants.h"
#import "Document.h"
#import "Salon.h"

#import "ListeSalon.h"

@interface AccueilViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UIPopoverControllerDelegate>
{

}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *buttonSalon;

@property (nonatomic, strong) NSArray *tableSalons;
@property (strong, nonatomic) IBOutlet UITableView *tableViewSalon;

@property (nonatomic, strong) UIViewController *salonView;
@property (nonatomic, strong) UIPopoverController *salonPopover;

//Listeners

- (IBAction)addSalonListener:(UIBarButtonItem *)sender;

-(void) forceReload:(NSNotification *)notification;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
