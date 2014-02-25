//
//  NSURL+AppStoreSupport.h
//  Plus-iOS
//
//  Created by Maximilian Christ on 2013-02-21.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (NSPAppStoreSupport)

+ (NSURL*)appURLWithAppID:(NSString*)appID;

+ (NSURL*)rateAppURLWithAppID:(NSString*)appID;

+ (NSURL*)giftAppURLWithAppID:(NSString*)appID;

@end
