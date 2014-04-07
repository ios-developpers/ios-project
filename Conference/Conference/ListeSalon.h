//
//  ListeSalon.h
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersistantP.h"
#import "Salon.h"
#import "Persistance.h"

@class AccueilViewController;

@interface ListeSalon : NSObject <PersistantP>

@property(nonatomic,strong)NSMutableArray* listSalon;

+(ListeSalon*)getInstance;

-(id)init;

-(BOOL) addSalon:(Salon*)_salon;
-(BOOL) removeSalon:(Salon*)_salon;
-(BOOL) removeSalonAtIndex:(NSUInteger)index;
-(NSUInteger) countListSalon;

-(void)loadItSelf;
-(void)saveItSelf;
-(NSString *)getPath;

@end
