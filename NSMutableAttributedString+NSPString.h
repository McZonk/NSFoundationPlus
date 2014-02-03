#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (NSPString)

- (void)insertString:(NSString *)string atIndex:(NSUInteger)loc;
- (void)appendString:(NSString *)string;
- (void)setString:(NSString *)string;

@end
