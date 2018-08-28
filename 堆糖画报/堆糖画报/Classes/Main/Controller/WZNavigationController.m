//
//  WZNavigationController.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/13.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZNavigationController.h"
#import "JXLDayAndNightMode.h"
@interface WZNavigationController ()

@end

@implementation WZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置日间和夜间两种状态模式
    [self setDayAndNight];
}
/**
 *  设置日间和夜间两种状态模式
 */
- (void)setDayAndNight
{
    [self.navigationBar jxl_setDayMode:^(UIView *view) {
        UINavigationBar *bar = (UINavigationBar *)view;
        // 改变状态栏前景色为黑色
        bar.barStyle = UIBarStyleDefault;
        bar.barTintColor = [UIColor whiteColor];
        bar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
    } nightMode:^(UIView *view) {
        
        UINavigationBar *bar = (UINavigationBar *)view;
        // 改变状态栏前景色为白色
        bar.barStyle = UIBarStyleBlack;
        bar.barTintColor = WZNightNavColor;
        bar.titleTextAttributes=@{NSForegroundColorAttributeName:WZNightTextColor,NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
    }];

}
/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme
{   //nav_left_arrow
    UIBarButtonItem *item = [UIBarButtonItem appearance];
   
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = iOS7 ? [UIColor blackColor] : [UIColor grayColor];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:iOS7 ? 15 : 12];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[UITextAttributeTextColor] =  [UIColor lightGrayColor];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置颜色属性
    navBar.tintColor=[UIColor lightGrayColor];
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont] = [UIFont boldSystemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
