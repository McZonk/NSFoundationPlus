//
//  NSPReachability.m
//  Plus
//
//  Created by Maximilian Christ on 04.01.2011.
//  Copyright (c) 2013 mczonk. All rights reserved.
//

#import "NSPReachability.h"

#import <SystemConfiguration/SystemConfiguration.h>

#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>


NSString * const NSPReachabilityDidChangeNotification = @"NSPReachabiltyDidChange";


static void ReachabilityCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags flags, void *info)
{
	@autoreleasepool
	{
		NSPReachability *reachability = (__bridge NSPReachability *)info;
		
		[NSNotificationCenter.defaultCenter postNotificationName:NSPReachabilityDidChangeNotification object:reachability];
	}
}


@interface NSPReachability ()
{
	SCNetworkReachabilityRef reachability;
}

@property (nonatomic, assign) BOOL localWifi;

@end


@implementation NSPReachability

+ (NSString *)descriptionForStatus:(NSPReachabilityStatus)status
{
	switch(status) {
		case NSPReachabilityStatusNotReachable:
			return @"Not Reachable";
			
		case NSPReachabilityStatusViaWiFi:
			return @"WiFi";
			
		case NSPReachabilityStatusViaWWAN:
			return @"WWAN";
	}
	
	return nil;
}

- (instancetype)initWithHostName:(NSString *)hostName
{
	self = [super init];
	if(self != nil)
	{
		reachability = SCNetworkReachabilityCreateWithName(NULL, hostName.UTF8String);
		if(reachability == NULL)
		{
			return nil;
		}
		
		[self beginNotifications];
	}
	return self;
}

- (instancetype)initWithIPAddress:(NSString *)ipAddress port:(NSNumber *)port
{
	struct sockaddr_in address;
	bzero(&address, sizeof(address));
	address.sin_len = sizeof(address);
	address.sin_family = AF_INET;
	address.sin_port = htons(port.intValue);
	address.sin_addr.s_addr = inet_addr([ipAddress cStringUsingEncoding:NSASCIIStringEncoding]);

	self = [self initWithAddress:(const struct sockaddr *)&address];
	if(self != nil)
	{
		
	}
	return self;
}

- (instancetype)initForInternetConnection
{
	struct sockaddr_in address;
	bzero(&address, sizeof(address));
	address.sin_len = sizeof(address);
	address.sin_family = AF_INET;
	
	self = [self initWithAddress:(const struct sockaddr *)&address];
	if(self != nil)
	{
		
	}
	return self;
}

- (instancetype)initForLocalWiFi
{
	struct sockaddr_in address;
	bzero(&address, sizeof(address));
	address.sin_len = sizeof(address);
	address.sin_family = AF_INET;
	address.sin_addr.s_addr = htonl(IN_LINKLOCALNETNUM);
	
	self = [self initWithAddress:(const struct sockaddr *)&address];
	if(self != nil)
	{
		self.localWifi = YES;
	}
	return self;
}

- (instancetype)initWithAddress:(const struct sockaddr *)address
{
	self = [super init];
	if(self != nil)
	{
		reachability = SCNetworkReachabilityCreateWithAddress(NULL, address);
		if(reachability == NULL)
		{
			return nil;
		}

		[self beginNotifications];
	}
	return self;
}

- (void)dealloc
{
	[self stopNotifications];
	
	if(reachability != NULL)
	{
		CFRelease(reachability);
		reachability = NULL;
	}
}

- (void)beginNotifications
{
	if(reachability != NULL)
	{
		SCNetworkReachabilityContext context = {0, (__bridge void *)self, NULL, NULL, NULL};
		if(SCNetworkReachabilitySetCallback(reachability, ReachabilityCallback, &context))
		{
			SCNetworkReachabilityScheduleWithRunLoop(reachability, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
		}
	}
}

- (void)stopNotifications
{
	if(reachability != NULL)
	{
		SCNetworkReachabilityUnscheduleFromRunLoop(reachability, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
	}
}

- (NSPReachabilityStatus)localWiFiStatusForFlags:(SCNetworkReachabilityFlags)flags
{
	if((flags & kSCNetworkReachabilityFlagsReachable) != 0 && (flags & kSCNetworkReachabilityFlagsIsDirect) != 0)
	{
		return NSPReachabilityStatusViaWiFi;
	}
	
	return NSPReachabilityStatusNotReachable;
}

- (NSPReachabilityStatus)networkStatusForFlags:(SCNetworkReachabilityFlags)flags
{
	if((flags & kSCNetworkReachabilityFlagsReachable) == 0)
	{
		return NSPReachabilityStatusNotReachable;
	}
	
	NSPReachabilityStatus status = NSPReachabilityStatusNotReachable;
	
	if((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0)
	{
		// if target host is reachable and no connection is required then we'll assume (for now) that your on Wi-Fi
		status = NSPReachabilityStatusViaWiFi;
	}
	
	
	if((flags & kSCNetworkReachabilityFlagsConnectionOnDemand) != 0 || (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0)
	{
		// ... and the connection is on-demand (or on-traffic) if the calling application is using the CFSocketStream or higher APIs
		if((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0)
		{
			// ... and no [user] intervention is needed
			status = NSPReachabilityStatusViaWiFi;
		}
	}
	
#if TARGET_OS_IPHONE
	if((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0)
	{
		// ... but WWAN connections are OK if the calling application is using the CFNetwork (CFSocketStream?) APIs.
		status = NSPReachabilityStatusViaWWAN;
	}
#endif

	return status;
}

- (NSPReachabilityStatus)status
{
	NSPReachabilityStatus status = NSPReachabilityStatusNotReachable;
	
	SCNetworkReachabilityFlags flags;
	if(SCNetworkReachabilityGetFlags(reachability, &flags))
	{
		if(self.localWifi)
		{
			status = [self localWiFiStatusForFlags:flags];
		}
		else
		{
			status = [self networkStatusForFlags:flags];
		}
	}
	
	return status;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@ %p: status: %@>", self.class, self, [self.class descriptionForStatus:self.status]];
}

@end
