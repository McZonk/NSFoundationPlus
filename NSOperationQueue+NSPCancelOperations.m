#import "NSOperationQueue+NSPCancelOperations.h"

@implementation NSOperationQueue (NSPCancelOperations)

- (NSUInteger)cancelOperationsWithHandler:(BOOL(^)(NSOperation *operation))handler
{
	if(handler == nil)
	{
		return 0;
	}
	
	NSUInteger cancelledOperations = 0;
	
	NSArray *operations = [self.operations copy];
	for(NSOperation *operation in operations)
	{
		if(handler(operation))
		{
			[operation cancel];
			cancelledOperations += 1;
		}
	}
	
	return cancelledOperations;
}

- (NSUInteger)cancelOperationsBelowPriority:(NSOperationQueuePriority)priority
{
	return [self cancelOperationsWithHandler:^BOOL(NSOperation *operation) {
		return operation.queuePriority < priority;
	}];
}

@end
