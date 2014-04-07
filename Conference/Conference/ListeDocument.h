//
//  ListeDocument.h
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObservableP.h"
#import "PersistantP.h"
#import "Document.h"
#import "Persistance.h"

@interface ListeDocument : NSObject <ObservableP, PersistantP>

@property(nonatomic,strong)NSMutableArray* listDocument;

-(id)init;

+(ListeDocument*)getInstance;

-(BOOL) addDocument:(Document*)_document;
-(BOOL) removeDocument:(Document*)_document;
-(BOOL) removeDocumentAtIndex:(NSUInteger)index;
-(NSUInteger) countListDocument;

-(void)loadItSelf;
-(void)saveItSelf;
-(NSString *)getPath;
@end
