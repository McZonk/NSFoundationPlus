#import <Foundation/Foundation.h>

@interface NSHTTPURLResponse (NSPHeaderFields)

- (NSString *)contentType;
- (NSNumber *)contentLength;

@end
