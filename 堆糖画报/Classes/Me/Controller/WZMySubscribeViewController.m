//
//  WZMySubscribeViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/27.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMySubscribeViewController.h"
#import "JXLDayAndNightMode.h"
@interface WZMySubscribeViewController ()

@end

@implementation WZMySubscribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置日间和夜间两种状态模式
    [JXLDayAndNightManager setDayAndNight:self];
    
    UILabel *noContent=[[UILabel alloc]init];
    noContent.text=@"你还没有订阅任何内容";
    noContent.font=MineFont;
    noContent.textColor=[UIColor grayColor];
    noContent.textAlignment=NSTextAlignmentCenter;
    noContent.frame=CGRectMake(0, 250, DeviceWidth, 30);
    [self.view addSubview:noContent];
    
    UIImageView *mayLike=[[UIImageView alloc]init];
    [mayLike setImage:[UIImage imageNamed:@"may_like"]];
    mayLike.frame=CGRectMake(DeviceWidth/2-100, 300, 200, 60);
    [self.view addSubview:mayLike];
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
