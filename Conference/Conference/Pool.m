//
//  Pool.m
//  Conference
//
//  Created by ig_2014 on 05/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "Pool.h"

@implementation Pool

/*
 *
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
    
    return self;
}



@end
