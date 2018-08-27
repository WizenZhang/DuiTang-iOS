//
//  WZDetailHeadData.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"
#import "WZSubCates.h"
@interface WZDetailHeadData : JSONModel
/**
 *  画报的名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  分类的目录项
 */
@property (nonatomic,strong) NSArray< WZSubCates> *sub_cates;
@end
