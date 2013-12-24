//
//  NSPTimeIntervalFormatter.m
//  NSPTimeIntervalFormatter
//
//  Created by Maximilian Christ on 2012-11-20.
//  Copyright (c) 2012 mczonk.de. All rights reserved.
//

#import "NSPTimeIntervalFormatter.h"

static const unichar TimeIntervalTokenTypeSecond = 'S';
static const unichar TimeIntervalTokenTypeMinute = 'M';
static const unichar TimeIntervalTokenTypeHour = 'H';
static const unichar TimeIntervalTokenTypeFraction = 'F';

static const unichar TimeIntervalTokenTypeString = '\'';

static NSString* FormattedInteger(NSTimeInterval value, NSUInteger length, NSUInteger maxLength, const double divisor, const double modulo) {
	value = fabs(value) / divisor;
	
	if(length == 0 && value < 1.0) {
		return nil;
	}
	
	if(maxLength <= 2) {
		if(value >= modulo) {
			value = fmod(value, modulo);
			length = maxLength;
		}
	}
	
	NSString* format = [NSString stringWithFormat:@"%%0%dd", (int)length];
	return [NSString stringWithFormat:format, (int)value];
}

static NSString* FormattedFraction(const NSTimeInterval t, const NSUInteger length) {
	NSTimeInterval fraction = fmod(t, 1.0);

	NSString* format = [NSString stringWithFormat:@"%%0%d.0f", (int)length];
	return [NSString stringWithFormat:format, fraction * pow(10, length)];
}

static NSString* FormattedFractionWithBase(const NSTimeInterval t, const NSUInteger length, const NSUInteger base) {
	NSTimeInterval fraction = fmod(t, 1.0);
	fraction *= base;
	
	NSString* format = [NSString stringWithFormat:@"%%0%dd", (int)length];
	return [NSString stringWithFormat:format, (int)fraction];
}

static BOOL IsFormatToken(const unichar token) {
	switch(toupper(token)) {
		case TimeIntervalTokenTypeSecond:
		case TimeIntervalTokenTypeMinute:
		case TimeIntervalTokenTypeHour:
		case TimeIntervalTokenTypeFraction:
			return YES;
		default:
			return NO;
	}
}

static NSString* FormattedToken(unichar token, const NSUInteger length, const NSUInteger maxLength, NSTimeInterval t, NSUInteger fracbase) {
	switch(toupper(token)) {
		case TimeIntervalTokenTypeSecond:
			return FormattedInteger(t, length, maxLength, 1.0, 60.0);
		case TimeIntervalTokenTypeMinute:
			return FormattedInteger(t, length, maxLength, 60.0, 60.0);
		case TimeIntervalTokenTypeHour:
			return FormattedInteger(t, length, maxLength, 60.0 * 60.0, 24.0);
		case TimeIntervalTokenTypeFraction :
			if(fracbase == 0) {
				return FormattedFraction(t, length);
			} else {
				return FormattedFractionWithBase(t, length, fracbase);
			}
		default:
			return nil;
	}
	return nil;
}



@interface NSPTimeIntervalFormatter ()

@end


@implementation NSPTimeIntervalFormatter

- (id)init {
	self = [super init];
	if(self != nil) {
		self.format = @"hh:MM:SS";
		self.fractionBase = 0;
	}
	return self;
}

- (void)dealloc {
	self.format = nil;
	
#if !__has_feature(objc_arc)
	[super dealloc];
#endif
}

- (NSString*)stringForObjectValue:(id)obj {
	NSMutableString* value = [NSMutableString stringWithCapacity:12];

	@autoreleasepool {
		const NSTimeInterval t = [obj doubleValue];
	
		unichar token = 0;
		NSUInteger tokenMaxLength = 0;
		NSUInteger tokenLength = 0;
		
		NSString* format = self.format;
		NSUInteger fractionBase = self.fractionBase;
		BOOL skipNoneToken = NO;
		BOOL inString = NO;
	
		const NSUInteger formatLength = format.length;
		for(NSUInteger i = 0; i < formatLength; ++i) {
			unichar nextToken = [format characterAtIndex:i];

			if(token == toupper(nextToken)) {
				tokenMaxLength += 1;
				tokenLength += isupper(nextToken) ? 1 : 0;
				continue;
			}

			if(token) {
				NSString* formattedToken = FormattedToken(token, tokenLength, tokenMaxLength, t, fractionBase);
				if(formattedToken) {
					[value appendString:formattedToken];
				} else {
					skipNoneToken = YES;
				}
			}

			if(inString || !IsFormatToken(nextToken)) {
				if(nextToken == TimeIntervalTokenTypeString) {
					inString = !inString;
					token = 0;
					continue;
				}
				
				if(!skipNoneToken) {
					[value appendFormat:@"%C", nextToken];
				}
				token = 0;
				continue;
			}
		
			token = toupper(nextToken);
			tokenMaxLength = 1;
			tokenLength = isupper(nextToken) ? 1 : 0;
			skipNoneToken = NO;
		}
	
		if(token) {
			NSString* formattedToken = FormattedToken(token, tokenLength, tokenMaxLength, t, fractionBase);
			if(formattedToken) {
				[value appendString:formattedToken];
			}
		}
	}
	
	return value;
}

- (BOOL)getObjectValue:(out id *)obj forString:(NSString *)string errorDescription:(out NSString **)error {
	return NO;
}

- (NSString*)stringFromTimeInterval:(NSTimeInterval)timeInterval {
	return [self stringForObjectValue:@(timeInterval)];
}

@end
