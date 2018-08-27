//
//  WZStoreViewController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZMeViewController.h"
#import "WZSettingViewController.h"
#import "JXLDayAndNightMode.h"
#import "WZTableViewCell.h"
#import "WZSettingArrowItem.h"
#import "WZSettingSwitchItem.h"
#import "WZSettingGroup.h"
#import "MBProgressHUD+MJ.h"
#import "WZMyCollectionViewController.h"
#import "WZMineViewController.h"
#import "WZMyOrderViewController.h"
#import "WZMyCouponViewController.h"
#import "WZMySubscribeViewController.h"
#import "WZNoticeViewController.h"
#import "WZCommentViewController.h"
#import "WZChatViewController.h"
#import "WZAddFriendViewController.h"
#import "WZClubViewController.h"
@interface WZMeViewController ()

@end

@implementation WZMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置日间和夜间两种状态模式
    [JXLDayAndNightManager setDayAndNight:self];

    //添加分享按钮
    [self addNavigationButton];
    // 1.标题
    self.navigationItem.title = @"我";
    
    // 2.添加数据
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    [self setupGroup4];

}
- (void)addNavigationButton
{
    //添加扫一扫按钮
    UIButton *scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    scanButton.frame = CGRectMake(0, 0, 25, 25);
    
    [scanButton setImage:[UIImage imageNamed:@"setting_add"] forState:UIControlStateNormal];
    
    [scanButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
   
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:scanButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //添加设置按钮
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.frame = CGRectMake(0, 0, 22, 22);
    
    [settingButton setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    
    [settingButton addTarget:self action:@selector(settingButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:settingButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)settingButtonClick:(UIButton *)button{
    WZSettingViewController *settingViewController = [WZSettingViewController new];
    [self.navigationController pushViewController:settingViewController animated:YES];
}
- (void)addButtonClick:(UIButton *)button{
    WZAddFriendViewController *addViewController = [ WZAddFriendViewController new];
    [self.navigationController pushViewController:addViewController animated:YES];
}

/**
 *  第0组数据
 */
- (void)setupGroup0
{
    WZSettingItem *me = [WZSettingArrowItem itemWithIcon:@"my_icon" title:@"Wizen" destVcClass:[WZMineViewController class]];
    
    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[me];
    [self.data addObject:group];
}
/**
 *  第1组数据
 */
- (void)setupGroup1
{
    WZSettingItem *club = [WZSettingArrowItem itemWithIcon:@"club" title:@"我的Club" destVcClass:[WZClubViewController class]];
    
    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[club];
    [self.data addObject:group];
}

/**
 *  第2组数据
 */
- (void)setupGroup2
{
    WZSettingItem *myOrder = [WZSettingArrowItem itemWithIcon:@"order" title:@"我的订单" destVcClass:[WZMyOrderViewController class]];
    WZSettingItem *myCoupon = [WZSettingArrowItem itemWithIcon:@"coupon" title:@"我的优惠券" destVcClass:[WZMyCouponViewController class]];
    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[myOrder,myCoupon];
    [self.data addObject:group];
}

/**
 *  第3组数据
 */
- (void)setupGroup3
{
    WZSettingItem *myCollection = [WZSettingArrowItem itemWithIcon:@"store" title:@"我的收藏" destVcClass:[WZMyCollectionViewController class]];
    WZSettingItem *mySubscribe = [WZSettingArrowItem itemWithIcon:@"subscribe" title:@"我的订阅" destVcClass:[WZMySubscribeViewController class]];
    
    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[myCollection,mySubscribe];
    [self.data addObject:group];
}
/**
 *  第4组数据
 */
- (void)setupGroup4
{
    WZSettingItem *notice = [WZSettingArrowItem itemWithIcon:@"notice" title:@"通知" destVcClass:[WZNoticeViewController class]];
    WZSettingItem *comment = [WZSettingArrowItem itemWithIcon:@"comment" title:@"评论／赞" destVcClass:[WZCommentViewController class]];
    WZSettingItem *chat = [WZSettingArrowItem itemWithIcon:@"chat" title:@"聊天" destVcClass:[WZChatViewController class]];
    WZSettingGroup *group = [[WZSettingGroup alloc] init];
    group.items = @[notice,comment,chat];
    [self.data addObject:group];
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0 &&indexPath.row==0) {
        return 100;
//    }else if (indexPath.section==1 &&indexPath.row==0){
//        return 100;
    }else{
        return 44;
    }
}

@end
