//
//  NSURL+AppStoreSupport.m
//  Plus-iOS
//
//  Created by Maximilian Christ on 2013-02-21.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import "NSURL+AppStoreSupport.h"

static NSString* AppURLFormat = @"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@&mt=8";

static NSString* RateAppURLFormat = @"https://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@";

static NSString* GiftAppURLFormat = @"itms-appss://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/giftSongsWizard?gift=1&salableAdamId=%@&productType=C&pricingParameter=STDQ&mt=8&ign-mscache=1";


@implementation NSURL (AppStoreSupport)

+ (NSURL*)appURLWithAppID:(NSString*)appID {
	return [NSURL URLWithString:[NSString stringWithFormat:AppURLFormat, appID]];
}

+ (NSURL*)rateAppURLWithAppID:(NSString*)appID {
	return [NSURL URLWithString:[NSString stringWithFormat:RateAppURLFormat, appID]];
}

+ (NSURL*)giftAppURLWithAppID:(NSString*)appID {
	return [NSURL URLWithString:[NSString stringWithFormat:GiftAppURLFormat, appID]];
}

@end
