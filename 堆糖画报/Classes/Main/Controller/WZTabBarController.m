//
//  WZTabBarController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZTabBarController.h"
#import "WZHomeViewController.h"
#import "WZSortViewController.h"
#import "WZStoreViewController.h"
#import "WZTabBar.h"
@interface WZTabBarController () <WZTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) WZTabBar *customTabBar;
@end

@implementation WZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    WZTabBar *customTabBar = [[WZTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(WZTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.首页
    WZHomeViewController *home = [[WZHomeViewController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_item_home_normal" selectedImageName:@"tabbar_item_home_selected"];
    
    // 2.分类
    WZSortViewController *message = [[WZSortViewController alloc] init];
    [self setupChildViewController:message title:@"分类" imageName:@"tabbar_item_communication_normal" selectedImageName:@"tabbar_item_communication_selected"];
    
    // 3.收藏
    WZStoreViewController *discover = [[WZStoreViewController alloc] init];
    [self setupChildViewController:discover title:@"收藏" imageName:@"tabbar_item_category_normal" selectedImageName:@"tabbar_item_category_selected"];
    
    
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    
    // 2.包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}


@end
