//Facade.h
//Conference
//Created by LANGLES PERE PONT
//2014 Polytech

//IMPORT
#import <Foundation/Foundation.h>
#import "Salon.h"
#import "AccueilViewController.h"

//INTERFACE
@interface Facade : NSObject

//PROPERTIES
@property(nonatomic,strong)NSMutableArray* listDocument;
@property(nonatomic,strong)NSMutableArray* listSalon;
@property(nonatomic,strong)NSMutableArray* listField;

//METHODS
    //-(id) init;
//-(id) initWithPropertyList;

//SINGLETON

+(Facade*)getInstance;
-(id) init;

//SALON
-(BOOL) addSalon:(Salon*)_salon;
-(BOOL) removeSalon:(Salon*)_salon;
-(NSUInteger) countListSalon;

//DOCUMENT
-(BOOL) addDocument:(Document*)_document;
-(BOOL) removeDocument:(Document*)_document;
-(NSUInteger) countListDocument;

//FIELD
-(BOOL) addField:(Field*)_field;
-(BOOL) removeField:(Field*)_field;
-(NSUInteger) countListField;

@end
