//
//  WZHeadData.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZHomeHeadData : NSObject
/**
 *  顶部画报的描述
 */
@property (nonatomic, copy) NSString *desc;
/**
 *  顶部画报的时间
 */
@property (nonatomic, copy) NSString *enabled_at_str;
/**
 *  顶部画报的配图
 */
@property (nonatomic, copy) NSString *image_url;
/**
 *  跳转目标相册的ID
 */
@property (nonatomic, copy) NSString *target;

+ (instancetype)dataWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
