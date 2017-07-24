//
//  JDMapViewController.h
//  JD
//
//  Created by 王金东 on 15/6/19.
//  Copyright (c) 2015年 王金东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapView.h>


typedef struct JDMapLocationPoint {
    CGFloat latitude, longitude;
    const char *title , *subtitle;
    
} HsMapLocationPoint;

UIKIT_STATIC_INLINE HsMapLocationPoint HsMapLocationPointMake(CGFloat latitude, CGFloat longitude, const char *title, const char *subtitle) {
    HsMapLocationPoint point = {latitude, longitude, title, subtitle};
    return point;
}


@interface JDMapViewController : UIViewController

@property (nonatomic, weak) IBOutlet BMKMapView *mapView;

@property (nonatomic, copy) NSString *endAddress;
@property (nonatomic, copy) NSString *city;

//地图缩放级别
@property (nonatomic, assign) CGFloat zoomLevel;

//缩放后右侧菜单布局
@property (nonatomic, assign) UIEdgeInsets scaleRightToolsInsets;
//是否缩放 YES 表示处于缩放状态 NO表示全屏状态
@property (nonatomic, assign) BOOL scale;
//缩放地图
@property (nonatomic, copy) void(^scaleViewBlock)(BOOL selected);
//点击地图
@property (nonatomic, copy) void(^onClickedMapBlank)(void);
//点击标注
@property (nonatomic, copy) void(^onClickedMapAnnotation)(void);

//地图中心点
@property (nonatomic, copy) void(^mapCenterBlock)(CGPoint point);
@property (nonatomic, copy) void(^reverseGeoCodeResultBlock)(NSDictionary *addressInfo);


//是否显示用户信息
@property (nonatomic,assign) BOOL showsUserLocation;
/**
 *  @author wangjindong, 15-06-29 10:06:32
 *
 *  @brief  是否显示工具条
 *
 *  @since 1.0
 */
@property (nonatomic,assign) BOOL showTools;

/**
 *  @author wangjindong, 15-06-24 09:06:30
 *
 *  @brief  给地图设置一个点
 *
 *  @param location 经纬度
 *  @param title    点击大头针显示的标题
 *  @param subtitle 点击大头针显示的子标题
 *
 *  @since 1.0
 */
@property (nonatomic,assign) HsMapLocationPoint point;

@end
