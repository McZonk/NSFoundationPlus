#import <Foundation/Foundation.h>

@interface NSOperationQueue (NSPCancelOperations)

- (NSUInteger)cancelOperationsWithHandler:(BOOL(^)(NSOperation *operation))handler;

- (NSUInteger)cancelOperationsBelowPriority:(NSOperationQueuePriority)priority;

@end
