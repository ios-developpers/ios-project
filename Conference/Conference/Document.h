//Document.h
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import <Foundation/Foundation.h>

//INTERFACE
@interface Document : NSObject <NSCoding>

//PROPERTIES
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* url;

//METHODS
-(id)initWithCoder:(NSCoder *)aDecoder;
-(id) initWithName:(NSString *)_name andUrl:(NSString *)_url;

-(void)encodeWithCoder:(NSCoder *)aCoder;
@end
