//
//  Persistance.h
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Persistance : NSObject

+(NSMutableArray*)chargerFichier:(NSString*) _cheminFichier;

+(BOOL)isFileAt:(NSString*) _cheminFichier;

+(NSString*)getDataPath:(NSString*) _cheminFichier;

+(void) saveData:(NSMutableArray*)contactArray at:(NSString*)_cheminFichier;

@end
