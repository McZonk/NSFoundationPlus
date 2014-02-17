#import <Foundation/Foundation.h>

@interface NSFileManager (NSPURLForDirectoryInDomain)

/**
 * @return the first object of URLsForDirectory:inDomain:
 */
- (NSURL *)URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain;

@end
