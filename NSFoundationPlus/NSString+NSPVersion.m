//
//  NSString+NSPVersion.m
//  Plus
//
//  Created by Maximilian Christ on 5/30/12.
//  Copyright (c) 2012 mczonk.de. All rights reserved.
//

#import "NSString+NSPVersion.h"

static NSUInteger MajorVersion(NSUInteger version)
{
	return version / 10000;
}

static NSUInteger MinorVersion(NSUInteger version)
{
	return (version / 100) % 100;
}

static NSUInteger BugfixVersion(NSUInteger version)
{
	return version % 100;
}

@implementation NSString (NSPVersion)

+ (id)stringWithVersionNumber:(NSUInteger)version
{
	NSUInteger major = MajorVersion(version);
	NSUInteger minor = MinorVersion(version);
	NSUInteger bugfix = BugfixVersion(version);
	
	if(bugfix > 0)
	{
		return [self stringWithFormat:@"%u.%u.%u", major, minor, bugfix];
	}
	else
	{
		return [self stringWithFormat:@"%u.%u", major, minor];
	}
}

- (NSComparisonResult)versionCompare:(NSString*)version
{
	return [self compare:version options:NSNumericSearch];
}

- (BOOL)versionLessThan:(NSString*)version
{
	return [self versionCompare:version] == NSOrderedAscending;
}

- (BOOL)versionGreaterThan:(NSString*)version
{
	return [self versionCompare:version] == NSOrderedDescending;
}

- (BOOL)versionEqualsOrLessThan:(NSString*)version
{
	return [self versionCompare:version] != NSOrderedDescending;
}

- (BOOL)versionEqualsOrGreaterThan:(NSString*)version
{
	return [self versionCompare:version] != NSOrderedAscending;
}

@end
