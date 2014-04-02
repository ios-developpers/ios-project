//
//  MyViewController.h
//  Conference
//
//  Created by ig_2014 on 04/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"
#import "Constants.h"
#import "Document.h"
#import "Salon.h"
#import "SalonPopoverViewController.h"
#import "DocumentPopoverViewController.h"
#import "Facade.h"

@interface AccueilViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UIPopoverControllerDelegate>
{
    UIPopoverController *popOverController;
    UIPickerView *categoryPicker;
    UIToolbar *pickerToolBar;
    NSMutableArray *arrayOfCategories;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *buttonDocument;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *buttonSalon;

@property (nonatomic, strong) NSArray *tableSalons;
@property (strong, nonatomic) IBOutlet UITableView *tableViewSalon;

@property (nonatomic, strong) UIViewController *docView;
@property (nonatomic, strong) UIPopoverController *docPopover;

@property (nonatomic, strong) UIViewController *salonView;
@property (nonatomic, strong) UIPopoverController *salonPopover;

//Listeners

- (IBAction)addDocumentListener:(UIBarButtonItem *)sender;

- (void) forceReload;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
