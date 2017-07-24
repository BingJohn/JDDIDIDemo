//
//  ViewController.m
//  JDDIDIDemo
//
//  Created by 王金东 on 2017/7/24.
//  Copyright © 2017年 王金东. All rights reserved.
//

#import "ViewController.h"
#import "JDDIDIIndexTopView.h"
#import "JDDIDIIndexContentView.h"
#import "JDDIDIIndexViewController.h"
#import "JDDIDIKuaiCheViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet JDDIDIIndexTopView *topView;

@property (weak, nonatomic) IBOutlet JDDIDIIndexContentView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置CGRectZero从导航栏下开始计算
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.topView.titleArray = @[@"顺风车",@"快车",@"ofo单车",@"专车",@"出租车"];
    
    self.contentView.viewController = self;
    
    self.contentView.contentArray = @[
                                      [[JDDIDIIndexViewController alloc] initWithBackgourndColor:@"#cecece"],
                                      [[JDDIDIKuaiCheViewController alloc] initWithBackgourndColor:@"#ffffff"],
                                      [[JDDIDIIndexViewController alloc] initWithBackgourndColor:@"#000000"],
                                      [[JDDIDIIndexViewController alloc] initWithBackgourndColor:@"#ff0000"],
                                      [[JDDIDIIndexViewController alloc] initWithBackgourndColor:@"#cecece"],
                                      ];
    
    __weak typeof (self)_weakSelf = self;
    self.topView.selectBlock = ^(NSUInteger index) {
        _weakSelf.contentView.selectedIndex = index;
    };
    self.contentView.selectBlock = ^(NSUInteger index) {
        _weakSelf.topView.selectedIndex = index;
    };
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
