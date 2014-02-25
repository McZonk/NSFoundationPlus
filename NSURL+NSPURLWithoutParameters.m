#import "NSURL+NSPURLWithoutParameters.h"

@implementation NSURL (NSPURLWithoutParameters)

- (NSURL *)URLByDeletingParameters
{
	return [[self.class alloc] initWithScheme:self.scheme host:self.host path:self.path];
}

- (NSDictionary *)queryObjects
{
	NSMutableDictionary *queryDictionary = [NSMutableDictionary dictionary];
	
	NSString *query = self.query;
	for(NSString *components in [query componentsSeparatedByString:@"&"])
	{
		NSRange range = [components rangeOfString:@"="];
		if(range.location == NSNotFound)
		{
			continue;
		}
		
		NSString *key = [[components substringToIndex:range.location] stringByRemovingPercentEncoding];
		NSString *value = [[components substringFromIndex:NSMaxRange(range)] stringByRemovingPercentEncoding];
		
		queryDictionary[key] = value;
	}
	
	return queryDictionary.count > 0 ? [NSDictionary dictionaryWithDictionary:queryDictionary] : nil;
}

@end
