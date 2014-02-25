#import "NSURLRequest+NSPHTTPHeaderValues.h"

#import "NSPHTTPConstants.h"


@implementation NSURLRequest (NSPHTTPHeaderValues)

- (NSNumber *)HTTPContentLength
{
	NSString *value = [self valueForHTTPHeaderField:NSPHTTPHeaderContentLength];
	if(value == nil)
	{
		return nil;
	}
	
	return @([value longLongValue]);
}

@end


@implementation NSMutableURLRequest (NSPHTTPHeaderValues)

- (void)setHTTPContentLength:(NSNumber *)contentLength
{
	if(contentLength != nil)
	{
		NSString *value = contentLength.stringValue;
		[self setValue:value forHTTPHeaderField:NSPHTTPHeaderContentLength];
	}
	else
	{
		[self setValue:nil forHTTPHeaderField:NSPHTTPHeaderContentLength];
	}
}

@end
