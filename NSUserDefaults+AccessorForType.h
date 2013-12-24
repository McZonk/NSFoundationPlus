//
//  NSUserDefaults+AccessorForType.h
//  Plus-iOS
//
//  Created by Maximilian Christ on 2013-02-07.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (AccessorForType)

- (id)objectForKey:(NSString*)key ofClass:(Class)cls;

- (NSDate*)dateForKey:(NSString*)key;
- (NSNumber*)numberForKey:(NSString*)key;

- (long long)longLongForKey:(NSString*)key;
- (void)setLongLong:(long long)value forKey:(NSString*)key;

@end
