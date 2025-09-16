//
//  UIColor.m
//  YJQKitTest
//
//  Created by yjq20250224 on 2025/9/16.
//

#import "UIColor+YJQ.h"

@implementation UIColor(YJQ)

+ (nonnull UIColor *)yjq_colorWithHEX:(nonnull NSString *)hex {
    if (![hex hasPrefix:@"#"]) return nil;

    hex = [hex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSArray *components = [hex componentsSeparatedByString:@","];
    
    NSString *hexValue = components.firstObject;
    NSString *alphaValue = (components.count == 2? components[1]: @"1");
    
    unsigned int value = 0;
    [[NSScanner scannerWithString:hexValue] scanHexInt:&value];
    
    NSInteger r = (value & 0xFF0000) >> 16;
    NSInteger g = (value & 0xFF00) >> 8;
    NSInteger b = (value & 0xFF);
    CGFloat a = [alphaValue floatValue];
    
    return [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a];
}

+ (nonnull UIColor *)yjq_colorWithRGB:(nonnull NSString *)rgb {
    NSArray *components = [rgb componentsSeparatedByString:@","];
    if (components.count < 3) return nil;
    
    NSInteger r = [components[0] integerValue];
    NSInteger g = [components[1] integerValue];
    NSInteger b = [components[2] integerValue];
    CGFloat a = (components.count >= 4? [components[3] floatValue]: 1);
    
    return [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a];
}

@end
