#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (NSPRemoveAttributes)

- (void)removeAttributes:(NSArray *)attributes range:(NSRange)range;

@end
