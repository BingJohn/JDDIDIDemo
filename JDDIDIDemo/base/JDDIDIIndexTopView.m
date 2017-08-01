//
//  JDDIDIIndexTopView.m
//  JDDIDIDemo
//
//  Created by 王金东 on 2016/7/24.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "JDDIDIIndexTopView.h"
#import "UIView+jd_autolayout.h"

@implementation JDDIDIIndexTopView{
    NSMutableArray *_buttons;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    _buttons = [NSMutableArray arrayWithCapacity:titleArray.count];
    for(int i = 0; i < titleArray.count; i ++){
        NSString *title = titleArray[i];
        UIButton *bt = [[UIButton alloc] init];
        [bt setTitle:title forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [bt addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt];
        [_buttons addObject:bt];
    }
    CGFloat width = 80;
    self.pagingEnabled = YES;
    [self distributeSpacingHorizontally:width];
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [self switchSelectedIndex:selectedIndex];
}

- (void)select:(UIButton *)sender {
    [self cancelSelected];
    NSUInteger index = [_buttons indexOfObject:sender];
    [self switchSelectedIndex:index];
    if (self.selectBlock) {
        self.selectBlock([_buttons indexOfObject:sender]);
    }
}
- (void)switchSelectedIndex:(NSUInteger)index {
    [self cancelSelected];
    UIButton *btn = _buttons[index];
    CGFloat x = index*80+40;
    CGFloat xoffset = x - self.frame.size.width/2;
    if(xoffset < 0 ){
        xoffset = 0;
    }else if((self.contentSize.width-x)<= self.frame.size.width/2){
        xoffset = self.contentSize.width-self.frame.size.width;
    }
    [self setContentOffset:CGPointMake(xoffset, 0) animated:YES];
    btn.selected = YES;
    _selectedIndex = index;
}
- (void)cancelSelected {
    for (UIButton *bt in _buttons) {
        bt.selected = NO;
    }
}

@end
