//Salon.h
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import <Foundation/Foundation.h>
#import "Pool.h"
#import "ListeSalon.h"

//INTERFACE
@interface Salon : NSObject <NSCoding>


//PROPERTIES
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *adress;
@property(nonatomic,copy)NSDate *date;
@property(nonatomic,strong)NSMutableArray *listPool;

//METHODS
-(id)initWithCoder:(NSCoder *)aDecoder;
-(id) initWithName:(NSString*)_name andAdress:(NSString *)_adress andDate:(NSDate *)_date;
-(id) initWithName:(NSString*)_name andAdress:(NSString *)_adress andDate:(NSDate *)_date andListPool:(NSMutableArray*)_listPool;

-(BOOL) addPool:(Pool*)_pool;
-(BOOL) removePool:(Pool*)_pool;
-(BOOL) removePoolAtIndex:(NSUInteger)index;
-(void) clearListPool;
-(NSUInteger) countListPool;

-(void)encodeWithCoder:(NSCoder *)aCoder;
@end
