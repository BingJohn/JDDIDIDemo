//
//  UIView+jd_autolayout.m
//  InternetSellTicket
//
//  Created by 王金东 on 15/6/1.
//  Copyright (c) 2015年 王金东. All rights reserved.
//

#import "UIView+jd_autolayout.h"

@implementation UIView (jd_autolayout)

- (void)distributeSpacingHorizontallyWithViews:(NSArray*)views {
    [self distributeSpacingHorizontallyWithViews:views width:0];
}
- (void)distributeSpacingHorizontallyWithViews:(NSArray*)views
                                         width:(CGFloat)width{
    [self distributeSpacingHorizontallyWithViews:views width:width padding:0];
}

- (void)distributeSpacingHorizontallyWithViews:(NSArray*)views
                                         width:(CGFloat)width
                                       padding:(CGFloat)padding {
    UIView *lastView = nil;
    for (NSInteger i = 0 ; i < views.count; i++) {
        UIView *view = views[i];
         if(!view.hidden && view.alpha > 0){
             [self addSubview:view];
             [view mas_makeConstraints:^(MASConstraintMaker *make) {
                 if(width > 0){
                    make.width.equalTo(@(width));
                 }else{
                     make.width.equalTo(self).offset(-padding*2);
                 }
                 make.height.equalTo(self);
                 make.top.equalTo(self);
                 make.bottom.equalTo(self);
                 if (lastView == nil) {
                     make.left.equalTo(self).offset(padding);
                 }else{
                     make.left.equalTo(lastView.mas_right).offset(padding*2);
                 }
             }];
             lastView = view;
         }
    }
    [lastView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-padding);
    }];
    
}

- (void)distributeSpacingVerticallyWithViews:(NSArray*)views {
    [self distributeSpacingVerticallyWithViews:views height:0];
    
}
- (void)distributeSpacingVerticallyWithViews:(NSArray*)views
                                      height:(CGFloat)height{
    [self distributeSpacingVerticallyWithViews:views height:height padding:0];
}
- (void)distributeSpacingVerticallyWithViews:(NSArray*)views
                                      height:(CGFloat)height
                                     padding:(CGFloat)padding {
    UIView *lastView = nil;
    for (NSInteger i = 0 ; i < views.count; i++) {
        UIView *view = views[i];
        if(!view.hidden && view.alpha > 0){
             [self addSubview:view];
             [view mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.width.equalTo(self);
                 if(height > 0){
                     make.height.equalTo(@(height));
                 }else{
                     make.height.equalTo(self).offset(-padding*2);
                 }
                 make.left.equalTo(self);
                 make.right.equalTo(self);
                 if (lastView == nil) {
                     make.top.equalTo(self).offset(padding);
                 }else{
                     make.top.equalTo(lastView.mas_bottom).offset(padding*2);
                 }
             }];
             lastView = view;
         }
    }
    [lastView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-padding);
    }];
    
}

- (void)distributeSpacingHorizontally {
    [self distributeSpacingHorizontally:0];
}

- (void)distributeSpacingHorizontally:(CGFloat)width {
    [self distributeSpacingHorizontally:width padding:0];
}

- (void)distributeSpacingHorizontally:(CGFloat)width padding:(CGFloat)padding {
    UIView *lastView = nil;
    for (NSInteger i = 0 ; i < self.subviews.count; i++) {
        UIView *view = self.subviews[i];
        if(!view.hidden && view.alpha > 0){
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                if(width > 0){
                    make.width.equalTo(@(width));
                }else{
                    make.width.equalTo(self).offset(-padding*2);
                }
                make.top.equalTo(self);
                make.bottom.equalTo(self);
                make.height.equalTo(self);
                if (lastView == nil) {
                    make.left.equalTo(self).offset(padding);
                }else{
                    make.left.equalTo(lastView.mas_right).offset(padding*2);
                }
            }];
            lastView = view;
        }
    }
    [lastView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-padding);
    }];
}

- (void)distributeSpacingVertically {
    [self distributeSpacingVertically:0];
}
- (void)distributeSpacingVertically:(CGFloat)height {
    [self distributeSpacingVertically:height padding:0];
}
- (void)distributeSpacingVertically:(CGFloat)height padding:(CGFloat)padding {
    UIView *lastView = nil;
    for (NSInteger i = 0 ; i < self.subviews.count; i++) {
        UIView *view = self.subviews[i];
         if(!view.hidden && view.alpha > 0){
             [view mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.left.equalTo(self);
                 make.right.equalTo(self);
                 make.width.equalTo(self);
                 if(height > 0){
                     make.height.equalTo(@(height));
                 }else{
                     make.height.equalTo(self).offset(-padding*2);
                 }
                 if (lastView == nil) {
                     make.top.equalTo(self).offset(padding);
                 }else{
                     make.top.equalTo(lastView.mas_bottom).offset(padding*2);
                 }
             }];
             lastView = view;
         }
    }
    [lastView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-padding);
    }];
}

//更新某个约束
- (void)updateConstraints:(NSLayoutAttribute)attribute constant:(CGFloat)constant {
    NSArray* constrains = self.constraints;
    for (NSLayoutConstraint *constraint in constrains) {
        if (constraint.firstAttribute == attribute) {
            constraint.constant = constant;
        }
    }
}


- (NSLayoutConstraint *)constraintWidth:(CGFloat)width {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:0
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0f
                                         constant:width];
}

- (NSLayoutConstraint *)constraintHeight:(CGFloat)height {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:0
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0f
                                         constant:height];
}

- (NSArray *)constraintArrayWithSize:(CGSize)size {
    NSLayoutConstraint *widthConstraint = [self constraintWidth:size.width];
    NSLayoutConstraint *heightConstraint = [self constraintHeight:size.height];
    return @[widthConstraint, heightConstraint];
}


- (NSLayoutConstraint *)constraintHeightEqualToView:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeHeight
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintWidthEqualToView:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeWidth
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintCenterYEqualToView:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeCenterY
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeCenterY
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintCenterXEqualToView:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeCenterX
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeCenterX
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSArray *)constraintArrayFillHeightInSuperview {
    UIView *view = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|"
                                                   options:0
                                                   metrics:nil
                                                     views:NSDictionaryOfVariableBindings(view)];
}

- (NSArray *)constraintArrayFillWidthInSuperview {
    UIView *view = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|"
                                                   options:0
                                                   metrics:nil
                                                     views:NSDictionaryOfVariableBindings(view)];
}

- (NSLayoutConstraint *)constraintTopEqualToView:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeTop
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintBottomEqualToView:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintLeftEqualToView:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeLeft
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeLeft
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintRightEqualToView:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeRight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeRight
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSArray *)constraintArraySizeEqualToView:(UIView *)view {
    return [self constraintArrayWithSize:view.frame.size];
}

- (NSArray *)constraintArrayFillInSuperview {
    NSMutableArray *constraints = [[NSMutableArray alloc] initWithArray:[self constraintArrayFillWidthInSuperview]];
    [constraints addObjectsFromArray:[self constraintArrayFillHeightInSuperview]];
    return constraints;
}


@end
