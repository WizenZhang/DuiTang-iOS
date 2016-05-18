//
//  WZHeadDetailData.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/18.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@class WZUser;

@interface WZHeadDetailData : JSONModel
/**
 *  画报的名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  画报的喜欢数
 */
@property (nonatomic, assign) int like_count;
/**
 *  画报的总数
 */
@property (nonatomic, assign) int count;
/**
 *  画报的用户信息（数组中装模型:WZUser)
 */
@property (nonatomic, strong) WZUser *user;
@end
