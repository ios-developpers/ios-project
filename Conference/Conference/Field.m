//Field.m
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import "Field.h"
#import "Utils.h"
#import "Constants.h"

@implementation Field

@synthesize name;
@synthesize listDocument;

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


-(BOOL)addDocument:(Document *)document
{
    NSMutableArray *documents = self->listDocument;
    NSUInteger size = [documents count];
    
    [documents addObject:document];
    
    return([documents count] > size);
}

-(BOOL)removeDocument:(Document*)_document
{
    NSMutableArray *documents =  self->listDocument;
    NSUInteger size = [documents count];
    
    [documents removeObject:_document];
    
    return([documents count] < size);
}

-(NSUInteger) countListDocument
{
    return [self->listDocument count];
}

@end
