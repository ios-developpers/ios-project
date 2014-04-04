//
//  DocumentPopoverViewController.h
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocumentViewController.h"
#import "Utils.h"
#import "Document.h"
#import "Constants.h"
#import "Facade.h"

@protocol DocumentPopoverDelegate <NSObject>
@required
- (IBAction)addDocument:(id)sender ;
@end

@interface DocumentPopoverViewController : UIViewController

@property (strong, nonatomic) UIViewController *daddy;
@property (strong, nonatomic) IBOutlet UIView *docPopover;
@property (strong, nonatomic) IBOutlet UITextField *champNom;
@property (strong, nonatomic) IBOutlet UITextField *champURL;

@property (strong, nonatomic) IBOutlet UISwitch *igSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *eiiSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *steSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *stiaSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *matSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *meaSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *seSwitch;

@property (nonatomic, weak) id<DocumentPopoverDelegate> delegate;

- (id)init;
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle;
- (IBAction)addDocument:(id)sender;
- (void)setVDaddy:(UIViewController *)newAccueil;
@end