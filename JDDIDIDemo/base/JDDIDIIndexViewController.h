//
//  JDDIDIIndexViewController.h
//  JDDIDIDemo
//
//  Created by 王金东 on 2017/7/24.
//  Copyright © 2017年 王金东. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger) {
    JDDirectionNone,
    JDDirectionLeft,
    JDDirectionRight
}JDDirection;

@interface JDDIDIIndexViewController : UIViewController

- (instancetype)initWithBackgourndColor:(NSString *)color;

- (void)viewWillShow:(JDDirection)direction;

@end
