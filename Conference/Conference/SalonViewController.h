//
//  SalonViewController.h
//  Conference
//
//  Created by ig_2014 on 03/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

//IMPORT
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "ListeSalon.h"
#import "ListePool.h"
#import "ListeDocument.h"
#import "Salon.h"
#import "Utils.h"
#import "Constants.h"

//INTERFACE
@interface SalonViewController : UIViewController<MFMailComposeViewControllerDelegate, UITableViewDelegate, UITableViewDataSource,UIPopoverControllerDelegate>

@property (nonatomic, strong) Salon* salon;
@property (strong, nonatomic) IBOutlet UIButton *addPool;

@property (nonatomic, strong) NSArray *tablePools;
@property (strong, nonatomic) IBOutlet UITableView *tableViewPools;

@property (nonatomic, strong) NSArray *tableDocuments;
@property (strong, nonatomic) IBOutlet UITableView *tableViewDocuments;

@property (nonatomic, strong) UIViewController *poolView;
@property (nonatomic, strong) UIPopoverController *poolPopover;

//METHODS
- (IBAction)addPoolListener:(id)sender;
- (IBAction)sendButton:(id)sender;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

