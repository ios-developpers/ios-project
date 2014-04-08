//Pool.h
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import <Foundation/Foundation.h>
#import "Document.h"

//INTERFACE
@interface Pool : NSObject <NSCoding>

//PROPERTIES
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *listDocument;

//METHODS
-(id)initWithCoder:(NSCoder *)aDecoder;-(id) initWithName:(NSString*)_name;
-(id) initWithName:(NSString*)_name andListDocument:(NSMutableArray *)_listDocument;

-(BOOL) addDocument:(Document*)_document;
-(BOOL) removeDocument:(Document*)_document;
-(BOOL) removeDocumentAtIndex:(NSUInteger)index;
-(void) clearListDocument;
-(NSUInteger) countListDocument;

-(void)encodeWithCoder:(NSCoder *)aCoder;
@end
