//
//  ListeSalons.h
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Salon.h"

@interface ListeSalons : NSObject
{
    
}

+(NSMutableArray *) getListeSalons;
+(BOOL) addSalon: (Salon *)salon;
+(BOOL) removeSalonAtIndex: (NSUInteger)index;
+(NSUInteger) count;

@end
