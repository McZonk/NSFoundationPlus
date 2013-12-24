//
//  NSString+NSPOSType.h
//  Plus
//
//  Created by Maximilian Christ on 5/30/12.
//  Copyright (c) 2012 mczonk.de. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSPOSType)

/**
 * Tries to convert an OSType to a readable character sequence if possible, otherwise a hex number is used.
 */
+ (id)stringWithOSType:(OSType)type;

+ (id)stringWithOSTypeNumber:(NSNumber*)number;

@end
