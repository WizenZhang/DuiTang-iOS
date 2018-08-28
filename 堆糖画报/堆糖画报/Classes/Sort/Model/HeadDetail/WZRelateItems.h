//
//  WZRelateItems.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/21.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import "JSONModel.h"
@protocol WZRelateItems
@end
@interface WZRelateItems : JSONModel
/**相关主题items跳转目标ID*/
@property (nonatomic,copy) NSString *target;
/**相关主题配图*/
@property (nonatomic,copy) NSString *image;
/**相关主题名称*/
@property (nonatomic,copy) NSString *name;
@end
