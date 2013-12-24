//
//  NSBundle+NSPPreferedLocalization.m
//  Plus
//
//  Created by Maximilian Christ on 5/30/12.
//  Copyright (c) 2012 mczonk.de. All rights reserved.
//

#import "NSBundle+NSPPreferedLocalization.h"

@implementation NSBundle (NSPPreferedLocalization)

- (NSString*)preferedLocalization {
	return self.preferredLocalizations.firstObject;
}

@end
