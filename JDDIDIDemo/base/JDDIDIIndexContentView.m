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

@property (nonatomic,strong) JDDIDIIndexViewController *currentViewController;

@end
@implementation JDDIDIIndexContentView{
    BOOL _animal;
}

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
 */


-  (void)setContentArray:(NSArray<JDDIDIIndexViewController *> *)contentArray {
    _contentArray = contentArray;
    self.selectedIndex = 0;
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if(_animal)return;
    _animal = YES;
    JDDIDIIndexViewController *v = self.contentArray[selectedIndex];
    v.view.frame = self.bounds;
    [self.viewController addChildViewController:v];
    [self addSubview:v.view];
    __block CGRect fromFrame = v.view.frame;
    
    JDDirection d = JDDirectionNone;
    if(_selectedIndex < selectedIndex){
        d = JDDirectionRight;
        fromFrame.origin.x = self.bounds.size.width;
        v.view.frame = fromFrame;
        
        [UIView animateWithDuration:0.3f animations:^{
            
            CGRect toFrame = self.currentViewController.view.frame;
            toFrame.origin.x = -self.frame.size.width;
            self.currentViewController.view.frame = toFrame;
            
            fromFrame.origin.x = 0;
            v.view.frame = fromFrame;
            
        } completion:^(BOOL finished) {
            [self.currentViewController.view removeFromSuperview];
            [self.currentViewController removeFromParentViewController];
            self.currentViewController = v;
            _animal = NO;
        }];
    }else if(_selectedIndex > selectedIndex){
        d = JDDirectionLeft;
        
        fromFrame.origin.x = -self.bounds.size.width;
        v.view.frame = fromFrame;
        
        [UIView animateWithDuration:0.3f animations:^{
            
            CGRect toFrame = self.currentViewController.view.frame;
            toFrame.origin.x = self.frame.size.width;
            self.currentViewController.view.frame = toFrame;
            
            fromFrame.origin.x = 0;
            v.view.frame = fromFrame;
            
        } completion:^(BOOL finished) {
            [self.currentViewController.view removeFromSuperview];
            [self.currentViewController removeFromParentViewController];
            self.currentViewController = v;
            _animal = NO;
        }];
        
    }else{
        self.currentViewController = v;
        _animal = NO;
    }
    [v viewWillShow:d];
    _selectedIndex = selectedIndex;
}

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
