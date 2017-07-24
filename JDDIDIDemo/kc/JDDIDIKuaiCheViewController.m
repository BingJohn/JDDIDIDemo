//
//  JDDIDIKuaiCheViewController.m
//  JDDIDIDemo
//
//  Created by 王金东 on 2017/7/24.
//  Copyright © 2017年 王金东. All rights reserved.
//

#import "JDDIDIKuaiCheViewController.h"
#import "JDMapViewController.h"
#import "JDMapManager.h"
#import "JDCenterView.h"

@interface JDDIDIKuaiCheViewController ()
@property (nonatomic,strong) JDCenterView *centerView;
@end

@implementation JDDIDIKuaiCheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addMapViewController:self superView:self.view currentCity:@"杭州"];
    [self.view addSubview:self.centerView];
     self.centerView.center = CGPointMake(self.view.frame.size.width/2,(self.view.frame.size.height-64-self.centerView.frame.size.height)/2);
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   
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
    
}

- (JDCenterView *)centerView {
    if (_centerView == nil) {
        CGFloat height = 80;
        _centerView = [[JDCenterView alloc] initWithFrame:CGRectMake(0, 0, 250, height)];
    }
    return _centerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
