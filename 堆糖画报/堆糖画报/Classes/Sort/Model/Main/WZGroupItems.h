//
//  WZGroupItems.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/19.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol WZGroupItems
@end
@interface WZGroupItems : JSONModel
/**
 *  画报的所属相册名称 */
@property (nonatomic, copy) NSString *name;
/**
 *  跳转目标相册的ID
 */
@property (nonatomic, copy) NSString *target;
@end
