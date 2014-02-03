#import "NSMutableAttributedString+NSPString.h"

@implementation NSMutableAttributedString (NSPString)

- (void)insertString:(NSString *)string atIndex:(NSUInteger)loc
{
	NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string];
	[self insertAttributedString:attributedString atIndex:loc];
}

- (void)appendString:(NSString *)string
{
	NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string];
	[self appendAttributedString:attributedString];
}

- (void)setString:(NSString *)string
{
	NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string];
	[self setAttributedString:attributedString];
}

@end
