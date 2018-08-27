//
//  WZCategory.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/19.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZGroupItems.h"
#import "JSONModel.h"

@interface WZCategory : JSONModel
/**
 *  分类的头部目录名
 */
@property (nonatomic,copy) NSString *group_name;
/**
 *  分类的目录项
 */
@property (nonatomic,strong) NSArray< WZGroupItems> *group_items;
@end
