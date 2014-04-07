//Salon.m
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import "Salon.h"
#import "Utils.h"
#import "Constants.h"

//IMPLEMENTATION
@implementation Salon

//SYNTHESIZE
@synthesize name;
@synthesize adress;
@synthesize date;
@synthesize listPool;
static NSString *const kName = @"Name";
static NSString *const kAdress = @"Adress";
static NSString *const kDate=@"date";

//METHODS
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self=[super init])) {
        NSString *pName = [aDecoder decodeObjectForKey:kName];
        NSString *pAdress = [aDecoder decodeObjectForKey:kAdress];
        NSDate *pDate=[aDecoder decodeObjectForKey:kDate];
        return [self initWithName:pName andAdress:pAdress andDate:pDate];
    }
    return self;
}

-(id) initWithName:(NSString*)_name andAdress:(NSString *)_adress andDate:(NSDate *)_date
{
    return [self initWithName:_name andAdress:_adress andDate:_date andListPool:nil];
}

-(id) initWithName:(NSString *)_name andAdress:(NSString *)_adress andDate:(NSDate *)_date andListPool:(NSMutableArray *)_listPool
{
    self = [super init];
    
    if (self)
    {
        self.name = _name;
        self.adress = _adress;
        self.date = _date;
        self->listPool = _listPool;
    }
    
    NSLog(@"%@", [Utils concatenateString:LogConstructor withString:@" Salon"]);
    
    return self;
}



-(BOOL)addPool:(Pool *)_pool
{
    NSMutableArray *pools = self->listPool;
    NSUInteger size = [pools count];
    
    [pools addObject:_pool];
    
    return([pools count] > size);
}

-(BOOL) removePool:(Pool*)_pool
{
    NSMutableArray *pools = self->listPool;
    NSUInteger size = [pools count];
    
    [pools removeObject:_pool];
    
    return([pools count] < size);
}

-(BOOL) removePoolAtIndex:(NSUInteger)index
{
    NSMutableArray *pools = self->listPool;
    NSUInteger size = [pools count];
    
    [pools removeObjectAtIndex:index];
    
    return([pools count] < size);
}

-(void) clearListPool
{
    [self->listPool removeAllObjects];
    [self->listPool finalize];
    
    self->listPool = [[NSMutableArray alloc] init];
}

-(NSUInteger) countListPool
{
    return [self->listPool count];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:name forKey:kName];
    [aCoder encodeObject:adress forKey:kAdress];
    [aCoder encodeObject:date forKey:kDate];
}

@end
