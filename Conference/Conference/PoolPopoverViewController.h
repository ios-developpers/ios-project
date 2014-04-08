//
//  PoolPopoverViewController.h
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocumentViewController.h"
#import "Utils.h"
#import "Document.h"
#import "SalonViewController.h"
#import "Constants.h"

@protocol PoolPopoverDelegate <NSObject>
@end

@interface PoolPopoverViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *champNom;
@property (strong, nonatomic) IBOutlet UIView *docPopover;

@property (weak, nonatomic) SalonViewController *parent;

@property (nonatomic, weak) id<PoolPopoverDelegate> delegate;

- (IBAction)addPool:(id)sender;

- (id)init;
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle;

@end