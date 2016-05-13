//
//  WZPhoto.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface WZPhoto : JSONModel
/**
 *  画报的配图路径
 */
@property (nonatomic, copy) NSString *path;
/**
 *  画报的配图宽度
 */
@property (nonatomic, assign)int width;
/**
 *  画报的配图高度
 */
@property (nonatomic, assign)int height;

@end
