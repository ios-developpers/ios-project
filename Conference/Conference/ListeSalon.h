//
//  ListeSalon.h
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Salon.h"

@class AccueilViewController;

@interface ListeSalon : NSObject

@property(nonatomic,strong)NSMutableArray* listSalon;

+(ListeSalon*)getInstance;

-(BOOL) addSalon:(Salon*)_salon;
-(BOOL) removeSalon:(Salon*)_salon;
-(BOOL) removeSalonAtIndex:(NSUInteger)index;
-(NSUInteger) countListSalon;

- (void)notifyObservers;

@end
