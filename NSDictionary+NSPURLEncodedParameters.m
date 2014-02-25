#import "NSDictionary+NSPURLEncodedParameters.h"

@implementation NSDictionary (NSPURLEncodedParameters)

+ (instancetype)dictionaryWithURLEncodedParameters:(NSString *)parameters
{
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
	
	@autoreleasepool
	{
		for(NSString *parameter in [parameters componentsSeparatedByString:@"&"])
		{
			NSRange seperator = [parameter rangeOfString:@"="];
			if(seperator.location == NSNotFound)
			{
				continue;
			}
		
			NSString *key = [[parameter substringToIndex:seperator.location] stringByRemovingPercentEncoding];
			NSString *value = [[parameter substringFromIndex:NSMaxRange(seperator)] stringByRemovingPercentEncoding];
		
			dictionary[key] = value;
		}
	}
	
	return dictionary.count > 0 ? [NSDictionary dictionaryWithDictionary:dictionary] : nil;
}

- (NSString *)URLEncodedParameterStringWithEncoding:(NSStringEncoding)encoding
{
	NSMutableString *string = [[NSMutableString alloc] init];
	
	for(id key in self)
	{
		NSString *keyString = nil;
		
		if([key isKindOfClass:NSString.class])
		{
			keyString = key;
		}
		else if([key isKindOfClass:NSNumber.class])
		{
			keyString = ((NSNumber *)key).stringValue;
		}
		else
		{
			continue;
		}
		
		id value = self[key];
		
		NSString *valueString = nil;
		
		if([value isKindOfClass:NSString.class])
		{
			valueString = value;
		}
		else if([value isKindOfClass:NSNumber.class])
		{
			valueString = ((NSNumber *)value).stringValue;
		}
		else
		{
			continue;
		}
		
		if(string.length > 0)
		{
			[string appendString:@"&"];
		}
			
		[string appendString:[key stringByAddingPercentEscapesUsingEncoding:encoding]];
		[string appendString:@"="];
		[string appendString:[valueString stringByAddingPercentEscapesUsingEncoding:encoding]];
	}
	
	return string;
}

- (NSData *)URLEncodedParameterDataWithEncoding:(NSStringEncoding)encoding
{
	return [[self URLEncodedParameterStringWithEncoding:encoding] dataUsingEncoding:encoding];
}

@end
