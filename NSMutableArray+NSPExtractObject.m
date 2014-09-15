#import "NSMutableArray+NSPExtractObject.h"

@implementation NSMutableArray (NSPExtractObject)

- (id)extractObjectAtIndex:(NSUInteger)index
{
	id object = [self objectAtIndex:index];
	[self removeObjectAtIndex:index];
	return object;
}

- (id)extractObjectsAtIndexes:(NSIndexSet *)indexes
{
	NSArray *objects = [self objectsAtIndexes:indexes];
	[self removeObjectsAtIndexes:indexes];
	return objects;
}

- (id)extractObjectsAtRange:(NSRange)range
{
	NSArray *objects = [self subarrayWithRange:range];
	[self removeObjectsInRange:range];
	return objects;
}

- (id)extractFirstObject
{
	NSUInteger count = self.count;
	if(count == 0)
	{
		return nil;
	}
	
	return [self extractObjectAtIndex:0];
}

- (id)extractLastObject
{
	NSUInteger count = self.count;
	if(count == 0)
	{
		return nil;
	}
	
	return [self extractObjectAtIndex:count - 1];
}

@end
