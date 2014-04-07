//
//  ListeDocument.m
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "ListeDocument.h"

@implementation ListeDocument

@synthesize listDocument;

+(ListeDocument*)getInstance
{
    static ListeDocument* instance=nil;
    
    if(instance==nil)
    {
        instance=[[ListeDocument alloc] init];
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

-(BOOL)addDocument:(Document *)_document
{
    NSUInteger size = [listDocument count];
    
    [listDocument addObject:_document];
    
    [self saveItSelf];
    [self notifyObservers];
    
    return([listDocument count] > size);
}

-(BOOL)removeDocument:(Document*)_document
{
    NSUInteger size = [listDocument count];
    
    [listDocument removeObject:_document];
    
    [self saveItSelf];
    [self notifyObservers];
    
    return([listDocument count] < size);
}

-(BOOL)removeDocumentAtIndex:(NSUInteger)index
{
    NSUInteger size = [listDocument count];
    
    [listDocument removeObjectAtIndex:index];
    
    [self saveItSelf];
    [self notifyObservers];
    
    return([listDocument count] < size);
}

-(NSUInteger) countListDocument
{
    return [listDocument count];
}

// Observable protocol function
- (void)notifyObservers
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"DocumentNotification"
     object:nil];
}

//charge depuis la mémoire
-(void)loadItSelf
{
    self.listDocument=[Persistance chargerFichier:[self getPath]];
}

//sauvegarde la liste des salons courante en mémoire
-(void)saveItSelf
{
    [Persistance saveData:self.listDocument at:[self getPath]];
}

//renvoie une chaine constante (UNIQUE) correspondant à l'endroit en mémoire dans lequel chercher la liste
-(NSString *)getPath
{
    return @"listeDocuments";
}
@end
