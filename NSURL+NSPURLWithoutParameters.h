#import <Foundation/Foundation.h>

@interface NSURL (NSPURLWithoutParameters)

- (NSURL *)URLByDeletingParameters;

- (NSDictionary *)queryObjects;

@end
