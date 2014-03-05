//
//  Document.m
//  Conference
//
//  Created by ig_2014 on 05/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "Document.h"
#import "Utils.h"
#import "Constants.h"

@implementation Document

/*
 *  Constructors
 */

-(id) initWithName: (NSString *)_name andUrl: (NSString *)_url
{
    self = [super init];
    
    if (self)
    {
        self->name = _name;
        self->url = _url;
    }
    
    NSLog(@"%@", [Utils concatenateString:LogConstructor withString:@" Document"]);
    
    return self;
}

/*
 *  Setters
 */
-(void) setName: (NSString *)newName
{
    self->name = newName;
}

-(void) setUrl: (NSString *)newUrl
{
    self->url = newUrl;
}


/*
 *  Getters
 */
-(NSString *) getName
{
    return self->name;
}

-(NSString *) getUrl
{
    return self->url;
}

@end
