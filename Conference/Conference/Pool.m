//Pool.m
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import "Pool.h"
#import "Utils.h"
#import "Constants.h"

//IMPLEMENTATION
@implementation Pool

//SYNTHESIZE
@synthesize name;
@synthesize listDocument;

//METHODS
-(id) initWithName:(NSString *)_name
{
    self = [self initWithName:_name andListDocument:nil];
    
    return self;
}

-(id) initWithName:(NSString *)_name andListDocument:(NSMutableArray *)_listDocument
{
    self = [super init];
    
    if(self)
    {
        self->name = _name;
        self->listDocument = _listDocument;
    }
    
    NSLog(@"%@", [Utils concatenateString:LogConstructor withString:@" Pool"]);
    
    return self;
}

-(BOOL) addDocument:(Document *)document
{
    if (self->listDocument == nil)
    {
        self->listDocument = [[NSMutableArray alloc] init];
    }
    
    [self->listDocument addObject:document];
    
    if ([self->listDocument containsObject:document])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(BOOL) removeDocument:(Document*)_document
{
    NSUInteger oldSize = [self countListDocument];
    
    [self->listDocument removeObject:_document];
    
    return ([self countListDocument] < oldSize);
}

-(void) clearListDocument
{
    [self->listDocument removeAllObjects];
    [self->listDocument finalize];
    
    self->listDocument = [[NSMutableArray alloc] init];
}

-(NSUInteger) countListDocument
{
    return [self->listDocument count];
}

@end
