//
//  JDDIDIPopView.m
//  JDDIDIDemo
//
//  Created by 王金东 on 2017/8/1.
//  Copyright © 2017年 王金东. All rights reserved.
//

#import "JDDIDIPopView.h"

#define offsetWidth 100

@implementation JDDIDIPopView{
    UIView *_contentView;
    
}

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static JDDIDIPopView *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[JDDIDIPopView alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setup];
    }
    return self;
}
- (void)setup {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:self];
    if(point.x < self.frame.size.width-offsetWidth){
        return;
    }
    [UIView animateWithDuration:0.3f animations:^{
        CGFloat width = self.frame.size.width-offsetWidth;
        CGRect frame = _contentView.frame;
        frame.origin.x = -width;
        _contentView.frame = frame;
        
        self.backgroundColor = [UIColor clearColor];
        
    } completion:^(BOOL finished) {
        
        [_contentView removeFromSuperview];
        _contentView = nil;
        [self removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)show:(UIView *)content {
    _contentView = content;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *view = window.rootViewController.view;
    self.frame = window.bounds;
    [view addSubview:self];
    
    CGFloat width = self.frame.size.width-offsetWidth;
    content.frame = CGRectMake(-width, 0, width, self.frame.size.height);
    [self addSubview:content];
    
    [UIView animateWithDuration:0.3f animations:^{
        CGRect frame = content.frame;
        frame.origin.x = 0;
        content.frame = frame;
        self.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.5];
    }];

}
+ (void)show:(UIView *)content {
    [[JDDIDIPopView shareInstance] show:content];
}
@end
