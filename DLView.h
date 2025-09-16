//
//  DLView.h
//  DLKit
//
//  Created by cyp on 2021/5/17.
//

#import <UIKit/UIKit.h>
#import "UIColor+YJQ.h"
#import "NSArray+YJQ.h"
NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, DLGradientDirection) {
    DLGradientDirectionTopToBottom              = 0,    //从上到下（默认）
    DLGradientDirectionLeftToRight              = 1,    //从左到右
    DLGradientDirectionTopLeftToBottomRight     = 2,    //从左上到右下
    DLGradientDirectionBottomLeftToTopRight     = 3,    //从左下到右上
};

@interface DLView : UIView

//设置渐变背景
- (void)setGradientBackgroundWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor direction:(DLGradientDirection)direction;
- (void)setGradientBackgroundColors:(NSArray *)colors locations:(NSArray *_Nullable)locations direction:(DLGradientDirection)direction;

@end



#pragma mark - 链式访问

@interface DLView (DLChain)

@property (nonatomic, readonly) DLView *(^bg)(id color);                            //backgroundColor

@property (nonatomic, readonly) DLView *(^radius)(CGFloat cornerRadius);            //cornerRadius + masksToBounds
@property (nonatomic, readonly) DLView *(^border)(CGFloat width, id color);         //borderWidth + boderColor

@property (nonatomic, readonly) DLView *(^pinWH)(CGFloat width, CGFloat height);    //设置宽高约束, 传NAN表示不设置

@end


NS_ASSUME_NONNULL_END

