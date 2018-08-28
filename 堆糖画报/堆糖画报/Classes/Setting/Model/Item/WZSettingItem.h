//
//  WZSettingItem.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/25.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^WZSettingItemOption)();
@interface WZSettingItem : NSObject
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  点击那个cell需要做什么事情
 */
@property (nonatomic, copy) WZSettingItemOption option;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;
@end
