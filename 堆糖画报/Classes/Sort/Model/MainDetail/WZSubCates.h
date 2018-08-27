//
//  WZSubCates.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"
@protocol WZSubCates
@end
@interface WZSubCates : JSONModel
/**
 *  画报的名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  画报的主题名
 */
@property (nonatomic, copy) NSString *theme_name;
@end
