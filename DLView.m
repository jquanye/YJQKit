//
//  DLView.m
//  DLKit
//
//  Created by cyp on 2021/5/17.
//

#import "DLView.h"

@interface DLView ()

//线性渐变
@property (nonatomic, strong) IBInspectable UIColor *gradientStartColor;
@property (nonatomic, strong) IBInspectable UIColor *gradientEndColor;
@property (nonatomic, assign) DLGradientDirection gradientDirection;
@property (nonatomic, assign) IBInspectable NSUInteger gradientDirectionValue;  //0：上到下，1：左到右，2：左上到右下，3：左下到右上

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable NSInteger cornerPosition;           //0：全部，1：上半部，2：下半部，3：左半部，4：右半部

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

@property (nonatomic, assign) IBInspectable CGFloat touchExtend;
@property (nonatomic, assign) IBInspectable NSInteger zPosition;

@end


@implementation DLView



+ (Class)layerClass {
    return CAGradientLayer.class;
}

- (CAGradientLayer *)gradientLayer {
    return (id)self.layer;
}

- (void)setGradientStartColor:(UIColor *)gradientStartColor {
    _gradientStartColor = gradientStartColor;
    [self configGradientColors];
}

- (void)setGradientEndColor:(UIColor *)gradientEndColor {
    _gradientEndColor = gradientEndColor;
    [self configGradientColors];
}

- (void)setGradientDirection:(DLGradientDirection)gradientDirection {
    CGPoint startPoint, endPoint;
    
    switch (gradientDirection) {
        case DLGradientDirectionLeftToRight:
            startPoint = CGPointMake(0, 0.5);
            endPoint = CGPointMake(1, 0.5);
            break;
        case DLGradientDirectionTopLeftToBottomRight:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 1);
            break;
        case DLGradientDirectionBottomLeftToTopRight:
            startPoint = CGPointMake(0, 1);
            endPoint = CGPointMake(1, 0);
            break;
        default:
            startPoint = CGPointMake(0.5, 0);
            endPoint = CGPointMake(0.5, 1);
            break;
    }
    
    self.gradientLayer.startPoint = startPoint;
    self.gradientLayer.endPoint = endPoint;
}

- (void)setGradientDirectionValue:(NSUInteger)gradientDirectionValue {
    self.gradientDirection = gradientDirectionValue;
}

- (void)configGradientColors {
    if (self.gradientStartColor && self.gradientEndColor) {
        self.gradientLayer.colors = @[(id)self.gradientStartColor.CGColor, (id)self.gradientEndColor.CGColor];
    } else {
        self.gradientLayer.colors = nil;
    }
}

- (void)setGradientBackgroundWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor direction:(DLGradientDirection)direction {
    _gradientStartColor = startColor;
    _gradientEndColor = endColor;
    [self configGradientColors];
    self.gradientDirection = direction;
}

- (void)setGradientBackgroundColors:(NSArray *)colors locations:(NSArray *)locations direction:(DLGradientDirection)direction {
    self.gradientDirection = direction;
    self.gradientLayer.locations = locations;
    
    self.gradientLayer.colors = [colors yjq_map:^id _Nonnull(id _Nonnull obj) {
        return ([obj isKindOfClass:UIColor.class]? (id)[obj CGColor]: obj);
    }];
}

@end



@implementation DLView (DLChain)

- (DLView * (^)(id))bg {
    return ^(id color) {
        self.backgroundColor = Color(color);
        return self;
    };
}

- (DLView * _Nonnull (^)(CGFloat))radius {
    return ^(CGFloat radius) {
        self.cornerRadius = radius;
        return self;
    };
}

- (DLView * _Nonnull (^)(CGFloat, id _Nonnull))border {
    return ^(CGFloat width, id color) {
        self.borderWidth = width;
        self.borderColor = Color(color);
        return self;
    };
}

- (DLView * _Nonnull (^)(CGFloat, CGFloat))pinWH {
    return ^(CGFloat width, CGFloat height) {
        if (!isnan(width)) {
            [self.widthAnchor constraintEqualToConstant:width].active = YES;
        }
        if (!isnan(height)) {
            [self.heightAnchor constraintEqualToConstant:height].active = YES;
        }
        return self;
    };
}
UIColor *Color(id colorString) {
    if ([colorString isKindOfClass:UIColor.class]) return colorString;
    if (![colorString isKindOfClass:NSString.class]) return nil;
    
    NSArray *components = [colorString componentsSeparatedByString:@","];
    
    if (components.count < 3) {
        UIColor *color = [UIColor yjq_colorWithHEX:colorString];
        
        if (!color && components.count == 1) {
            color = [UIColor colorNamed:colorString];
            if (!color) {
                SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@Color", colorString]);
                if ([UIColor respondsToSelector:sel]) {
                    color = [UIColor performSelector:sel];
                }
            }
        }
        
        return color;

    } else {
        return [UIColor yjq_colorWithRGB:colorString];
    }
}
@end

