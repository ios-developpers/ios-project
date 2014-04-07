//
//  Persistance.m
//  Conference
//
//  Created by ig_2014 on 07/04/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "Persistance.h"

@implementation Persistance
+(NSMutableArray*)chargerFichier:(NSString*) _cheminFichier
{
    NSString* _dataFilePath=[Persistance getDataPath:_cheminFichier];
    if([Persistance isFileAt:_cheminFichier])
    {
        return [NSKeyedUnarchiver unarchiveObjectWithFile: _dataFilePath];
    }else
    {
        return [[NSMutableArray alloc]init];
    }
}

+(BOOL)isFileAt:(NSString*) _cheminFichier
{
    NSString*  _dataFilePath=[Persistance getDataPath:_cheminFichier];
    return [[NSFileManager defaultManager] fileExistsAtPath:_dataFilePath];
}

+(NSString*)getDataPath:(NSString*) _cheminFichier
{
    NSArray * dirPaths;
    NSString *docsDir;
    
    //récupère le dossier du document
    dirPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    //normalement cette ligne ne peut pas chier
    docsDir=dirPaths[0];
    
    //on construit la chaine complète
   return [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:_cheminFichier]];
}

+(BOOL) saveData:(NSMutableArray*)contactArray at:(NSString*)_cheminFichier
{
    NSString * _dataFilePath=[Persistance getDataPath:_cheminFichier];
    
    return [NSKeyedArchiver archiveRootObject:contactArray toFile:_dataFilePath];
}

@end
