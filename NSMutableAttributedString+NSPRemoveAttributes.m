#import "NSMutableAttributedString+NSPRemoveAttributes.h"

@implementation NSMutableAttributedString (NSPRemoveAttributes)

- (void)removeAttributes:(NSArray *)attributes range:(NSRange)range
{
	for(NSString *attribute in attributes)
	{
		[self removeAttribute:attribute range:range];
	}
}

@end
