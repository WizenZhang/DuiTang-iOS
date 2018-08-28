//
//  WZSettingItem.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/25.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZSettingItem.h"

@implementation WZSettingItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    WZSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}


+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}

@end
