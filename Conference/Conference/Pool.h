//Pool.h
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import <Foundation/Foundation.h>
#import "Document.h"

//INTERFACE
@interface Pool : NSObject

//PROPERTIES
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *listDocument;

//METHODS
-(id) initWithName:(NSString*)_name;
-(id) initWithName:(NSString*)_name andListDocument:(NSMutableArray *)_listDocument;

-(BOOL) addDocument:(Document*)_document;
-(BOOL) removeDocument:(Document*)_document;
-(void) clearListDocument;
-(NSUInteger) countListDocument;

@end
