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

//INTERFACE
@interface SalonViewController : UIViewController<MFMailComposeViewControllerDelegate>

//METHODS
- (IBAction)sendButton:(id)sender;

@end

