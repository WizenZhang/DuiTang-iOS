//
//  WZSettingArrowItem.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/25.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZSettingItem.h"

@interface WZSettingArrowItem : WZSettingItem
/**
 *  点击这行cell需要跳转的控制器
 */
@property (nonatomic, assign) Class destVcClass;


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;
@end
