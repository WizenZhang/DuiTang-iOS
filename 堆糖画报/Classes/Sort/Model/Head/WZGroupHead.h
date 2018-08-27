//
//  WZGroupHead.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/20.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"

@interface WZGroupHead : JSONModel
/**
 *  画报的配图
 */
@property (nonatomic, copy) NSString *icon_url;
/**
 *  画报的所属相册名称 
 */
@property (nonatomic, copy) NSString *name;
/**
 *  跳转目标相册的ID
 */
@property (nonatomic, copy) NSString *target;

@end
