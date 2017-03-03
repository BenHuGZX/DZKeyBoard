//
//  UIView+YVAdditions.h
//  YVKit_Dev
//
//  Created by srj on 16/4/5.
//  Copyright © 2016年 srj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YVAdditions)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

/*
 * 当前的viewcontroller
 */
- (UIViewController *)viewController;

/*
 * 寻找第一后代的class
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;
/*
 * 寻找第一祖先的class
 */
- (UIView *)ancestorOrSelfWithClass:(Class)cls;

/*
 * 删除uiview中的全部的子视图
 */
- (void)removeAllSubviews;
@end

@interface UIImage (fixOrientation)

- (UIImage *)fixOrientation;
- (UIImage *)imageScaledWithSize:(CGSize)fitSize;
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
@end

@interface UIButton (EnlargeTouchArea)
/*
 * 扩大UIButton的点击区域
 */
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
//- (void)setShadow;
//- (void)setGrayShadow;
@end

@interface UIColor (ColorWithHexString)

+ (UIColor *)colorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha;

/**
 *  @brief  渐变颜色
 *
 *  @param  c1      开始颜色
 *  @param  c2      结束颜色
 *  @param  height  渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor *)ColorGradientFromColor:(UIColor *)c1 toColor:(UIColor *)c2 height:(int)height;
@end


