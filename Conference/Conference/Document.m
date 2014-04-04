//Document.m
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import "Document.h"
#import "Utils.h"
#import "Constants.h"

//IMPLEMENTATION
@implementation Document

//SYNTHESIZE
@synthesize name;
@synthesize url;

//METHODS

-(id) initWithName:(NSString*)_name andUrl:(NSString*)_url
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


@end
