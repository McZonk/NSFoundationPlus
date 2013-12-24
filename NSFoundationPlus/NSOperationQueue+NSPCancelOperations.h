//
//  NSOperationQueue+NSPCancelOperations.h
//  CCMA
//
//  Created by Maximilian Christ on 13/11/13.
//  Copyright (c) 2013 Boinx Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperationQueue (NSPCancelOperations)

- (void)cancelOperationsBelowPriority:(NSOperationQueuePriority)priority;

@end
