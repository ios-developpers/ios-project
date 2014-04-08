//
//  PoolViewController.h
//  Conference
//
//  Created by ig_2014 on 08/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//PoolViewController

#import <UIKit/UIKit.h>
#import "DocumentPopoverViewController.h"
#import "Utils.h"
#import "Constants.h"
#import "Document.h"
#import "Salon.h"

#import "ListeDocument.h"

@interface PoolViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UIPopoverControllerDelegate>
{

}

@property (nonatomic, strong) Pool* pool;

@property (nonatomic, strong) NSArray *tableDocuments;
@property (strong, nonatomic) IBOutlet UITableView *tableViewDocument;

//Listeners

-(void) forceReload:(NSNotification *)notification;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end