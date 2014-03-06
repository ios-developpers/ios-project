//
//  ListeSalons.h
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Salon.h"
#import "AccueilViewController.h"

@interface ListeSalons : NSObject
{
    
}

+(AccueilViewController *) accueil;

+(NSMutableArray *) getListeSalons;
+(NSArray *)getListeSalonsNotMutable;
+(BOOL) addSalon: (Salon *)salon;
+(BOOL) removeSalonAtIndex: (NSUInteger)index;
+(NSUInteger) count;
+(void) addObserver: (UIViewController *)controller;

@end
