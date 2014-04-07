//
//  ListeDocument.m
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "ListeDocument.h"

@implementation ListeDocument

@synthesize listDocument;

+(ListeDocument*)getInstance
{
    static ListeDocument* instance=nil;
    
    if(instance==nil)
    {
        instance=[[ListeDocument alloc] init];
        
        instance->listDocument = [[NSMutableArray alloc] init];
    }
    
    return instance;
}

-(BOOL)addDocument:(Document *)_document
{
    NSUInteger size = [listDocument count];
    
    [listDocument addObject:_document];
    
    [self notifyObservers];
    
    return([listDocument count] > size);
}

-(BOOL)removeDocument:(Document*)_document
{
    NSUInteger size = [listDocument count];
    
    [listDocument removeObject:_document];
    
    [self notifyObservers];
    
    return([listDocument count] < size);
}

-(BOOL)removeDocumentAtIndex:(NSUInteger)index
{
    NSUInteger size = [listDocument count];
    
    [listDocument removeObjectAtIndex:index];
    
    [self notifyObservers];
    
    return([listDocument count] < size);
}

-(NSUInteger) countListDocument
{
    return [listDocument count];
}

// Observable protocol function
- (void)notifyObservers
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"DocumentNotification"
     object:nil];
}

@end
