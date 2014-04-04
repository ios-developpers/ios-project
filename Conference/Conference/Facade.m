//Facade.m
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import "Facade.h"

//IMPLEMENTATION
@implementation Facade

//SYNTHESIZE
@synthesize listDocument;
@synthesize listField;
@synthesize listSalon;
@synthesize listPool;


//CONSTRUCTEUR
+(Facade*)getInstance
{
    static Facade* instance=nil;
    
    if(instance==nil)
    {
        instance=[[Facade alloc] init];
    }
    
    return instance;
}

-(id) init
{
    self =[super init];
    
    listDocument = [[NSMutableArray alloc] init];
    listSalon = [[NSMutableArray alloc] init];
    listField = [[NSMutableArray alloc] init];
    listPool = [self getProfils];
    
    return self;
}

//POOL
-(NSMutableArray *)getProfils
{
    static NSMutableArray* pools = nil;
    
    if(pools == nil)
    {
        pools = [[NSMutableArray alloc] init];
        
        NSArray *sections = [NSArray arrayWithObjects:@"IG", @"EII", @"STE", @"STIA", @"MAT", @"MEA", @"SE", nil];
        
        Pool *pool;
        NSString *section;
        for(section in sections)
        {
            pool = [[Pool alloc] initWithName:section];
            [pools addObject:pool];
        }
    }

    return pools;
}

-(Pool *)getProfilAtIndex:(NSUInteger)index
{
    return [[self getProfils] objectAtIndex:index];
}

//METHODS
/*
-(NSMutableArray *)getListeSalons
{
    static NSMutableArray *salons = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        salons = [[NSMutableArray alloc] init];
        [salons addObject: [[Salon alloc] initWithName:@"Studirama" andAdress:@"Montpellier" andDate:nil]];
        
    });
    return salons;
}


-(NSArray *)getListeSalonsNotMutable
{
    NSMutableArray *salons = [self getListeSalons];
    
    return [[NSArray alloc] initWithArray:salons];
}*/

-(BOOL)addSalon:(Salon *)_salon
{
    NSMutableArray *salons = [Facade getInstance]->listSalon;
    NSUInteger size = [salons count];
    
    [salons addObject:_salon];
    
    return([salons count] > size);
}

-(BOOL)removeSalon:(Salon*)_salon
{
    NSMutableArray *salons = [Facade getInstance]->listSalon;
    NSUInteger size = [salons count];
    
    [salons removeObject:_salon];
    
    return([salons count] < size);
}

-(BOOL)removeSalonAtIndex:(NSUInteger)index
{
    NSMutableArray *salons = [Facade getInstance]->listSalon;
    NSUInteger size = [salons count];
    
    [salons removeObjectAtIndex:index];
    
    return([salons count] < size);
}

-(NSUInteger) countListSalon
{
    return [[Facade getInstance]->listSalon count];
}

/*
 *  Documents
 *

-(NSMutableArray *)getListDocuments
{
    NSMutableArray *documents = [Facade getInstance]->listDocument;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        documents = [[NSMutableArray alloc] init];
        [documents addObject: [[Document alloc] initWithName:@"Plaquette IG" andUrl:@"https://www.google.com"]];
        
    });
    return documents;
}

-(NSArray *)getListeDocumentsNotMutable
{
    NSMutableArray *documents = [self getListeDocuments];
    
    return [[NSArray alloc] initWithArray:documents];
}*/

-(BOOL)addDocument:(Document *)_document
{
    NSMutableArray *documents = [Facade getInstance]->listDocument;
    NSUInteger size = [documents count];
    
    [documents addObject:_document];
    
    Document *tmp;
    for(tmp in [Facade getInstance].listDocument)
    {
        NSLog(@"%@", tmp.url);
    }
    
    return([documents count] > size);
}

-(BOOL)removeDocument:(Document*)_document
{
    NSMutableArray *documents = [Facade getInstance]->listDocument;
    NSUInteger size = [documents count];
    
    [documents removeObject:_document];
    
    return([documents count] < size);
}

-(BOOL)removeDocumentAtIndex:(NSUInteger)index
{
    NSMutableArray *documents = [Facade getInstance]->listDocument;
    NSUInteger size = [documents count];
    
    [documents removeObjectAtIndex:index];
    
    return([documents count] < size);
}

-(NSUInteger) countListDocument
{
    return [[Facade getInstance]->listDocument count];
}

-(BOOL) addField:(Field*)_field
{
    NSMutableArray *fields = [Facade getInstance]->listField;
    NSUInteger size = [fields count];
    
    [fields addObject:_field];
    
    return([fields count] > size);
}

-(BOOL) removeField:(Field*)_field
{
    NSMutableArray *fields = [Facade getInstance]->listField;
    NSUInteger size = [fields count];
    
    [fields removeObject:_field];
    
    return([fields count] < size);
}

-(NSUInteger) countListField
{
    return [[Facade getInstance]->listField count];
}



@end
