//
//  CodeData.h
//  Conference
//
//  Created by ig_2014 on 18/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Salon.h"
#import "AccueilViewController.h"

@interface Facade : NSObject
{

}

// salons
+(NSMutableArray *) getListeSalons;
+(NSArray *)getListeSalonsNotMutable;
+(BOOL) addSalon: (Salon *)salon;
+(BOOL) removeSalonAtIndex: (NSUInteger)index;
+(NSUInteger) countSalons;

// documents
+(NSMutableArray *) getListeDocuments;
+(NSMutableArray *) getListeDocumentsNotMutable;
+(BOOL) addDocument: (Document *) document;
+(BOOL) removeDocumentAtIndex: (NSUInteger)index;
+(NSUInteger) countDocuments;

@end
