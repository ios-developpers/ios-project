//
//  SalonPopover.h
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalonPopoverViewController : UIViewController
{

}

@property (strong, nonatomic) IBOutlet UITextField *nameSalon;
@property (strong, nonatomic) IBOutlet UITextField *lieuSalon;
@property (strong, nonatomic) IBOutlet UIDatePicker *dateSalon;

- (IBAction)newSalonListener:(UIButton *)sender;

@end
