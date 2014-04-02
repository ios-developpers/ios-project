//
//  DocumentPopover.h
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AccueilViewController.h"
#import "Utils.h"
#import "Constants.h"
#import "Facade.h"

@protocol DocumentPopoverDelegate <NSObject>
@required
- (IBAction)addDocument:(id)sender ;
@end

@class AccueilViewController;

@interface DocumentPopoverViewController : UIViewController

@property (strong, nonatomic) UIViewController *accueil;
@property (strong, nonatomic) IBOutlet UIView *docPopover;
@property (strong, nonatomic) IBOutlet UITextField *champNom;
@property (strong, nonatomic) IBOutlet UITextField *champURL;
@property (strong, nonatomic) IBOutlet UIPickerView *refProfil;

@property (nonatomic, weak) id<DocumentPopoverDelegate> delegate;

- (IBAction)addDocument:(id)sender;
- (void)setVAccueil:(AccueilViewController *)newAccueil;
- (id)init;
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle;
@end