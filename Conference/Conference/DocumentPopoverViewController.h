//
//  DocumentPopover.h
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DocumentPopoverDelegate <NSObject>
@required
- (IBAction)addDocument:(id)sender ;
@end

@interface DocumentPopoverViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *ViewDocumentPopover;
@property (strong, nonatomic) IBOutlet UITextField *champNom;
@property (strong, nonatomic) IBOutlet UITextField *champURL;
@property (strong, nonatomic) IBOutlet UIPickerView *refProfil;

@property (nonatomic, weak) id<DocumentPopoverDelegate> delegate;

- (IBAction)addDocument:(id)sender ;
- (id)init;
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle;
@end