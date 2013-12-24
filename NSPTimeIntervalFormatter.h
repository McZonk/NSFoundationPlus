//
//  NSPTimeIntervalFormatter.h
//  NSPTimeIntervalFormatter
//
//  Created by Maximilian Christ on 2012-11-20.
//  Copyright (c) 2012 mczonk.de. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * use h/H for hours
 * use m/M for minutes
 * use s/S for seconds
 * use F for fraction
 * use 'string' to print string
 * lower case letters will be optional
 * if a whole format is optional and the value is 0 the part till the next format is skipped
 * if in two digits for a value it will be fitted to the correct range (MM = max 59 minutes)
 * fractionBase can be used for framerates, int(fraction * fractionBase)
 *
 * Example:
 * format = hh:MM:SS
 *    40 => 00:40
 *    65 => 01:05
 *   605 => 10:05
 *  3665 => 1:01:05
 *
 * format = mmM:SS
 *    40 => 0:40
 *    65 => 1:05
 *   605 => 10:05
 *  3665 => 61:05
 *
 * format = SS.FF
 * fractionBase = 30
 *   0.0 => 0.00
 *   1.0 => 1.00
 *   0.5 => 0.15
 *
 * format = h'h' m'min' s'sec'
 *     0 =>
 *     1 => 1sec
 *    61 => 1min 1sec
 *  3661 => 1h 1min 1sec
 *    60 => 1min
 *  3000 => 1h
 *
 * TODO: escape ' somehow
 */

@interface NSPTimeIntervalFormatter : NSFormatter

- (NSString*)stringFromTimeInterval:(NSTimeInterval)timeInterval;

@property (nonatomic, copy) NSString* format;
@property (nonatomic, assign) NSUInteger fractionBase;

@end
