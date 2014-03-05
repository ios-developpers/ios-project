//
//  Pool.h
//  Conference
//
//  Created by ig_2014 on 05/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Document.h"

@interface Pool : NSObject
{
    NSString *name;
    NSMutableArray *documents;
}

-(id) initWithName: (NSString *)_name;
-(id) initWithName: (NSString *)_name andDocuments: (NSMutableArray *)_documents;

-(void) setName: (NSString *)newName;
-(void) setDocuments: (NSMutableArray *)newDocuments;

-(NSString *) getName;
-(NSMutableArray *) getDocuments;

-(BOOL) addDocument: (Document *)document;
-(BOOL) removeDocumentAtIndex: (NSUInteger)index;
-(void) clearDocuments;

@end
