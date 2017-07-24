//
//  UIView+jd_autolayout.h
//  InternetSellTicket
//
//  Created by 王金东 on 15/6/1.
//  Copyright (c) 2015年 王金东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>


typedef NS_ENUM(NSInteger, HsViewOrientation) {
    HsViewHorizontal,
    HsViewVertical,
};

@interface UIView (jd_autolayout)

//水平排列views
- (void)distributeSpacingHorizontallyWithViews:(NSArray*)views;
- (void)distributeSpacingHorizontallyWithViews:(NSArray*)views
                                         width:(CGFloat)width;
- (void)distributeSpacingHorizontallyWithViews:(NSArray*)views
                                         width:(CGFloat)width
                                       padding:(CGFloat)padding;
//垂直排列views
- (void)distributeSpacingVerticallyWithViews:(NSArray*)views;
- (void)distributeSpacingVerticallyWithViews:(NSArray*)views
                                      height:(CGFloat)height;
- (void)distributeSpacingVerticallyWithViews:(NSArray*)views
                                      height:(CGFloat)height
                                     padding:(CGFloat)padding;


//水平排列子views
- (void)distributeSpacingHorizontally;
- (void)distributeSpacingHorizontally:(CGFloat)width;
- (void)distributeSpacingHorizontally:(CGFloat)width padding:(CGFloat)padding;
//垂直排列子views
- (void)distributeSpacingVertically;
- (void)distributeSpacingVertically:(CGFloat)height;
- (void)distributeSpacingVertically:(CGFloat)height padding:(CGFloat)padding;

//更新某个约束
- (void)updateConstraints:(NSLayoutAttribute)attribute constant:(CGFloat)constant;

/* 根据给定数字设置长宽 */
- (NSLayoutConstraint *)constraintWidth:(CGFloat)width;
- (NSLayoutConstraint *)constraintHeight:(CGFloat)height;
- (NSArray *)constraintArrayWithSize:(CGSize)size;

/* 根据其它view的长宽来设置长宽 */
- (NSLayoutConstraint *)constraintHeightEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintWidthEqualToView:(UIView *)view;
- (NSArray *)constraintArraySizeEqualToView:(UIView *)view;

/* 上下左右与其它view对齐 */
- (NSLayoutConstraint *)constraintTopEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintBottomEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintLeftEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintRightEqualToView:(UIView *)view;

/* 横向或纵向填充整个屏幕 */
- (NSArray *)constraintArrayFillHeightInSuperview;
- (NSArray *)constraintArrayFillWidthInSuperview;
- (NSArray *)constraintArrayFillInSuperview;

/* 设置中心位置 */
- (NSLayoutConstraint *)constraintCenterYEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintCenterXEqualToView:(UIView *)view;

@end
