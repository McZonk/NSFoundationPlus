#import <Foundation/Foundation.h>

@interface NSURLRequest (NSPHTTPHeaderValues)

- (NSNumber *)HTTPContentLength;

@end


@interface NSMutableURLRequest (NSPHTTPHeaderValues)

- (void)setHTTPContentLength:(NSNumber *)contentLength;

@end
