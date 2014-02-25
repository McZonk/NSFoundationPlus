#import <Foundation/Foundation.h>

@interface NSDictionary (NSPURLEncodedParameters)

+ (instancetype)dictionaryWithURLEncodedParameters:(NSString *)parameters;

- (NSString *)URLEncodedParameterStringWithEncoding:(NSStringEncoding)encoding;
- (NSData *)URLEncodedParameterDataWithEncoding:(NSStringEncoding)encoding;

@end
