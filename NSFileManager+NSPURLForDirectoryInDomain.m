#import "NSFileManager+NSPURLForDirectoryInDomain.h"

@implementation NSFileManager (NSPURLForDirectoryInDomain)

- (NSURL *)URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain
{
	return [self URLsForDirectory:directory inDomains:domain].firstObject;
}

@end
