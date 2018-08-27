//
//  WZDrawerRightModel.h
//  堆糖画报
//
//  Created by Wizen Zhang on 16/5/29.
//  Copyright (c) 2016年 Wizen Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZDrawerRightPhoto.h"
#import "JSONModel.h"

@interface WZDrawerRightModel : JSONModel
/**抽屉左侧tableView标题*/
@property(nonatomic,copy)NSString *name;
/**抽屉左侧tableView点击跳转ID*/
@property(nonatomic,copy)NSString *id;
/**抽屉左侧tableView成员数目*/
@property(nonatomic,assign)int member_count;
/**抽屉左侧tableView图片*/
@property(nonatomic,strong)WZDrawerRightPhoto *photo;
@end
