//
//  JDDDSFCViewController.m
//  JDDIDIDemo
//
//  Created by 王金东 on 2016/8/1.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "JDDDSFCViewController.h"

@interface JDDDSFCViewController ()

@end

@implementation JDDDSFCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    lb.text = @"我是顺风车";
    lb.textColor = [UIColor redColor];
    [self.view addSubview:lb];
    
    // Do any additional setup after loading the view.
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
