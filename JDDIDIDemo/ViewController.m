//
//  ViewController.m
//  JDDIDIDemo
//
//  Created by 王金东 on 2016/7/24.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "ViewController.h"
#import "JDDIDIIndexTopView.h"
#import "JDDIDIIndexContentView.h"
#import "JDDIDIIndexViewController.h"
#import "JDDIDIKuaiCheViewController.h"
#import "JDMapViewController.h"
#import "JDMapManager.h"
#import "JDCenterView.h"
#import "JDDDSFCViewController.h"
#import "JDOFOViewController.h"
#import "JDDIDIUserView.h"
#import "JDDIDIPopView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet JDDIDIIndexTopView *topView;

@property (weak, nonatomic) IBOutlet JDDIDIIndexContentView *contentView;

@property (nonatomic,strong) JDCenterView *centerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"User" style:UIBarButtonItemStyleDone target:self action:@selector(openUser:)];
    
    // 设置CGRectZero从导航栏下开始计算
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self addMapViewController:self superView:self.view currentCity:@"杭州"];
   
    
    self.topView.titleArray = @[@"顺风车",@"快车",@"ofo单车",@"专车",@"出租车"];
    self.topView.backgroundColor = [UIColor whiteColor];
    
    self.contentView.viewController = self;
    
    self.contentView.contentArray = @[
                                      [[JDDDSFCViewController alloc] init],
                                      [[JDDIDIKuaiCheViewController alloc] init],
                                      [[JDOFOViewController alloc] init],
                                      [[JDDIDIIndexViewController alloc] init],
                                      [[JDDIDIIndexViewController alloc] init],
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



#pragma mark --------------------------------------
- (void)addMapViewController:(UIViewController *)viewController superView:(UIView *)superView currentCity:(NSString *)city{
    [[JDMapManager sharedInstance] start:nil];
    //添加地图
    JDMapViewController *mapViewController = [[JDMapViewController alloc]init];
    
    //设置位置
    mapViewController.city = city;
    mapViewController.point = HsMapLocationPointMake(30.19, 120.17, nil, nil);
    //设置缩放等级
    mapViewController.zoomLevel = 15;
    
    //加入地图工具
    mapViewController.showTools = YES;
    //显示用户位置
    mapViewController.showsUserLocation = YES;
    
    mapViewController.scale = NO;
    UIView *mapView = mapViewController.view;
    mapView.frame = superView.bounds;
    mapView.tag = 1000;
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [superView insertSubview:mapView atIndex:0];
    //生命周期
    [viewController addChildViewController:mapViewController];
    
    mapViewController.onClickedMapBlank = ^{
        [self.view endEditing:YES];
    };
    mapViewController.mapCenterBlock = ^(CGPoint point){
        [self.centerView startLoading];
    };
    mapViewController.reverseGeoCodeResultBlock = ^(NSDictionary *addressInfo){
        
    };
    
    
    [mapView addSubview:self.centerView];
    self.centerView.center = CGPointMake(mapView.frame.size.width/2,(mapView.frame.size.height-self.centerView.frame.size.height)/2);
    
}

- (JDCenterView *)centerView {
    if (_centerView == nil) {
        CGFloat height = 80;
        _centerView = [[JDCenterView alloc] initWithFrame:CGRectMake(0, 0, 250, height)];
    }
    return _centerView;
}


- (void)openUser:(id)sender {
    [JDDIDIPopView show:[[JDDIDIUserView alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
