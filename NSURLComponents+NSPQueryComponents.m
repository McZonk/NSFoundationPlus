#import "NSURLComponents+NSPQueryComponents.h"

@implementation NSURLComponents (NSPQueryComponents)

- (NSDictionary *)queryComponents
{
	NSArray *queryItems = self.queryItems;
	
	NSMutableDictionary *queryComponents = [NSMutableDictionary dictionaryWithCapacity:queryItems.count];
	for(NSString *queryItem in queryItems)
	{
		NSRange range = [queryItem rangeOfString:@"="];
		if(range.location != NSNotFound)
		{
			NSString *key = [queryItem substringToIndex:range.location];
			NSString *value = [queryItem substringFromIndex:range.location + range.length];
			queryComponents[key] = value;
		}
	}
	return queryComponents;
}

@end
