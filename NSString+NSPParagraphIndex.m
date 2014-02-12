#import "NSString+NSPParagraphIndex.h"

@implementation NSString (NSPParagraphIndex)

- (NSUInteger)paragraphIndexAtIndex:(NSUInteger)index
{
	if(index >= self.length)
	{
		return NSNotFound;
	}
	
	NSRange paragraphRange = [self paragraphRangeForRange:NSMakeRange(index, 0)];
	
	__block NSUInteger paragraphNumber = 0;
	[self enumerateSubstringsInRange:NSMakeRange(0, paragraphRange.location) options:NSStringEnumerationByParagraphs usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
		paragraphNumber++;
	}];
	
	return paragraphNumber;
}

@end
