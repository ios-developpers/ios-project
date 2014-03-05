//
//  Document.h
//  Conference
//
//  Created by ig_2014 on 05/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Document : NSObject
{
    NSString *name;
    NSString *url;
}

-(id) initWithName: (NSString *)_name andUrl: (NSString *)_url;

-(void) setName: (NSString *)newName;
-(void) setUrl: (NSString *)newUrl;

-(NSString *) getName;
-(NSString *) getUrl;

@end
