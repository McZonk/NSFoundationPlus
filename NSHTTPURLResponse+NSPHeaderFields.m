//
//  NSHTTPURLResponse+NSPHeaderFields.m
//  CCMA
//
//  Created by Maximilian Christ on 19/11/13.
//  Copyright (c) 2013 Boinx Software. All rights reserved.
//

#import "NSHTTPURLResponse+NSPHeaderFields.h"

@implementation NSHTTPURLResponse (NSPHeaderFields)

- (NSString *)contentType
{
	return self.allHeaderFields[@"Content-Type"];
}

- (NSNumber *)contentLength
{
	NSString *value = self.allHeaderFields[@"Content-Length"];
	if(value == nil)
	{
		return nil;
	}
	
	NSScanner *scanner = [NSScanner scannerWithString:value];
	
	long long length = 0;
	if(![scanner scanLongLong:&length])
	{
		return nil;
	}

	return [NSNumber numberWithLongLong:length];
}

@end
