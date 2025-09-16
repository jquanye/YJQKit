//
//  NSArray.h
//  YJQKitTest
//
//  Created by yjq20250224 on 2025/9/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (YJQ)
//map, filter, reduce
- (NSArray *)yjq_map:(id(^)(id obj))block;
- (NSArray *)yjq_filter:(BOOL(^)(id obj))block;
- (id)yjq_reduce:(id(^)(id obj, id current))block withInitializer:(id<NSCopying>)initializer;

//遍历数组
- (NSArray *)yjq_forEach:(void(^)(id obj))block;
@end

NS_ASSUME_NONNULL_END
