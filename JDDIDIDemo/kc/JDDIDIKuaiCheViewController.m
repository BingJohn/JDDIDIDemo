//
//  JDDIDIKuaiCheViewController.m
//  JDDIDIDemo
//
//  Created by 王金东 on 2017/7/24.
//  Copyright © 2017年 王金东. All rights reserved.
//

#import "JDDIDIKuaiCheViewController.h"


@interface JDDIDIKuaiCheViewController ()
@property (nonatomic,strong) UIView *bottomView;
@end

@implementation JDDIDIKuaiCheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
     self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height-100, self.view.frame.size.width-40, 80)];
    self.bottomView.backgroundColor = [UIColor whiteColor];
    self.bottomView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    
    [self.view addSubview:self.bottomView];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
    lb.text = @"我是快车";
    lb.textColor = [UIColor orangeColor];
    [self.bottomView addSubview:lb];
  
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   
}


- (void)viewWillShow:(JDDirection)direction {
    NSLog(@"我想来处理下自己的动画");
    
    if(direction == JDDirectionLeft){
        [UIView animateWithDuration:1.5f animations:^{
            self.bottomView.backgroundColor = [UIColor redColor];
        }];
    }else if(direction == JDDirectionRight){
        [UIView animateWithDuration:1.5f animations:^{
            self.bottomView.backgroundColor = [UIColor whiteColor];
        }];
    }
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
