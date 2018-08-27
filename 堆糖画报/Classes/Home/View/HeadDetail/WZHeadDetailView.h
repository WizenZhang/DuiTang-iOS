//
//  WZHeadDetailView.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/18.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WZHeadDetailData;

@interface WZHeadDetailView : UIView
/**
 *  画报的详情模型数据
 */
@property(nonatomic,strong)WZHeadDetailData *data;
/**背景毛玻璃处理图片路径*/
@property(nonatomic,copy)NSString *path;
@end
