//
//  DocumentPopover.h
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocumentPopoverViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *documentNames;

- (id)init;
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle;
@end