//
//  NSOperationQueue+NSPCancelOperations.m
//  CCMA
//
//  Created by Maximilian Christ on 13/11/13.
//  Copyright (c) 2013 Boinx Software. All rights reserved.
//

#import "NSOperationQueue+NSPCancelOperations.h"

@implementation NSOperationQueue (NSPCancelOperations)

- (void)cancelOperationsBelowPriority:(NSOperationQueuePriority)priority
{
	NSArray *operations = [self.operations copy];
	
	for(NSOperation *operation in operations)
	{
		if(operation.queuePriority < priority)
		{
			[operation cancel];
		}
	}
}

@end
