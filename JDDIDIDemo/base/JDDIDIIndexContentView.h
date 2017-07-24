//
//  JDDIDIIndexContentView.h
//  JDDIDIDemo
//
//  Created by 王金东 on 2017/7/24.
//  Copyright © 2017年 王金东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDDIDIIndexViewController.h"

@interface JDDIDIIndexContentView : UIScrollView

@property (nonatomic,weak) UIViewController *viewController;

@property (nonatomic,strong) NSArray<JDDIDIIndexViewController *> *contentArray;

@property (nonatomic,assign) NSUInteger selectedIndex;

@property (nonatomic,copy) void(^selectBlock)(NSUInteger index);

@end
