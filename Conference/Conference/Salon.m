//
//  Salon.m
//  Conference
//
//  Created by ig_2014 on 05/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "Salon.h"
#import "Utils.h"
#import "Constants.h"

@implementation Salon

/*
 *  Constructor
 */

-(id) initWithName:(NSString *)_name andAdress:(NSString *)_adress andDate:(NSDate *)_date
{
    self = [super init];
    
    if (self)
    {
        self->name = _name;
        self->adress = _adress;
        self->date = _date;
    }
    
    self->pools = nil;
    
    NSLog(@"%@", [Utils concatenateString:LogConstructor withString:@" Salon"]);
    
    return self;
}

/*
 *  Setters
 */

-(void) setName:(NSString *)newName
{
    self->name = newName;
}

-(void) setAdress:(NSString *)newAdress
{
    self->adress = newAdress;
}

-(void) setDate:(NSDate *)newDate
{
    self->date = newDate;
}

/*
 *  Getters
 */

-(NSString *) getName
{
    return self->name;
}

-(NSString *) getAdress
{
    return self->adress;
}

-(NSDate *) getDate
{
    return self->date;
}

@end
