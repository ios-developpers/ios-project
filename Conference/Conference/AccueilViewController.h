//
//  MyViewController.h
//  Conference
//
//  Created by ig_2014 on 04/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccueilViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameSalon;
@property (strong, nonatomic) IBOutlet UITextField *lieuSalon;
@property (strong, nonatomic) IBOutlet UIDatePicker *dateSalon;



- (IBAction)addSalonListener:(UIBarButtonItem *)sender;
- (IBAction)addDocumentListener:(UIBarButtonItem *)sender;
- (IBAction)newSalonListener:(UIButton *)sender;

@end
