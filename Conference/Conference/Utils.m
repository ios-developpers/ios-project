//
//  Utils.m
//  Conference
//
//  Created by ig_2014 on 05/03/2014.
//  Copyright (c) 2014 ios-developpers. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(NSString *) concatenateString: (NSString *)string1 withString: (NSString *)string2
{
    return [[NSArray arrayWithObjects:string1, string2, nil] componentsJoinedByString:@""];
}

@end
