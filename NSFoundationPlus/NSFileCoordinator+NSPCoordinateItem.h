//
//  NSFileCoordinator+CoordinateItem.h
//  Plus-iOS
//
//  Created by Maximilian Christ on 6/16/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileCoordinator (NSPCoordinateItem)

+ (BOOL)coordinateReadingItemAtURL:(NSURL*)url options:(NSFileCoordinatorReadingOptions)options error:(NSError**)error byAccessor:(void(^)(NSURL* newURL))accessor;

+ (BOOL)coordinateReadingItemAtURL:(NSURL*)url options:(NSFileCoordinatorReadingOptions)options filePresenter:(id<NSFilePresenter>)filePresenter error:(NSError**)error byAccessor:(void(^)(NSURL* newURL))accessor;


+ (BOOL)coordinateWritingItemAtURL:(NSURL*)url options:(NSFileCoordinatorWritingOptions)options error:(NSError**)error byAccessor:(void(^)(NSURL* newURL))accessor;

+ (BOOL)coordinateWritingItemAtURL:(NSURL*)url options:(NSFileCoordinatorWritingOptions)options filePresenter:(id<NSFilePresenter>)filePresenter error:(NSError**)error byAccessor:(void(^)(NSURL* newURL))accessor;


+ (BOOL)coordinateReadingItemAtURL:(NSURL*)readingURL options:(NSFileCoordinatorReadingOptions)readingOptions writingItemAtURL:(NSURL*)writingURL options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError**)error byAccessor:(void(^)(NSURL*newReadingURL, NSURL* newWritingURL))accessor;

+ (BOOL)coordinateReadingItemAtURL:(NSURL*)readingURL options:(NSFileCoordinatorReadingOptions)readingOptions writingItemAtURL:(NSURL*)writingURL options:(NSFileCoordinatorWritingOptions)writingOptions filePresenter:(id<NSFilePresenter>)filePresenter error:(NSError**)error byAccessor:(void(^)(NSURL*newReadingURL, NSURL* newWritingURL))accessor;


+ (BOOL)coordinateWritingItemAtURL:(NSURL*)url1 options:(NSFileCoordinatorWritingOptions)options1 writingItemAtURL:(NSURL*)url2 options:(NSFileCoordinatorWritingOptions)options2 error:(NSError**)error byAccessor:(void(^)(NSURL* newURL1, NSURL* newURL2))accessor;

+ (BOOL)coordinateWritingItemAtURL:(NSURL*)url1 options:(NSFileCoordinatorWritingOptions)options1 writingItemAtURL:(NSURL*)url2 options:(NSFileCoordinatorWritingOptions)options2 filePresenter:(id<NSFilePresenter>)filePresenter error:(NSError**)error byAccessor:(void(^)(NSURL* newURL1, NSURL* newURL2))accessor;

@end
