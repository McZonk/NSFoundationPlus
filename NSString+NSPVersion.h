//
//  NSString+NSPVersion.h
//  Plus
//
//  Created by Maximilian Christ on 5/30/12.
//  Copyright (c) 2012 mczonk.de. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSPVersion)

/**
 * @param version major * 10000 + minor * 100 + bugfix
 * @return a string with the format major.minor.bugfix
 */
+ (id)stringWithVersionNumber:(NSUInteger)version;

- (NSComparisonResult)versionCompare:(NSString*)version;

- (BOOL)versionLessThan:(NSString*)version;
- (BOOL)versionGreaterThan:(NSString*)version;
- (BOOL)versionEqualsOrLessThan:(NSString*)version;
- (BOOL)versionEqualsOrGreaterThan:(NSString*)version;

@end
