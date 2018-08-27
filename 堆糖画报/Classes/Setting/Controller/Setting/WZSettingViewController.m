//
//  WZSettingViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/24.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZSettingViewController.h"
#import "JXLDayAndNightMode.h"
#import "WZTableViewCell.h"
#import "WZSettingArrowItem.h"
#import "WZSettingSwitchItem.h"
#import "WZSettingGroup.h"
#import "MBProgressHUD+MJ.h"
#import "WZAccountAndSafeController.h"
#import "JXLDayAndNightMode.h"
@interface WZSettingViewController ()

@end

@implementation WZSettingViewController

/**
 *  第0组数据
 */
- (void)setupGroup0
{
    WZSettingItem *accountAndSafe = [WZSettingArrowItem itemWithTitle:@"账号与安全" destVcClass:[WZAccountAndSafeController class]];

    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[accountAndSafe];
    [self.data addObject:group];
}
/**
 *  第1组数据
 */
- (void)setupGroup1
{
    WZSettingItem *nightModel = [WZSettingSwitchItem itemWithTitle:@"夜间模式"];
    WZSettingItem *isUploadOpen = [WZSettingSwitchItem itemWithTitle:@"是否开启图片上传询问"];
    
    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[nightModel, isUploadOpen];
    [self.data addObject:group];
}
/**
 *  第2组数据
 */
- (void)setupGroup2
{
    WZSettingItem *feedBack = [WZSettingArrowItem itemWithTitle:@"意见反馈"];
    WZSettingItem *networkDiagnosis = [WZSettingArrowItem itemWithTitle:@"网络诊断"];
    
    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[feedBack, networkDiagnosis];
    [self.data addObject:group];
}

/**
 *  第3组数据
 */
- (void)setupGroup3
{
    WZSettingItem *versionFeature = [WZSettingArrowItem itemWithTitle:@"版本更新介绍"];
    
    WZSettingItem *about = [WZSettingArrowItem itemWithTitle:@"关于"];
    
    WZSettingItem *update = [WZSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查更新"];
    update.option = ^{
        // 弹框提示
        [MBProgressHUD showMessage:@"正在拼命检查中....."];
        
#warning 发送网络请求
        // 几秒后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 移除HUD
            [MBProgressHUD hideHUD];
            
            // 提醒有没有新版本
            [MBProgressHUD showError:@"没有新版本"];
        });
    };
    
    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[versionFeature,about,update];
    [self.data addObject:group];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // 0.设置日间和夜间两种状态模式
    [JXLDayAndNightManager setDayAndNight:self];
    
    // 1.标题
    self.title = @"设置";
    
    // 2.添加数据
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
}
@end
