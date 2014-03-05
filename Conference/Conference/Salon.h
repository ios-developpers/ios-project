//
//  Salon.h
//  Conference
//
//  Created by ig_2014 on 05/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Salon : NSObject
{
    NSString *name;
    NSString *adress;
    NSDate *date;
}

-(id) initWithName: (NSString *)_name andAdress: (NSString *)_adress andDate: (NSDate *)_date;

-(void) setName: (NSString *)newName;
-(void) setAdress: (NSString *)newAdress;
-(void) setDate: (NSDate *)newDate;

-(NSString *) getName;
-(NSString *) getAdress;
-(NSDate *) getDate;

@end
