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
static NSString *const kName = @"nameSalon";
static NSString *const kAdress = @"adressSalon";
static NSString *const kDate=@"date";
static NSString *const kListPool=@"listPoolSalon";

//METHODS
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self=[super init])) {
        NSString *pName = [aDecoder decodeObjectForKey:kName];
        NSString *pAdress = [aDecoder decodeObjectForKey:kAdress];
        NSDate *pDate=[aDecoder decodeObjectForKey:kDate];
        NSMutableArray *pListPool=[aDecoder decodeObjectForKey:kListPool];
        return [self initWithName:pName andAdress:pAdress andDate:pDate andListPool:pListPool];
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
        if(_listPool==nil)
        {
            self.listPool=[[NSMutableArray alloc]init];
        }else
        {
            self.listPool = _listPool;
        }
    }
    
    NSLog(@"%@", [Utils concatenateString:LogConstructor withString:@" Salon"]);
    
    return self;
}



-(BOOL)addPool:(Pool *)_pool
{
    NSUInteger size = [listPool count];
    
    [listPool addObject:_pool];
    [self notifyObservers];
    
    [[ListeSalon getInstance] saveItSelf];
    
    return([listPool count] > size);
}

-(BOOL) removePool:(Pool*)_pool
{
    NSUInteger size = [listPool count];
    
    [listPool removeObject:_pool];
    [[ListeSalon getInstance] saveItSelf];
    [self notifyObservers];
    return([listPool count] < size);
}

-(BOOL) removePoolAtIndex:(NSUInteger)index
{
    NSUInteger size = [listPool count];
    
    [listPool removeObjectAtIndex:index];
    
    [[ListeSalon getInstance] saveItSelf];
    
    [self notifyObservers];
    
    return([listPool count] < size);
}

-(void) clearListPool
{
    [self->listPool removeAllObjects];
    [self->listPool finalize];
    
    self->listPool = [[NSMutableArray alloc] init];
}

-(NSUInteger) countListPool
{
    return [listPool count];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:name forKey:kName];
    [aCoder encodeObject:adress forKey:kAdress];
    [aCoder encodeObject:date forKey:kDate];
    [aCoder encodeObject:listPool forKey:kListPool];
}

// Observable protocol function
- (void)notifyObservers
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"SalonPoolNotification"
     object:nil];
}

@end
