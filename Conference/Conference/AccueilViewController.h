//
//  MyViewController.h
//  Conference
//
//  Created by ig_2014 on 04/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccueilViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    BOOL isPopoverSalonOpened;
}

@property (nonatomic, strong) NSArray *tableSalons;
@property (strong, nonatomic) IBOutlet UITableView *tableViewSalon;

//Listeners
- (IBAction)addDocumentListener:(UIBarButtonItem *)sender;

- (void) forceReload;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
