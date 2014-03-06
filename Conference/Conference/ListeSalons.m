//
//  ListeSalons.m
//  Conference
//
//  Created by ig_2014 on 06/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "ListeSalons.h"

@implementation ListeSalons

+(NSMutableArray *)getListeSalons
{
    static NSMutableArray *salons = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        salons = [[NSMutableArray alloc] init];
    });
    return salons;
}

+(BOOL)addSalon:(Salon *)salon
{
    NSMutableArray *salons = [self getListeSalons];
    NSUInteger size = [salons count];
    
    [salons addObject:salon];
    
    if ([salons count] > size)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(BOOL)removeSalonAtIndex:(NSUInteger)index
{
    NSMutableArray *salons = [self getListeSalons];
    NSUInteger size = [salons count];
    
    [salons removeObjectAtIndex:index];
    
    if ([salons count] < size)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(NSUInteger) count
{
    return [[self getListeSalons] count];
}

@end
