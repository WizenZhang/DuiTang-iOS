//
//  WZData_src.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"
@protocol WZData_src
@end
@interface WZData_src : JSONModel
/**加载分类资源ID*/
@property (nonatomic,copy) NSString *filter_id;
@end
