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
@synthesize field;

//METHODS

-(id) initWithName: (NSString *)_name andUrl: (NSString *)_url andField:(Field *)_field
{
    self = [super init];
    
    if (self)
    {
        self->name = _name;
        self->url = _url;
        self->field = nil;
        if(_field != nil) self->field = _field;
    }
    
    NSLog(@"%@", [Utils concatenateString:LogConstructor withString:@" Document"]);
    
    return self;
}

- (id)initWithName:(NSString *)_name andUrl:(NSString *)_url
{
    return [self initWithName:name andUrl:_url andField:nil];
}

@end
