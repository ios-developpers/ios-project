//
//  ListeSalon.m
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "ListeSalon.h"

@implementation ListeSalon

@synthesize listSalon;
@synthesize selectedSalon;

+(ListeSalon*)getInstance
{
    static ListeSalon* instance=nil;
    
    if(instance==nil)
    {
        instance=[[ListeSalon alloc] init];
    }
    
    return instance;
}

-(id)init
{
    self = [super init];
    
    //initialise la liste des salons
    [self loadItSelf];
    
    return self;
}

-(BOOL)addSalon:(Salon *)_salon
{
    NSUInteger size = [listSalon count];
    
    [listSalon addObject:_salon];
    
    [self saveItSelf];
    [self notifyObservers];
    
    return([listSalon count] > size);
}

-(BOOL)removeSalon:(Salon*)_salon
{
    NSUInteger size = [listSalon count];
    
    [listSalon removeObject:_salon];
    
    [self saveItSelf];
    [self notifyObservers];
    
    return([listSalon count] < size);
}

-(BOOL)removeSalonAtIndex:(NSUInteger)index
{
    NSUInteger size = [listSalon count];
    
    [listSalon removeObjectAtIndex:index];
    
    [self saveItSelf];
    [self notifyObservers];
    
    return([listSalon count] < size);
}

-(NSUInteger) countListSalon
{
    return [listSalon count];
}

-(void) setSelectedSalon:(NSInteger)_selectedSalon
{
    self->selectedSalon = _selectedSalon;
}

-(NSInteger) getSelectedSalon
{
    return self->selectedSalon;
}

// Observable protocol function
- (void)notifyObservers
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"SalonNotification"
     object:nil];
}

//charge depuis la mémoire
-(void)loadItSelf
{
    self.listSalon=[Persistance chargerFichier:[self getPath]];
}

//sauvegarde la liste des salons courante en mémoire
-(void)saveItSelf
{
    [Persistance saveData:self.listSalon at:[self getPath]];
}

//renvoie une chaine constante (UNIQUE) correspondant à l'endroit en mémoire dans lequel chercher la liste
-(NSString *)getPath
{
    return @"listeSalons";
}

@end
