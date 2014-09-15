#import <Foundation/Foundation.h>

@interface NSMutableArray (NSPExtractObject)

/**
 * Removes and returns the object at index.
 * @param index index must be valid
 * @return the removed object
 */
- (id)extractObjectAtIndex:(NSUInteger)index;

/**
 * Removes and returns the objects at indexes.
 * @param indexes indexes must be valid
 * @return the removed objects
 */
- (id)extractObjectsAtIndexes:(NSIndexSet *)indexes;

/**
 * Removes and returns the objects at range.
 * @param range range must be valid
 * @return the removed objects
 */
- (NSArray *)extractObjectsAtRange:(NSRange)range;

/**
 * Removes and returns the first object.
 * @return the removed object or nil
 */
- (id)extractFirstObject;

/**
 * Removes and returns the last object.
 * @return the removed object or nil
 */
- (id)extractLastObject;

@end
