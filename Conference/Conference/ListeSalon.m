//
//  ListeSalon.m
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "ListeSalon.h"

@implementation ListeSalon

@synthesize listSalon;

+(ListeSalon*)getInstance
{
    static ListeSalon* instance=nil;
    
    if(instance==nil)
    {
        instance=[[ListeSalon alloc] init];
        
        instance->listSalon = [[NSMutableArray alloc] init];
    }
    
    return instance;
}

-(BOOL)addSalon:(Salon *)_salon
{
    NSUInteger size = [listSalon count];
    
    [listSalon addObject:_salon];
    
    [self notifyObservers];
    
    return([listSalon count] > size);
}

-(BOOL)removeSalon:(Salon*)_salon
{
    NSUInteger size = [listSalon count];
    
    [listSalon removeObject:_salon];
    
    [self notifyObservers];
    
    return([listSalon count] < size);
}

-(BOOL)removeSalonAtIndex:(NSUInteger)index
{
    NSUInteger size = [listSalon count];
    
    [listSalon removeObjectAtIndex:index];
    
    [self notifyObservers];
    
    return([listSalon count] < size);
}

-(NSUInteger) countListSalon
{
    return [listSalon count];
}

// Observable protocol function
- (void)notifyObservers
{
    [[NSNotificationCenter defaultCenter]
        postNotificationName:@"SalonNotification"
        object:nil];
}


@end
