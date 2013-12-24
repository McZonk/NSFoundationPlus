//
//  NSPReachability.h
//  Plus
//
//  Created by Maximilian Christ on 04.01.2011.
//  Copyright (c) 2013 mczonk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sys/socket.h>


typedef enum NSPReachabilityStatus {
	NSPReachabilityStatusNotReachable = 0,
	NSPReachabilityStatusViaWiFi = 1,
	NSPReachabilityStatusViaWWAN = 2,
} NSPReachabilityStatus;


extern NSString * const NSPReachabilityDidChangeNotification;


@interface NSPReachability : NSObject

+ (NSString *)descriptionForStatus:(NSPReachabilityStatus)status;

- (instancetype)initWithHostName:(NSString *)hostName;
- (instancetype)initWithIPAddress:(NSString *)ipAddress port:(NSNumber *)port;

- (instancetype)initForInternetConnection;
- (instancetype)initForLocalWiFi;

- (instancetype)initWithAddress:(const struct sockaddr *)address;

- (NSPReachabilityStatus)status;

@end
