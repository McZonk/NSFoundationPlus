//
//  NSFileCoordinator+CoordinateItem.m
//  Plus-iOS
//
//  Created by Maximilian Christ on 6/16/13.
//  Copyright (c) 2013 mczonk.de. All rights reserved.
//

#import "NSFileCoordinator+NSPCoordinateItem.h"

@implementation NSFileCoordinator (NSPCoordinateItem)

+ (BOOL)coordinateReadingItemAtURL:(NSURL*)url options:(NSFileCoordinatorReadingOptions)options error:(NSError**)outError byAccessor:(void(^)(NSURL* newURL))accessor
{
	NSError *error = nil;

	[self coordinateReadingItemAtURL:url options:options filePresenter:nil error:&error byAccessor:accessor];
	
	if(outError)
	{
		*outError = error;
	}
	
	return error == nil;
}

+ (BOOL)coordinateReadingItemAtURL:(NSURL*)url options:(NSFileCoordinatorReadingOptions)options filePresenter:(id<NSFilePresenter>)filePresenter error:(NSError**)outError byAccessor:(void(^)(NSURL* newURL))accessor
{
	NSError *error = nil;

	NSFileCoordinator* coordinator = [[self alloc] initWithFilePresenter:filePresenter];
	[coordinator coordinateReadingItemAtURL:url options:options error:&error byAccessor:accessor];
	
	if(outError)
	{
		*outError = error;
	}
	
	return error == nil;
}


+ (BOOL)coordinateWritingItemAtURL:(NSURL*)url options:(NSFileCoordinatorWritingOptions)options error:(NSError**)outError byAccessor:(void(^)(NSURL* newURL))accessor
{
	NSError *error = nil;

	[self coordinateWritingItemAtURL:url options:options filePresenter:nil error:&error byAccessor:accessor];
	
	if(outError)
	{
		*outError = error;
	}
	
	return error == nil;
}

+ (BOOL)coordinateWritingItemAtURL:(NSURL*)url options:(NSFileCoordinatorWritingOptions)options filePresenter:(id<NSFilePresenter>)filePresenter error:(NSError**)outError byAccessor:(void(^)(NSURL* newURL))accessor
{
	NSError *error = nil;

	NSFileCoordinator* coordinator = [[self alloc] initWithFilePresenter:filePresenter];
	[coordinator coordinateWritingItemAtURL:url options:options error:&error byAccessor:accessor];
	
	if(outError)
	{
		*outError = error;
	}
	
	return error == nil;
}


+ (BOOL)coordinateReadingItemAtURL:(NSURL*)readingURL options:(NSFileCoordinatorReadingOptions)readingOptions writingItemAtURL:(NSURL*)writingURL options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError**)outError byAccessor:(void(^)(NSURL*newReadingURL, NSURL* newWritingURL))accessor
{
	NSError *error = nil;

	[self coordinateReadingItemAtURL:readingURL options:readingOptions writingItemAtURL:writingURL options:writingOptions filePresenter:nil error:&error byAccessor:accessor];

	if(outError)
	{
		*outError = error;
	}
	
	return error == nil;
}

+ (BOOL)coordinateReadingItemAtURL:(NSURL*)readingURL options:(NSFileCoordinatorReadingOptions)readingOptions writingItemAtURL:(NSURL*)writingURL options:(NSFileCoordinatorWritingOptions)writingOptions filePresenter:(id<NSFilePresenter>)filePresenter error:(NSError**)outError byAccessor:(void(^)(NSURL*newReadingURL, NSURL* newWritingURL))accessor
{
	NSError *error = nil;

	NSFileCoordinator* coordinator = [[self alloc] initWithFilePresenter:filePresenter];
	[coordinator coordinateReadingItemAtURL:readingURL options:readingOptions writingItemAtURL:writingURL options:writingOptions error:&error byAccessor:accessor];
	
	if(outError)
	{
		*outError = error;
	}
	
	return error == nil;
}


+ (BOOL)coordinateWritingItemAtURL:(NSURL*)url1 options:(NSFileCoordinatorWritingOptions)options1 writingItemAtURL:(NSURL*)url2 options:(NSFileCoordinatorWritingOptions)options2 error:(NSError**)outError byAccessor:(void(^)(NSURL* newURL1, NSURL* newURL2))accessor
{
	NSError *error = nil;

	[self coordinateWritingItemAtURL:url1 options:options1 writingItemAtURL:url2 options:options2 filePresenter:nil error:&error byAccessor:accessor];
	
	if(outError)
	{
		*outError = error;
	}
	
	return error == nil;
}

+ (BOOL)coordinateWritingItemAtURL:(NSURL*)url1 options:(NSFileCoordinatorWritingOptions)options1 writingItemAtURL:(NSURL*)url2 options:(NSFileCoordinatorWritingOptions)options2 filePresenter:(id<NSFilePresenter>)filePresenter error:(NSError**)outError byAccessor:(void(^)(NSURL* newURL1, NSURL* newURL2))accessor
{
	NSError *error = nil;

	NSFileCoordinator* coordinator = [[self alloc] initWithFilePresenter:filePresenter];
	[coordinator coordinateWritingItemAtURL:url1 options:options1 writingItemAtURL:url2 options:options2 error:&error byAccessor:accessor];
	
	if(outError)
	{
		*outError = error;
	}
	
	return error == nil;
}

@end
