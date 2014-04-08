//
//  ListePool.h
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListeDocument.h"
#import "Salon.h"
#import "Pool.h"

@interface ListePool : NSObject

@property(nonatomic, strong)NSMutableArray* listPool;

+(ListePool*)getInstance;

-(BOOL) addPool:(Pool*)_pool;
-(BOOL) removePool:(Pool*)_pool;
-(BOOL) removePoolAtIndex:(NSUInteger)index;
-(NSUInteger) countListPool;

-(NSMutableArray *)getProfils;
-(Pool *)getProfilAtIndex:(NSUInteger)index;

-(NSMutableArray*) getAllPoolsOf:(Salon*)salon;

-(BOOL) pool:(Pool*)pool contains:(Document*)document;

@end
