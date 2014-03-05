//
//  Pool.m
//  Conference
//
//  Created by ig_2014 on 05/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "Pool.h"
#import "Utils.h"
#import "Constants.h"

@implementation Pool

/*
 *  Constructor
 */

-(id) initWithName:(NSString *)_name
{
    self = [self initWithName:_name andDocuments:nil];
    
    return self;
}

-(id) initWithName:(NSString *)_name andDocuments:(NSMutableArray *)_documents
{
    self = [super init];
    
    if(self)
    {
        self->name = _name;
        self->documents = _documents;
    }
    
    NSLog(@"%@", [Utils concatenateString:LogConstructor withString:@" Pool"]);
    
    return self;
}

/*
 *  Setters
 */

-(void) setName:(NSString *)newName
{
    self->name = newName;
}

-(void) setDocuments:(NSMutableArray *)newDocuments
{
    self->documents = newDocuments;
}

/*
 *  Getters
 */

-(NSString *) getName
{
    return self->name;
}

-(NSMutableArray *) getDocuments
{
    return self->documents;
}

/*
 *  Instance methods
 */

-(BOOL) addDocument:(Document *)document
{
    if (self->documents == nil)
    {
        self->documents = [[NSMutableArray alloc] init];
    }
    
    [self->documents addObject:document];
    
    if ([self->documents containsObject:document])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(BOOL) removeDocumentAtIndex:(NSUInteger)index
{
    NSUInteger oldSize = [self->documents count];
    
    [self->documents removeObjectAtIndex:index];
    
    return ([self->documents count] < oldSize);
}

-(void) clearDocuments
{
    [self->documents removeAllObjects];
    [self->documents finalize];
    
    self->documents = [[NSMutableArray alloc] init];
}

@end
