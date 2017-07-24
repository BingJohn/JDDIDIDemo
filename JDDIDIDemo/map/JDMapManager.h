//
//  JDMapManager.h
//  JD
//  Created by 王金东 on 15/6/19.
//  Copyright (c) 2015年 王金东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>


@protocol JDMapLocationManagerDelegate;

@interface JDMapManager : NSObject

+ (instancetype)sharedInstance;

- (void)start:(id<JDMapLocationManagerDelegate>)delegate;
- (void)stop;

- (void)applicationWillResignActive:(UIApplication *)application;

- (void)applicationDidBecomeActive:(UIApplication *)application;

@end



@protocol JDMapLocationManagerDelegate <NSObject>

@optional

- (void)locationManager:(JDMapManager *)locationManager didFinishedLocation:(BMKUserLocation *)userLocation;//成功

- (void)locationManager:(JDMapManager *)locationManager locationInfo:(NSDictionary *)locationInfo;//位置信息

- (void)locationManager:(JDMapManager *)locationManager didFailWithError:(NSError *)error;//失败

@end
