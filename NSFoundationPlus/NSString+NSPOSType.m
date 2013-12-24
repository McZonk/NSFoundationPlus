//
//  NSString+NSPOSType.m
//  Plus
//
//  Created by Maximilian Christ on 5/30/12.
//  Copyright (c) 2012 mczonk.de. All rights reserved.
//

#import "NSString+NSPOSType.h"

@implementation NSString (NSPOSType)

+ (id)stringWithOSType:(OSType)type {
	char text[4] = { type >> 24, type >> 16, type >> 8, type >> 0 };

	for(unsigned int i = 0; i < 4; i++) {
		if(!isalnum(text[i]) && text[i] != ' ') {
			return [NSString stringWithFormat:@"0x%08x", (unsigned int)type];
		}
	}
	
	return [NSString stringWithFormat:@"%c%c%c%c", text[0], text[1], text[2], text[3]];	
}

+ (id)stringWithOSTypeNumber:(NSNumber*)number {
	return [self stringWithOSType:(OSType)number.integerValue];
}

@end
