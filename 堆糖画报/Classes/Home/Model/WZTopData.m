//
//  WZTopData.m
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/3.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "WZTopData.h"

@implementation WZTopData
+ (instancetype)dataWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.desc= dict[@"description"];
        self.enabled_at_str=dict[@"enabled_at_str"];
        self.image_url= dict[@"image_url"];
    }
    return self;
}

@end
