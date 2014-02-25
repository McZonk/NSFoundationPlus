#import "NSHTTPURLResponse+NSPHeaderFields.h"

#import "NSPHTTPConstants.h"

@implementation NSHTTPURLResponse (NSPHeaderFields)

- (NSString *)contentType
{
	return self.allHeaderFields[NSPHTTPHeaderContentType];
}

- (NSNumber *)contentLength
{
	NSString *value = self.allHeaderFields[NSPHTTPHeaderContentLength];
	if(value == nil)
	{
		return nil;
	}
	
	NSScanner *scanner = [NSScanner scannerWithString:value];
	
	long long length = 0;
	if(![scanner scanLongLong:&length])
	{
		return nil;
	}

	return [NSNumber numberWithLongLong:length];
}

@end
