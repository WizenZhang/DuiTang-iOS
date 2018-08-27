//
//  WZNoticeViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/27.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZNoticeViewController.h"
#import "JXLDayAndNightMode.h"
@interface WZNoticeViewController ()

@end

@implementation WZNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置日间和夜间两种状态模式
    [self.view jxl_setDayMode:^(UIView *view) {
        // 设置日间模式状态
        view.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        // 设置夜间模式状态
        view.backgroundColor = WZNightbgColor;
    }];


    UIImageView *bg=[[UIImageView alloc]init];
    [bg setImage:[UIImage imageNamed:@"my_message"]];
    bg.frame=CGRectMake(DeviceWidth/2-40, 250, 80, 80);
    [self.view addSubview:bg];
    
    UILabel *noContent=[[UILabel alloc]init];
    noContent.text=@"您还没有收到新消息";
    noContent.font=MineFont;
    noContent.textColor=[UIColor grayColor];
    noContent.textAlignment=NSTextAlignmentCenter;
    noContent.frame=CGRectMake(0, 350, DeviceWidth, 30);
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
