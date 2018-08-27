//
//  WZMineViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/27.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMineViewController.h"
#import "JXLDayAndNightMode.h"
@interface WZMineViewController ()

@end

@implementation WZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置日间和夜间两种状态模式
    [JXLDayAndNightManager setDayAndNight:self];
    
    UIImageView *bg=[[UIImageView alloc]init];
    [bg setImage:[UIImage imageNamed:@"my_bg"]];
    bg.frame=CGRectMake(0, 64, DeviceWidth, DeviceWidth);
    [self.view addSubview:bg];
    
    UILabel *noContent=[[UILabel alloc]init];
    noContent.text=@"还没有发布内容";
    noContent.font=MineFont;
    noContent.textColor=[UIColor grayColor];
    noContent.textAlignment=NSTextAlignmentCenter;
    noContent.frame=CGRectMake(0, 500, DeviceWidth, 30);
    [self.view addSubview:noContent];
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
