//
//  ListeDocument.h
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObservableP.h"
#import "Document.h"

@interface ListeDocument : NSObject <ObservableP>

@property(nonatomic,strong)NSMutableArray* listDocument;


+(ListeDocument*)getInstance;

-(BOOL) addDocument:(Document*)_document;
-(BOOL) removeDocument:(Document*)_document;
-(BOOL) removeDocumentAtIndex:(NSUInteger)index;
-(NSUInteger) countListDocument;

@end
