//
//  NSHTTPURLResponse+NSPHeaderFields.h
//  CCMA
//
//  Created by Maximilian Christ on 19/11/13.
//  Copyright (c) 2013 Boinx Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSHTTPURLResponse (NSPHeaderFields)

- (NSString *)contentType;
- (NSNumber *)contentLength;

@end
