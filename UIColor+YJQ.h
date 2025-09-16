//
//  UIColor.h
//  YJQKitTest
//
//  Created by yjq20250224 on 2025/9/16.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YJQ)
//"#FFFFFF", "#FFFFFF,0.5"
+ (UIColor *)yjq_colorWithHEX:(NSString *)hex;

//"255,255,255", "255,255,255,0.5"
+ (UIColor *)yjq_colorWithRGB:(NSString *)rgb;
@end

NS_ASSUME_NONNULL_END
