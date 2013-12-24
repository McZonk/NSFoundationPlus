//
//  NSUserDefaults+AccessorForType.m
//  Plus-iOS
//
//  Created by Maximilian Christ on 2013-02-07.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import "NSUserDefaults+AccessorForType.h"

@implementation NSUserDefaults (AccessorForType)

- (id)objectForKey:(NSString*)key ofClass:(Class)cls {
	id object = [self objectForKey:key];
	if(![object isKindOfClass:cls]) {
		return nil;
	}
	return object;
}

- (NSDate*)dateForKey:(NSString*)key {
	return [self objectForKey:key ofClass:NSDate.class];
}

- (NSNumber*)numberForKey:(NSString*)key {
	return [self objectForKey:key ofClass:NSNumber.class];
}

- (long long)longLongForKey:(NSString*)key {
	return [self numberForKey:key].longLongValue;
}

- (void)setLongLong:(long long)value forKey:(NSString*)key {
	[self setObject:@(value) forKey:key];
}

@end
