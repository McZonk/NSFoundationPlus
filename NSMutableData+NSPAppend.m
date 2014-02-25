#import "NSMutableData+NSPAppend.h"

@implementation NSMutableData (NSPAppend)

- (void)appendByte:(char)byte
{
	[self appendBytes:&byte length:1];
}

@end
