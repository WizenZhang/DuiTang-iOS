//
//  WZAddFriendViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/27.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZAddFriendViewController.h"
#import "WZSettingArrowItem.h"
#import "WZSettingGroup.h"
#import "JXLDayAndNightMode.h"
@interface WZAddFriendViewController ()

@end

@implementation WZAddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置日间和夜间两种状态模式
    [JXLDayAndNightManager setDayAndNight:self];

    // 1.标题
    self.navigationItem.title = @"添加好友";
    
    UISearchBar *searchBar=[[UISearchBar alloc]init];
    searchBar.placeholder=@"搜索昵称添加好友";
    searchBar.frame=CGRectMake(-8, 30, DeviceWidth+16, 30);
    [self.view addSubview:searchBar];
    // 2.添加数据
    [self setupGroup0];
}
/**
 *  第0组数据
 */
- (void)setupGroup0
{
    WZSettingItem *weibo = [WZSettingArrowItem itemWithIcon:@"weibo" title:@"添加新浪微博好友"];
    WZSettingItem *weixin = [WZSettingArrowItem itemWithIcon:@"weixin" title:@"添加微信好友"];
    WZSettingItem *qq = [WZSettingArrowItem itemWithIcon:@"qq" title:@"添加QQ好友"];
    WZSettingItem *contact = [WZSettingArrowItem itemWithIcon:@"contact" title:@"添加通讯录好友"];
    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[weibo,weixin,qq,contact];
    [self.data addObject:group];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}
@end
