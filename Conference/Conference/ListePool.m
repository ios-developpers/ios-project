//
//  ListePool.m
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "ListePool.h"

@implementation ListePool

@synthesize listPool;

+(ListePool*)getInstance{
    static ListePool* instance = nil;
    
    if(instance==nil)
    {
        instance=[[ListePool alloc] init];
    }
    
    return instance;
}

-(BOOL)addPool:(Pool *)_Pool
{
    NSUInteger size = [listPool count];
    
    [listPool addObject:_Pool];
    
    return([listPool count] > size);
}

-(BOOL)removePool:(Pool*)_Pool
{
    NSUInteger size = [listPool count];
    
    [listPool removeObject:_Pool];
    
    return([listPool count] < size);
}

-(BOOL)removePoolAtIndex:(NSUInteger)index
{
    NSUInteger size = [listPool count];
    
    [listPool removeObjectAtIndex:index];
    
    return([listPool count] < size);
}

-(NSUInteger) countListPool
{
    return [listPool count];
}

-(NSMutableArray *)getProfils
{
    static NSMutableArray* pools = nil;
    
    if(pools == nil)
    {
        pools = [[NSMutableArray alloc] init];
        
        NSArray *sections = [NSArray arrayWithObjects:@"IG", @"EII", @"STE", @"STIA", @"MAT", @"MEA", @"SE", nil];
        
        Pool *pool;
        NSString *section;
        for(section in sections)
        {
            pool = [[Pool alloc] initWithName:section];
            [pools addObject:pool];
        }
    }
    
    return pools;
}

-(Pool *)getProfilAtIndex:(NSUInteger)index
{
    return [[self getProfils] objectAtIndex:index];
}
-(NSMutableArray*) getAllPoolsOf:(Salon *)salon
{
    NSMutableArray* pools = [[NSMutableArray alloc] init];
    
    Pool* pool ;//= [[Pool alloc] initWithName:@"Tous les documents" andListDocument:[ListeDocument getInstance].listDocument];
    
    //[pools addObject:pool];
    
    for(pool in salon.listPool)
    {
        [pools addObject:pool];
    }
    
    for(pool in [self getProfils])
    {
        [pools addObject:pool];
    }
    
    return pools;
}

-(BOOL) pool:(Pool*)pool contains:(Document*)document
{
    Document* tmp;
    
    for (tmp in pool.listDocument)
    {
        if (tmp == document)
            return YES;
    }
    
    return NO;
}

@end
