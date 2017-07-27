//
//  JDDIDIIndexContentView.m
//  JDDIDIDemo
//
//  Created by 王金东 on 2017/7/24.
//  Copyright © 2017年 王金东. All rights reserved.
//

#import "JDDIDIIndexContentView.h"
#import "UIView+jd_autolayout.h"

@interface JDDIDIIndexContentView ()<UIScrollViewDelegate>

@end
@implementation JDDIDIIndexContentView

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
 */


-  (void)setContentArray:(NSArray<JDDIDIIndexViewController *> *)contentArray {
    _contentArray = contentArray;
    self.delegate = self;
    self.pagingEnabled = YES;
    self.scrollEnabled = NO;
    for(JDDIDIIndexViewController *vc in contentArray){
        UIView *v = vc.view;
        [self.viewController addChildViewController:vc];
        [self addSubview:v];
    }
     [self distributeSpacingHorizontally];
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [self setContentOffset:CGPointMake(selectedIndex*self.frame.size.width, 0) animated:YES];
    [self switchSelectedIndex:selectedIndex];
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSUInteger i = scrollView.contentOffset.x/scrollView.frame.size.width;
    [self switchSelectedIndex:i];
    if (self.selectBlock) {
        self.selectBlock(i);
    }
}

- (void)switchSelectedIndex:(NSUInteger)index {
    JDDIDIIndexViewController *v = self.contentArray[index];
    JDDirection d = JDDirectionNone;
    if(_selectedIndex < index){
        d = JDDirectionRight;
    }else if(_selectedIndex > index){
        d = JDDirectionLeft;
    }
    [v viewWillShow:d];
    _selectedIndex = index;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
//        
//        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
//        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
//        if (hitTestView) {
//            return hitTestView;
//        }
//    }
//    return [super hitTest:point withEvent:event];
//}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
        
        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
        if (hitTestView && ![hitTestView isMemberOfClass:[UIView class]]) {
            return hitTestView;
        }
    }
    return nil;
}


@end
