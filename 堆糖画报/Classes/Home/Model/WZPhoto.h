//
//  WZPhoto.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/6.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZPhoto : NSObject
/**
 *  画报的配图路径
 */
@property (nonatomic, copy) NSString *path;
///**
// *  画报的配图宽度
// */
@property (nonatomic, weak) NSNumber *width;
///**
// *  画报的配图高度
// */
@property (nonatomic, weak) NSNumber *height;

@end
