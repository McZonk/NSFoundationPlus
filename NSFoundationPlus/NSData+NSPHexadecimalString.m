//
//  NSData+NSPHexadecimalString.m
//  Plus-iOS
//
//  Created by Maximilian Christ on 2013-02-08.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import "NSData+NSPHexadecimalString.h"

@implementation NSData (NSPHexadecimalString)

- (NSString*)hexadecimalString {
	const unsigned char* bytes = self.bytes;

	NSInteger length = self.length;

	NSMutableString* string = [NSMutableString stringWithCapacity:length];

	while(length >= 4) {
		const unsigned int value = OSSwapHostToBigInt32(*(unsigned int*)bytes);
		[string appendFormat:@"%08X", value];
		bytes += 4;
		length -= 4;
	}
	while(length >= 1) {
		const unsigned char value = *bytes;
		[string appendFormat:@"%02X", value];
		bytes += 1;
		length -= 1;
	}
	
	return string;
}

@end
