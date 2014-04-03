//Document.h
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import <Foundation/Foundation.h>
#import "Field.h"

//INTERFACE
@interface Document : NSObject

//PROPERTIES
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* url;
@property(nonatomic,weak)Field* field;

//METHODS
-(id) initWithName:(NSString *)_name andUrl:(NSString *)_url;
-(id) initWithName:(NSString *)_name andUrl:(NSString *)_url andField:(Field*)_field;

@end
