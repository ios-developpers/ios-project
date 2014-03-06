//
//  Salon.h
//  Conference
//
//  Created by ig_2014 on 05/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pool.h"

@interface Salon : NSObject
{
    NSString *name;
    NSString *adress;
    NSDate *date;
    NSMutableArray *pools;
}

-(id) initWithName: (NSString *)_name andAdress: (NSString *)_adress andDate: (NSDate *)_date;
-(id) initWithName: (NSString *)_name andAdress: (NSString *)_adress andDate: (NSDate *)_date andPools: (NSMutableArray *)_pools;

-(void) setName: (NSString *)newName;
-(void) setAdress: (NSString *)newAdress;
-(void) setDate: (NSDate *)newDate;
-(void) setPools: (NSMutableArray *)newPools;

-(NSString *) getName;
-(NSString *) getAdress;
-(NSDate *) getDate;
-(NSMutableArray *) getPools;

-(BOOL) addPool: (Pool *)document;
-(BOOL) removePoolAtIndex: (NSUInteger)index;
-(void) clearPools;


@end
