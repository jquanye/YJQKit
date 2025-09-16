//
//  NSArray.m
//  YJQKitTest
//
//  Created by yjq20250224 on 2025/9/16.
//

#import "NSArray+YJQ.h"

@implementation NSArray(YJQ)

- (nonnull NSArray *)yjq_filter:(nonnull BOOL (^)(id  _Nonnull __strong))block {
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (block(obj)) [ret addObject:obj];
    }];
    return ret;
}

- (nonnull NSArray *)yjq_forEach:(nonnull void (^)(id  _Nonnull __strong))block {
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (block) block(obj);
    }];
    return self;
}

- (nonnull NSArray *)yjq_map:(nonnull id  _Nonnull (^)(id  _Nonnull __strong))block {
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [ret addObject:block(obj)];
    }];
    return ret;
}

- (nonnull id)yjq_reduce:(nonnull id  _Nonnull (^)(id  _Nonnull __strong, id  _Nonnull __strong))block withInitializer:(nonnull id<NSCopying>)initializer {
    __block id ret = [((NSObject *)initializer) copy];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ret = block(obj, ret);
    }];
    return ret;
}

@end
