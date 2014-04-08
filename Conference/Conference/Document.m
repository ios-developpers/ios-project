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
static NSString *const kName = @"nameDoc";
static NSString *const kUrl = @"urlDoc";

//METHODS
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self=[super init])) {
        NSString *pName = [aDecoder decodeObjectForKey:kName];
        NSString *pUrl = [aDecoder decodeObjectForKey:kUrl];
        return [self initWithName:pName andUrl:pUrl];
    }
    return self;
}

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

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:name forKey:kName];
    [aCoder encodeObject:url forKey:kUrl];
}

@end
