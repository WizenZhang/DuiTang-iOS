//
//  WZTabBar.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WZTabBar;

@protocol WZTabBarDelegate <NSObject>

@optional
- (void)tabBar:(WZTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;

@end

@interface WZTabBar : UIView
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<WZTabBarDelegate> delegate;

@end
