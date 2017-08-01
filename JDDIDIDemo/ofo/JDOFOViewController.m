//
//  JDOFOViewController.m
//  JDDIDIDemo
//
//  Created by 王金东 on 2017/8/1.
//  Copyright © 2017年 王金东. All rights reserved.
//

#import "JDOFOViewController.h"

@interface JDOFOViewController ()

@end

@implementation JDOFOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height-100, self.view.frame.size.width-40, 80)];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    
    [self.view addSubview:bottomView];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
    lb.text = @"我是ofo";
    lb.textColor = [UIColor orangeColor];
    [bottomView addSubview:lb];
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
