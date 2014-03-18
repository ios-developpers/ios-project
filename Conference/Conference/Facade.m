//
//  CodeData.m
//  Conference
//
//  Created by ig_2014 on 18/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "Facade.h"

@implementation Facade

/*
 *  Salons
 */

+(NSMutableArray *)getListeSalons
{
    static NSMutableArray *salons = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        salons = [[NSMutableArray alloc] init];
        [salons addObject: [[Salon alloc] initWithName:@"Studirama" andAdress:@"Montpellier" andDate:nil]];
        
    });
    return salons;
}

+(NSArray *)getListeSalonsNotMutable
{
    NSMutableArray *salons = [self getListeSalons];
    
    return [[NSArray alloc] initWithArray:salons];
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

+(NSUInteger) countSalons
{
    return [[self getListeSalons] count];
}

/*
 *  Documents
 */

+(NSMutableArray *)getListeDocuments
{
    static NSMutableArray *documents = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        documents = [[NSMutableArray alloc] init];
        [documents addObject: [[Document alloc] initWithName:@"Plaquette IG" andUrl:@"https://www.google.com"]];
        
    });
    return documents;
}

+(NSArray *)getListeDocumentsNotMutable
{
    NSMutableArray *documents = [self getListeDocuments];
    
    return [[NSArray alloc] initWithArray:documents];
}

+(BOOL)addDocument:(Document *)document
{
    NSMutableArray *documents = [self getListeDocuments];
    NSUInteger size = [documents count];
    
    [documents addObject:document];
    
    if ([documents count] > size)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(BOOL)removeDocumentAtIndex:(NSUInteger)index
{
    NSMutableArray *documents = [self getListeDocuments];
    NSUInteger size = [documents count];
    
    [documents removeObjectAtIndex:index];
    
    if ([documents count] < size)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(NSUInteger) countDocuments
{
    return [[self getListeDocuments] count];
}

@end
