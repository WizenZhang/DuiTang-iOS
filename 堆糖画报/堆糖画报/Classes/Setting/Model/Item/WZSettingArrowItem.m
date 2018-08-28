//
//  WZSettingArrowItem.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/25.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZSettingArrowItem.h"

@implementation WZSettingArrowItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    WZSettingArrowItem *item = [self itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass
{
    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}
@end
