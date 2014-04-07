//
//  DocumentViewController.h
//  Conference
//
//  Created by ig_2014 on 03/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocumentPopoverViewController.h"
#import "Utils.h"
#import "Constants.h"
#import "Document.h"
#import "Salon.h"

#import "ListeDocument.h"

@interface DocumentViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UIPopoverControllerDelegate>
{
    UIPopoverController *popOverController;
    UIPickerView *categoryPicker;
    UIToolbar *pickerToolBar;
    NSMutableArray *arrayOfCategories;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *buttonDocument;

@property (nonatomic, strong) NSArray *tableDocuments;
@property (strong, nonatomic) IBOutlet UITableView *tableViewDocument;

@property (nonatomic, strong) UIViewController *docView;
@property (nonatomic, strong) UIPopoverController *docPopover;

//Listeners

- (IBAction)addDocumentListener:(UIBarButtonItem *)sender;

-(void) forceReload:(NSNotification *)notification;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end