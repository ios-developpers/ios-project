//
//  SalonPopover.h
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SalonPopoverDelegate <NSObject>
@required
- (IBAction)addSalon:(id)sender ;
@end

@class AccueilViewController;

@interface SalonPopoverViewController : UIViewController

@property (strong, nonatomic) UIViewController *accueil;
@property (strong, nonatomic) IBOutlet UIView *ViewSalonPopover;
@property (strong, nonatomic) IBOutlet UITextField *champSalon;
@property (strong, nonatomic) IBOutlet UITextField *champLieu;
@property (strong, nonatomic) IBOutlet UIDatePicker *champDate;

@property (nonatomic, weak) id<SalonPopoverDelegate> delegate;

- (IBAction)addSalon:(id)sender ;
- (id)init;
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle;
- (void)setVAccueil:(AccueilViewController *)newAccueil;
@end