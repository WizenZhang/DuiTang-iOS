//
//  WaterFallHeader.m
//  CollectionView
//
//  Created by d2space on 14-2-27.
//  Copyright (c) 2014年 D2space. All rights reserved.
//

#import "WaterFallHeader.h"
#import "WZHomeHeadView.h"
@implementation WaterFallHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //图片轮播器添加头部显示
        [self addSubview:[WZHomeHeadView headerView]];
    }
    return self;
}
@end
